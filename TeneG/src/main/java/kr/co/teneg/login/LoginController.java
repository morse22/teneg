package kr.co.teneg.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value="/login/login.do", method=RequestMethod.GET)
	public String login(HttpServletRequest request){
		request.getSession().setAttribute("loginUser", "user");
		return "redirect:/";
	}
	
	@RequestMapping(value="/login/logout.do", method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		return "redirect:/";
	}
}
