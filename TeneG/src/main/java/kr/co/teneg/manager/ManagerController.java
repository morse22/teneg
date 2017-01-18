package kr.co.teneg.manager;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/manager/editad.do")
	public String editad(Model model){
		String uploadDir = servletContext.getRealPath("/upload");
		model.addAttribute("uploadDir", uploadDir);
		return "manager/editad";
	}
	@RequestMapping("/manager/memberManage.do")
	public String manage(Model model){
		return "manager/memberManage";
	}
	@RequestMapping("/manager/editBoardBanner.do")
	public String editBoardBanner(){
		return "manager/editBoardBanner";
	}
	
	@RequestMapping("/manager/mainAd.do")
	public String mainAd(){
		return "manager/mainAd";
	}
}
