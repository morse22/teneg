package kr.co.teneg.requestWaiting;

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

import kr.co.teneg.dbVO.RequestMyWaitingVO;
import kr.co.teneg.request.RequestService;
import kr.co.teneg.response.ResponseService;
import kr.co.teneg.response.ResponseVO;

@Controller
public class RequestWaitingController {
	
	@Autowired
	private RequestWaitingService service;

	@Autowired
	private RequestService requestService;
	
	@Autowired
	private ResponseService responseService;
	
	@RequestMapping("/response/responseCheck.do/{requestNo}/{id}")
	public String waitingCheck(@PathVariable int requestNo, @PathVariable String id, Model model){
		RequestWaitingVO vo = new RequestWaitingVO();
		vo.setRequestNo(requestNo);
		vo.setExpertId(id);
		RequestWaitingVO result = service.select(vo);
		
		
		model.addAttribute("result", (result == null) ? "no" : "yes");
		if(result != null){
			model.addAttribute("regDate", result.getRegDate());
		}
		return "/ajax/responseCheckResult";
	}
	
	@RequestMapping("/response/recommend.do/{requestNo}/{id}")
	public void insert(@PathVariable int requestNo, @PathVariable String id, Model model){
		RequestWaitingVO vo = new RequestWaitingVO();
		vo.setRequestNo(requestNo);
		vo.setExpertId(id);
		service.insert(vo);
	}
	
	@RequestMapping("/requestwaiting/list.do")
	public ModelAndView list(@RequestParam("id") String id) {
		
		service.read();
		
		
		List<RequestMyWaitingVO> list = service.list(id);
		
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("requestwaiting", list);
		mav.setViewName("requestwaiting/list");
		return mav;
	}
	
	///////////////////////////////// 추가 2017.1.03 //////////////////////////////////////////
	
	
	@RequestMapping("/requestwaiting/listByNo.do")
	public String listByNo(@RequestParam("no") int no, Model model){
		model.addAttribute("requestwaiting", service.selectByNo(no));
		return "requestwaiting/list";
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////////////
	

	   @ResponseBody
	   @RequestMapping(value="/requestwaiting/count", method=RequestMethod.POST)
	   public int waitingcount(@RequestParam("id") String id){
	         int readNcount=service.readNcount(id);  
	         return readNcount;
	   }


	@RequestMapping("/requestwaiting/accept.do")
	public String accept(@RequestParam("requestNo") int requestNo, @RequestParam("expertId") String expertId, @RequestParam("id") String id) {
		//id는 유저아이디임
		
		// request에 대기중 이던것을 진행중으로 바꿔야함. t_request 의 status부분 / request에서 진행중으로되었으므로 메인페이지에 출력하지않게  메인에서 출력하지않게바꾸는부분은  아직 수정안합 동규형꺼랑 합한후에 수정하기
		requestService.progress(requestNo);
		
		ResponseVO responseVO = new ResponseVO();
		responseVO.setNo( responseService.getNextRequestNo2());
		responseVO.setExpertId(expertId);
		responseVO.setRequestNo(requestNo);
			
		responseService.response(responseVO);
		service.waitingdelete(requestNo);
		
		return "redirect:/";
	}


	@ResponseBody
	@RequestMapping(value="/requestwaiting/acceptcount", method=RequestMethod.POST)
	public int acceptcount(@RequestParam("id") String id){
		
	//	int readNcount = responseService.readNcount(id);
		int readNcount = service.readNcount(id);
	    return readNcount;
	}


}
