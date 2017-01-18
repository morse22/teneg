package kr.co.teneg.popup;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PopupController {

	@RequestMapping("/popup/service.do")
	public String servicePopup(){
		return "popup/service";
	}
	
	@RequestMapping("/popup/help.do")
	public String helpPopup(){
		return "popup/help";
	}
	
	@RequestMapping("/popup/protect.do")
	public String protectPopup(){
		return "popup/protect";
	}
	
	@RequestMapping("/popup/findIdandPw.do")
	public String find(){
		return "find/findIdandPw";
	}
	
	@RequestMapping("/popup/certification.do/{id}")
	public String certification(@PathVariable String id, Model model){
		model.addAttribute("id", id);
		return "find/certification";
	}
	
	@RequestMapping("/popup/changePw.do/{id}")
	public String changePw(@PathVariable String id, Model model){
		model.addAttribute("id", id);
		return "find/changePw";
	}
	
	@RequestMapping("/popup/updateProgress.do")
	public String updateProgress(@RequestParam("requestNo") int requestNo, Model model){
		model.addAttribute("requestNo", requestNo);
		return "popup/updateProgress";
	}
	
	@RequestMapping("/popup/doDComplete.do")
	public String dcComplete(@RequestParam String requestNo, Model model){
		model.addAttribute("requestNo", requestNo);
		return "popup/completeFileUpload";
	}
	
}
