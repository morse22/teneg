package kr.co.teneg.auction;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teneg.request.RequestService;
import kr.co.teneg.request.RequestVO;

@Controller
public class AuctionController {
	@Autowired
	private AuctionService acService;
	@Autowired
	private RequestService reqService;

	
	@RequestMapping("/auction/auction.do")
	public ModelAndView auction(@RequestParam("no") int no){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("auction/auction");
		mav.addObject("selected", acService.selectedJoin(no));

		RequestVO request = reqService.detail(no);
		mav.addObject("request", request);


		return mav;
	}
	@RequestMapping(value="/auction/auction.do" , method= RequestMethod.POST)
	public String auction(AuctionVO auctionVO, Model model  ){
		acService.join(auctionVO);
		return "redirect:/auction/auction.do?no="+auctionVO.getRequestNo();
	}
	@ResponseBody
	@RequestMapping("/auction/auctionCheck.do/{no}")
	public String auctionCheck(@PathVariable("no") int requestNo, Model model  ){
		AuctionVO auction = acService.selectedJoin(requestNo);
		return ""+auction.getPrice();
	}
	
	@RequestMapping("/auction/joinList.do/{requestNo}")
	public ModelAndView joinList(@PathVariable("requestNo") int requestNo){
		
		ModelAndView mav = new ModelAndView();
		List<AuctionVO> list = acService.joinList(requestNo);
		mav.addObject("joinList", list);
		mav.setViewName("auction/joinList");
		return mav;
	}
	
	
	@RequestMapping("/auction/{no}/{auctionDate}/joinList.do/{requestNo}")
	public ModelAndView joinList(@PathVariable("auctionDate") String auctionDate, @PathVariable("requestNo") int requestNo, @PathVariable("no") int no){
		
		ModelAndView mav = new ModelAndView();
		acService.choice(no);
		AuctionVO auction = new AuctionVO();
		auction.setNo(no);
		auction.setRequestNo(requestNo);
		auction.setAuctionDate(auctionDate);
		
		acService.choiceCancel(auction);
		mav.setViewName("redirect:/auction/joinList.do/"+requestNo);
		return mav;
	}
	
	@RequestMapping("/auction/joinList.do/{no}/{requestNo}")
	public ModelAndView joinListFinal(@PathVariable("requestNo") int requestNo, @PathVariable("no") int no){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/auction/joinList.do/"+requestNo);
		return mav;
	}
	
	//////////////////////////////////////////////////
	@RequestMapping("/auction/test.do")
	public String test(){
		return "auction/test";
	}
	
	// stanby selected
	@ResponseBody
	@RequestMapping("/auction/listByNo.do")
	public List<AuctionVO> listByNo(@RequestParam int requestNo){
		return acService.joinList(requestNo);
	}
	
	@ResponseBody
	@RequestMapping("/auction/getSelectedByNo.do")
	public AuctionVO getSelectedByNo(@RequestParam int requestNo){
		return acService.selectedJoin(requestNo);
	}
	
	@ResponseBody
	@RequestMapping("/auction/setSelected.do")
	public String setSelected(@RequestParam int no, @RequestParam int requestNo){
		acService.choice(no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("requestNo", requestNo);
		map.put("no", no);
		acService.deleteNotNo(map);
		return "yes";
	}
	
	@ResponseBody
	@RequestMapping("/auction/finish.do")
	public String finish(@RequestParam int requestNo, @RequestParam String expertId, @RequestParam int finalPrice){
		acService.finishAuction(requestNo, expertId, finalPrice);
		return "yes";
	}
}
