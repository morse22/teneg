package kr.co.teneg.eggGift;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teneg.eggCharge.EggChargeService;

@Controller
public class EggGiftController {
	@Autowired 
	private EggGiftService service;

	
	@RequestMapping(value="/egg/gift.do", method = RequestMethod.POST)
	public ModelAndView giftForm(EggGiftVO giftVO ){
		ModelAndView mav = new ModelAndView();
		service.gift(giftVO);
		mav.setViewName("redirect:/egg/giftList.do/"+ giftVO.getSender()+ "/all");
		return mav;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/egg/checkGift.do/{receiver}/{egg}/{sender}")
	public String checkGift(@PathVariable("receiver") String receiver, @PathVariable("egg") int egg,@PathVariable("sender") String sender ){
		return service.checkGift(receiver,  sender); 
	}
	
	@RequestMapping("/egg/giftList.do/{id}/{sort}")
	public String giftList(@PathVariable("id") String id, @PathVariable("sort") String sort, Model model){
		model.addAttribute("sort", sort);
		List<EggGiftVO> list = service.giftList(id);
		List<EggGiftVO> sortList = new ArrayList<EggGiftVO>();
		if(sort.equals("send")){
			for(int i = 0; i < list.size(); i ++){
				if(list.get(i).getSender().equals(id)){
					sortList.add(list.get(i));
				}
			}
			model.addAttribute("list", sortList);
		}
		if(sort.equals("receive")){
			for(int i = 0; i < list.size(); i ++){
				if(list.get(i).getReceiver().equals(id)){
					sortList.add(list.get(i));
				}
			}
			model.addAttribute("list", sortList);
			
		}
		if(sort.equals("all")){model.addAttribute("list", list);}
		
		return "egg/giftList";
	}
	
}
