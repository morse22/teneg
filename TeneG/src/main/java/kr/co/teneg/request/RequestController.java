package kr.co.teneg.request;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teneg.dbVO.BoardPageVO;
import kr.co.teneg.dbVO.RequestListVO;
import kr.co.teneg.dbVO.RequestQueryVO;
import kr.co.teneg.dbVO.RequestdetailVO;
import kr.co.teneg.response.ResponseService;

@Controller
public class RequestController {

	@Autowired
	private RequestService service;

	@Autowired
	private ResponseService responseService;
	
	@Autowired
	private ServletContext servletContext;


	@RequestMapping("/request/list.do/{field}/{status}")
	public ModelAndView list(@PathVariable String field, @PathVariable String status) {
		RequestVO vo = new RequestVO();
		vo.setField(field);
		vo.setStatus(status);
		List<RequestVO> list = service.list(vo);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", list);
		mav.addObject("field", field);
		mav.addObject("status", status);
		mav.setViewName("request/list");
		return mav;
	}

	@RequestMapping("/request/newList.do")
	public ModelAndView newList(@RequestParam("id") String id) {
	
		service.read(id);
		List<RequestVO> list = service.newList(id);
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("request", list);
		mav.setViewName("request/list");
		return mav;
	}

///////////////////////////////// 추가 2017.01.03 //////////////////////////////////
	@RequestMapping("/request/manage.do")
	public String manage(@RequestParam("id") String id, @RequestParam("type") String type, Model model) {
		List<RequestVO> list = null;
		List<RequestListVO> list2 = null;
		switch(type){
		case "myDList" :
			list = service.selectD(id);
			model.addAttribute("list", list);
			break;
		case "myPList" :
			list2 = service.selectP(id);
			model.addAttribute("list", list2);
			break;
		case "myCList" :
			list2 = service.selectC(id);
			model.addAttribute("list", list2);
			break;
		case "myAUCList" :
			list = service.selectAUC(id);
			model.addAttribute("list", list);
			break;
		}
		model.addAttribute("typeCount", service.getTypeCount(id));
		return "request/manage";
	}
//////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/request/write.do", method = RequestMethod.GET)
	public String requestForm(Model model) {
		return "request/requestForm";
	}

	@RequestMapping(value = "/request/write.do", method = RequestMethod.POST)
	public ModelAndView request(RequestVO requestVO, MultipartHttpServletRequest mRequest) throws Exception {

		if (requestVO.getPremium() == null)
			requestVO.setPremium("N");
		String uploadDir = servletContext.getRealPath("/upload/");

		ModelAndView mav = new ModelAndView("redirect:/");

		int requestNo = service.getNextRequestNo();

		Iterator<String> iter = mRequest.getFileNames();

		requestVO.setNo(requestNo);

		while (iter.hasNext()) {

			String formFileName = iter.next();

			MultipartFile mFile = mRequest.getFile(formFileName);

			String oriFileName = mFile.getOriginalFilename();

			if (oriFileName != null && !oriFileName.equals("")) {

				String ext = "";
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					ext = oriFileName.substring(index);
				}

				String saveFileName = "mlec-" + UUID.randomUUID().toString() + ext;

				mFile.transferTo(new File(uploadDir + "/" + saveFileName));
				requestVO.setSaveFileName(saveFileName);
			}
		}
		if(requestVO.getStatus().equals("AUC")) service.auctionInsert(requestVO);
		else service.insert(requestVO); // 여기 안에 egg까는 dao도 있음
		service.insertmessage(requestVO);
		return mav;
	}

	@RequestMapping("/request/detail.do")
	public ModelAndView detail(@RequestParam("no") int no,@RequestParam("id") String id) {
		RequestQueryVO requestQueryVO = new RequestQueryVO();
		requestQueryVO.setExpertId(id);
		requestQueryVO.setRequestNo(no);
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("request/detail");

		RequestdetailVO request = service.requestExpertDetail(requestQueryVO);
		mav.addObject("request", request);

		return mav;
	}

	@RequestMapping("/request/delete.do")
	public String delete(@RequestParam("no") int no) {

		service.delete(no);
		return "redirect:/";
	}

	@RequestMapping(value = "/request/update.do", method = RequestMethod.GET)
	public String updateForm(@RequestParam("no") int no, Model model) {
		RequestVO request = service.detail(no);
		
		String deadline= request.getDeadline();
		deadline=deadline.substring(0,deadline.length()-1);
		
		request.setDeadline(deadline);
		
		model.addAttribute("request", request);
		return "request/updateForm";
	}

	@RequestMapping(value = "/request/update.do", method = RequestMethod.POST)
	public String update(@ModelAttribute RequestVO request, @RequestParam("no") int no) {
		request.setNo(no);

		service.update(request);
		return "redirect:/request/detail.do?no=" + no;
	}


	@ResponseBody
	@RequestMapping(value="/request/requestcount", method=RequestMethod.POST)
	public int acceptcount(@RequestParam("id") String id){
	
		int readNcount = service.readNcount(id);	
	    return readNcount;
	}

	@RequestMapping("request/doDComplete.do/{requestNo}")
	public String doComplete(@PathVariable int requestNo, MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException{
		String uploadDir = servletContext.getRealPath("/finalFile/");
		RequestVO vo = new RequestVO();
		vo.setNo(requestNo);
		
		Iterator<String> iter = mRequest.getFileNames();
		
		String formFileName = iter.next();

		MultipartFile mFile = mRequest.getFile(formFileName);
		
		String oriFileName = mFile.getOriginalFilename();
		
		if(oriFileName != null && !oriFileName.equals("")) {
		
			String ext = "";
			int index = oriFileName.lastIndexOf(".");
			if (index != -1) {
				ext = oriFileName.substring(index);
			}
			
			String saveFileName = "final-" + requestNo + ext;
			
			mFile.transferTo(new File(uploadDir + "/" + saveFileName));
			vo.setSaveFileName(saveFileName);
		} 
			
		service.doDComplete(requestNo);
		responseService.doComplete(vo);
		return "ajax/close";
	}
	
	@ResponseBody
	@RequestMapping("/request/changeProgress.do")
	public String changeProgress(@RequestParam("progress") int progress, @RequestParam("requestNo") int requestNo){
		RequestVO vo = new RequestVO();
		vo.setNo(requestNo);
		vo.setProgress(progress);
		service.setProgress(vo);
		return "";
	}
	
	// 대기 리스트 가기
	@RequestMapping("/request/dlist.do")
	public String dList(Model model, @RequestParam(defaultValue="all") String field,
			@RequestParam(defaultValue="jklj12390djk23jkjldkjl123013193dsfsd") String id){
		BoardPageVO vo = new BoardPageVO(1, 12);
		vo.setId(id);
		vo.setSearchType(field);
	 	List<RequestListVO> list = service.selectDD(vo);
		model.addAttribute("list", list);
		return "request/dlist";
	}
	
}





