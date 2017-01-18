package kr.co.teneg.boardGood;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardGoodController {
	
	@Autowired
	private BoardGoodService service;
	
	@RequestMapping("/good/goodCheck.do/{boardNo}/{id}")
	public String goodCheck(@PathVariable int boardNo, @PathVariable String id, Model model){
		BoardGoodVO vo = new BoardGoodVO();
		vo.setBoardNo(boardNo);
		vo.setId(id);
		BoardGoodVO result = service.select(vo);
		model.addAttribute("result", (result == null) ? "no" : "yes");
		if(result != null){
			model.addAttribute("regDate", result.getRegDate());
		}
		return "/ajax/goodCheckResult";
	}
	
	@RequestMapping("/good/recommend.do/{boardNo}/{id}")
	public void insert(@PathVariable int boardNo, @PathVariable String id, Model model){
		BoardGoodVO vo = new BoardGoodVO();
		vo.setBoardNo(boardNo);
		vo.setId(id);
		service.insert(vo);
	}
}
