package kr.co.teneg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teneg.dbVO.BoardPageVO;
import kr.co.teneg.dbVO.RequestListVO;
import kr.co.teneg.request.RequestService;
import kr.co.teneg.request.RequestVO;

@Controller
public class HomeController {

	@Autowired
	private RequestService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		
	 	List<RequestVO> list = service.selectDP();
	 	ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("login/error.do")
	public String loginError(){
		return "member/login";
	}
	
	@RequestMapping("ttt.do")
	public String tt(){
		return "find/test";
	}
	
	// 결과 더보기 구현
	@ResponseBody
	@RequestMapping("test.do")
	public List<RequestListVO> test(@RequestParam int start, @RequestParam int end
			, @RequestParam String field, @RequestParam(defaultValue="jklj12390djk23jkjldkjl123013193dsfsd") String id){
		BoardPageVO vo = new BoardPageVO(start, end);
		vo.setId(id);
		vo.setSearchType(field);
		List<RequestListVO> list = service.selectDD(vo);
		return list;
		//return "find/test";
	}
}
