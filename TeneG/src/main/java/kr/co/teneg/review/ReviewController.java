package kr.co.teneg.review;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.teneg.member.MemberService;
import kr.co.teneg.request.RequestService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@Autowired 
	private RequestService requestService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/review/write.do/{no}/{expertId}/{id}/{price}",  method=RequestMethod.GET)
	public String writeForm(@PathVariable int no, @PathVariable String expertId, @PathVariable String id,  @PathVariable int price, Model model){
		model.addAttribute("no", no);
		model.addAttribute("expertId", expertId);
		model.addAttribute("id", id);
		model.addAttribute("price", price);
		return "review/writeForm";
	}
	
	@RequestMapping(value="/review/write.do",  method=RequestMethod.POST)
	public void write(ReviewVO reviewVO){
		requestService.doComplete(reviewVO.getRequestNo());
		service.insert(reviewVO);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("price", reviewVO.getPrice());
		map.put("id", reviewVO.getExpertId());
		memberService.addEgg(map);
	}
}
