package kr.co.teneg.response;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teneg.dbVO.ResponseListVO;

@Controller
public class ResponseController {

	@Autowired
	private ResponseService service;

	@RequestMapping(value = "/response/response.do", method = RequestMethod.POST)
	public ModelAndView response2(ResponseVO responseVO){
		ModelAndView mav = new ModelAndView("redirect:/");
		int responseNo = service.getNextRequestNo2();
		responseVO.setNo(responseNo);

		service.response(responseVO);
		return mav;
	}
	
	@RequestMapping("/response/list.do")
	public ModelAndView list(@RequestParam("id") String id) {
		
		service.read();
		// 이 아이디는 로그인한 아이디임
		
		List<ResponseListVO> list = service.list(id);
		
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("response", list);
		mav.setViewName("response/list");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/response/acceptcount", method=RequestMethod.POST)
	public int acceptcount(@RequestParam("id") String id){

		int readNcount = service.readNcount(id);
	    return readNcount;
	}
		
}
