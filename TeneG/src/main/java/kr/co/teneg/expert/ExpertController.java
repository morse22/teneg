package kr.co.teneg.expert;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teneg.request.RequestService;
import kr.co.teneg.request.RequestVO;
import kr.co.teneg.response.ResponseService;
import kr.co.teneg.review.ReviewService;

@Controller
public class ExpertController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private ExpertService service;
	
	@Autowired
	private ResponseService responseService;
	
	@Autowired 
	private RequestService requestService;
	
	@Autowired
	private ReviewService review_service;
	
	@RequestMapping(value="/expert/write.do", method=RequestMethod.GET)
	public String writeForm(){
		return "expert/writeForm";
	}
	
	@RequestMapping(value="/expert/write.do", method=RequestMethod.POST)
	public ModelAndView write(ExpertVO expertVO, MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException{
		String uploadDir = servletContext.getRealPath("/expertFile/");

		ModelAndView mav = new ModelAndView("redirect:/expert/list.do");

		Iterator<String> iter = mRequest.getFileNames();
		
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
				
				String saveFileName = "expertf-" + UUID.randomUUID().toString() + ext;
				
				mFile.transferTo(new File(uploadDir + "/" + saveFileName));
				
				if(formFileName.equals("atfile1")) expertVO.setTitleImage(saveFileName);
				if(formFileName.equals("atfile2")) expertVO.setMainImage(saveFileName);
			} 
		}
		service.insert(expertVO);
		return mav;
	}
	
	@RequestMapping("/expert/list.do")
	public String list(Model model){
		model.addAttribute("list", service.selectApproved());
		return "expert/list";
	}
	
	@RequestMapping("/expert/detail.do/{id}")
	public String detail(@PathVariable String id, Model model){
		model.addAttribute("expert", service.selectById(id));
		model.addAttribute("reviewList", review_service.selectById(id));
		return "expert/detail";
	}
	
	@RequestMapping("/expert/managerList.do")
	public String managerList(@RequestParam(defaultValue="all") String type, Model model){
		model.addAttribute("list", service.selectAll(type));
		return "expert/managerList";
	}
	
	@RequestMapping("/expert/approve.do/{id}")
	public String approve(@PathVariable String id){
		service.approve(id);
		return "redirect:/expert/managerList.do?type=all";
	}
	
	@RequestMapping("/expert/expertCheck.do/{id}")
	public String expertCheck(@PathVariable String id, Model model){
		ExpertVO vo = service.selectById(id);
		model.addAttribute("result", (vo == null) ? "yes" : "no");
		return "ajax/expertCheckResult";
	}
	
	@RequestMapping("/expert/searchItem.do/{searchText}")
	public String searchItem(@PathVariable String searchText, Model model){
		String temp = "%" + searchText + "%";
		
		List<ExpertVO> expertList = service.selectByText(temp);
		List<RequestVO> requestList = requestService.selectByText(temp);
		
		for(int i=0;i<expertList.size();i++){
			expertList.get(i).setTitle(makeEffect(expertList.get(i).getTitle(), searchText));
		}
		
		for(int i=0;i<requestList.size();i++){
			requestList.get(i).setTitle(makeEffect(requestList.get(i).getTitle(), searchText));
		}
		
		model.addAttribute("expertList", expertList);
		model.addAttribute("requestList", requestList);
		return "find/searchResult";
	}
	
	
	private String makeEffect(String text, String search){
		String span = "<span style=\"color:red; font-weight:bold; background-color: yellow;\">" + search + "</span>";
		return text.substring(0, text.indexOf(search)) + span + text.substring(text.indexOf(search)+search.length(), text.length());
	}
	
	@RequestMapping("/expert/workList.do/{id}")
	public String workList(@PathVariable String id, Model model){
		model.addAttribute("response", responseService.list(id));
		return "response/list";
	}
}














