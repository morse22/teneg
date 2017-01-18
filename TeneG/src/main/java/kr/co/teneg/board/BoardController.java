package kr.co.teneg.board;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teneg.boardFile.BoardFileService;
import kr.co.teneg.boardFile.BoardFileVO;
import kr.co.teneg.boardGood.BoardGoodService;
import kr.co.teneg.dbVO.BoardDetailVO;
import kr.co.teneg.dbVO.BoardListVO;
import kr.co.teneg.dbVO.BoardPageVO;
import kr.co.teneg.reply.ReplyService;
import kr.co.teneg.reply.ReplyVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private BoardFileService boardFileService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private BoardGoodService boardGoodService;

	@RequestMapping("/board/list.do")
	public ModelAndView list(@RequestParam("pc") String pc
			, @RequestParam("page") String page
			, @RequestParam(value="sort", defaultValue="no") String sort
			, @RequestParam(value="period", defaultValue="all") String period
			, @RequestParam(value="searchType", defaultValue="content") String searchType
			, @RequestParam(value="searchText", defaultValue="") String searchText){
		
		double pageSize = Double.parseDouble(pc);
		int currentPage = Integer.parseInt(page);
	 	int totalCount = service.getTotalCount(); // 'noti', 'info' 빼고 전체 게시물 수
	 	int newBoardCount = service.newBoardCount(); // 오늘 등록 된 게시물 수
	 	ModelAndView mav = new ModelAndView();	
	 		 	
	 	int start, end;
	 	start = (int)(1 + (pageSize * (currentPage-1)));
	 	end = (int)(pageSize * currentPage);
	 	if(end > totalCount) end = totalCount;
	 	
	 	if(!searchType.equals("no")) searchText = "%" + searchText + "%";
	 	
	 	// System.out.println(sort);
	 	List<BoardListVO> notiInfoList = service.getNotiInfoList();
		List<BoardListVO> list = service.list(new BoardPageVO(start, end, sort, searchType, period, searchText));
		
		// System.out.println(list.size() + ", start : " + start + ", end : " + end );
		
		int listSize = list.size();
		for(int i=0; i<listSize ; i++){
			if(list.get(i).getRegDate().contains(":")) list.get(i).setIsNew("Y");
			else list.get(i).setIsNew("N");
		}
		
		mav.addObject("cpage", currentPage);
		mav.addObject("pCount", (int)pageSize);
		mav.addObject("pageSize", Math.ceil(totalCount/pageSize));
		mav.addObject("list", list);
		mav.addObject("notiInfoList", notiInfoList);
		mav.addObject("totalCount", totalCount);
		mav.addObject("newBoardCount", newBoardCount);
		mav.addObject("sort", sort);
		mav.addObject("searchType", searchType);
		mav.addObject("period", period);
		mav.setViewName("board/list");
		
		return mav;
	}
	
	@RequestMapping(value="/board/write.do", method=RequestMethod.GET)
	public String writeForm(Model model){
		return "board/writeForm";
	}
	
	@RequestMapping(value="/board/write.do", method=RequestMethod.POST)
	public ModelAndView write(BoardVO boardVO, MultipartHttpServletRequest mRequest) throws Exception{
	
		String uploadDir = servletContext.getRealPath("/upload/");

		ModelAndView mav = new ModelAndView("redirect:/board/list.do?pc=11&page=1");

		int boardNo = service.getNextBoardNo();
		
		Iterator<String> iter = mRequest.getFileNames();
		
		boardVO.setNo(boardNo);
		service.insert(boardVO);
		
		while(iter.hasNext()) {
			
			String formFileName = iter.next();

			MultipartFile mFile = mRequest.getFile(formFileName);
			
			String oriFileName = mFile.getOriginalFilename();
			
			if(oriFileName != null && !oriFileName.equals("")) {
			
				String ext = "";
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					ext = oriFileName.substring(index);
				}
				
				long fileSize = mFile.getSize();
				
				String saveFileName = "mlec-" + UUID.randomUUID().toString() + ext;
				
				mFile.transferTo(new File(uploadDir + "/" + saveFileName));
				
				BoardFileVO boardFile = new BoardFileVO();
				boardFile.setBoardNo(boardNo);
				boardFile.setSaveFileName(saveFileName);
				boardFile.setFileSize((int)fileSize);
				boardFile.setOriFileName(oriFileName);
				boardFileService.insert(boardFile);
			} 
		}
		return mav;
	}
	
	@RequestMapping("/board/{page}/{pc}/detail.do/{no}")
	public ModelAndView detail(@PathVariable("no") int no, @PathVariable int page, @PathVariable int pc){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/detail");
		
		service.incrementHit(no);
		int recommendCount = boardGoodService.countByBoardNo(no);
		
		BoardDetailVO board = service.detail(no);
		mav.addObject("board", board);
		
		List<BoardFileVO> list = boardFileService.selectByNo(no);
		mav.addObject("fileList", list);
		
		List<ReplyVO> replyList = replyService.selectByNo(no);
		mav.addObject("page", page);
		mav.addObject("pc", pc);
		mav.addObject("rcount", replyList.size());
		mav.addObject("replylist", replyList);
		mav.addObject("recommendCount", recommendCount);
		
		return mav;
	}
	
	@RequestMapping("/board/{no}/delete.do")
	public String delete(@PathVariable("no") int no){
/*		List<BoardFileVO> list = boardFileService.selectByNo(Integer.parseInt(no));
		for(int i=0;i<list.size();i++){
			File file = new File(list.get(i).getSaveFileName());
			file.delete();
		}*/
		service.delete(no);
		return "redirect:/board/list.do?pc=11&page=1";
	}
	
	@RequestMapping(value="/board/{page}/{pc}/update.do/{no}", method=RequestMethod.GET)
	public String updateForm(@PathVariable("no") int no, @PathVariable("page") int page, @PathVariable("pc") int pc, Model model){
		model.addAttribute("board", service.detail(no));
		model.addAttribute("no", no);
		model.addAttribute("page", page);
		model.addAttribute("pc", pc);
		return "board/updateForm";
	}
	
	@RequestMapping(value="/board/update.do", method=RequestMethod.POST)
	public String update(@ModelAttribute BoardVO board, @RequestParam("no") int no, @RequestParam("page") int page, @RequestParam("pc") int pc){
		board.setNo(no);
		service.update(board);
		return "redirect:/board/" + page + "/" + pc + "/detail.do/" + no;
	}
	
	@RequestMapping("/board/deleteList.do")
	public String deleteList(@RequestParam("query") String query){
		List<Integer> list = new ArrayList<Integer>();
		String[] datas = query.split(",");
		for(int i=0;i<datas.length;i++) list.add(Integer.parseInt(datas[i]));
		service.deleteList(list);
		return "redirect:/board/list.do?pc=11&page=1";
	}
}



























