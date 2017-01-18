package kr.co.teneg.eggCharge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teneg.member.MemberService;
import kr.co.teneg.member.MemberVO;

@SessionAttributes("loginUser")
@Controller
public class EggChargeController {
	
	@Autowired
	private EggChargeService chService;
	
	@Autowired 
	private MemberService memService;
	
	@RequestMapping("/egg/charge.do")
	public String chargeForm(){
		return "egg/charge";
	}
	
	@RequestMapping(value="/egg/charge.do" , method=RequestMethod.POST)
	public String chargeForm(EggChargeVO eggChargeVO , String id, String password , Model model ){
		
		eggChargeVO.setChargeEgg(eggChargeVO.getAmount()/100);
		chService.charge(eggChargeVO);
		chService.eggAdd(eggChargeVO);
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPassword(password);
		MemberVO memberVO = memService.login(member);
		model.addAttribute("loginUser", memberVO);
		return "redirect:/egg/chargeList.do/"+id;
	}
	
	
	@RequestMapping("/egg/chargeList.do/{id}")
	public ModelAndView chargelist(@PathVariable("id") String id){
		
		ModelAndView mav = new ModelAndView();
		List<EggChargeVO> list = chService.chargeList(id);
		for(int i = 0; i < list.size() ; i ++){
			list.get(i).setChargeEgg(list.get(i).getAmount()/100);
		}
		mav.addObject("chargeList", list);
		mav.setViewName("egg/chargeList");
		 
		return mav;
	}
	
	
	
}
