package kr.co.teneg.eggExchange;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teneg.member.MemberService;
import kr.co.teneg.member.MemberVO;

@SessionAttributes("loginUser")
@Controller
public class EggExchangeController {
	
	@Autowired
	private EggExchangeService exService;
	 
	@Autowired 
	private MemberService memService;
	
	@RequestMapping("/egg/exchange.do")
	public String exchange(){
		return "egg/exchange";
	}
	
	@ResponseBody
	@RequestMapping(value="/egg/exchange.do", method=RequestMethod.POST)
	public String exchange(EggExchangeVO eggExchangeVO , Model model){
		exService.exchange(eggExchangeVO);
		exService.eggSub(eggExchangeVO);
		MemberVO member = new MemberVO();
		member.setId(eggExchangeVO.getId());
		member.setPassword(eggExchangeVO.getPassword());
		MemberVO memberVO = memService.login(member);
		model.addAttribute("loginUser", memberVO);
		return "";
	}
	@ResponseBody
	@RequestMapping("/egg/myEgg.do/{id}")
	public String myEgg(@PathVariable("id") String id, Model model){
		String egg = Integer.toString(exService.myEgg(id));
		return egg;
	}
	
	@RequestMapping("/egg/exchangeList.do/{id}")
	public ModelAndView exchangelist(@PathVariable("id") String id,Model model){
		
		ModelAndView mav = new ModelAndView();
		List<EggExchangeVO> list = exService.exchangeList(id);
		for(int i = 0; i < list.size() ; i ++){
			list.get(i).setExchangeEgg(list.get(i).getAmount()/80);
		}
		MemberVO member = new MemberVO();
		member.setId(id);
		model.addAttribute("loginUser",memService.memberDetail(member));
		mav.addObject("exchangeList", list);
		mav.setViewName("egg/exchangeList");
		 
		return mav;
	}
	
}
