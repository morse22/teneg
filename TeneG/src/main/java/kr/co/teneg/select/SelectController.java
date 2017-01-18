package kr.co.teneg.select;




import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.teneg.expert.ExpertService;
import kr.co.teneg.expert.ExpertVO;

@Controller
public class SelectController {

		@Autowired
		private ExpertService service;

		@Autowired
		private SelectService selectService;
		
		@RequestMapping("/select/selectForm.do")
		public String detail(@RequestParam String id, Model model){
			ExpertVO vo = service.selectById(id);
			model.addAttribute("vo",vo);
			return "select/selectForm";
		}
		
		@ResponseBody
		@RequestMapping(value="/select/select_Pro.do",method=RequestMethod.POST)
		public void select(@RequestParam String id, HttpSession session,SelectVO vo){
			String userid = (String)session.getAttribute("id");
			vo.setUserid(userid);
			vo.setExpertid(id);
			selectService.select(vo);
		
		}
		
		@RequestMapping("/select/selectList")
		public String selectList(HttpSession session, Model model,
								@RequestParam (required = false, defaultValue = "all")String search_option, 
								@RequestParam(required = false, defaultValue = "") String search_keyword){
			String userid = (String)session.getAttribute("id");
			
			List<SelectVO> list = selectService.list(userid, search_option, search_keyword);
			model.addAttribute("item",list);		
			model.addAttribute("search_option",search_option);
			model.addAttribute("search_keyword",search_keyword);
			
			return "select/Select_list";
		}

		@ResponseBody
		@RequestMapping(value="/select/select_ajax",method=RequestMethod.POST)
		public int select_ajax(@RequestParam String id,SelectVO vo,HttpSession session){
			String userid = (String)session.getAttribute("id");
			vo.setExpertid(id); 
			vo.setUserid(userid);
			int num = selectService.select_ajax(vo);
			return num;
		}

		@ResponseBody
		@RequestMapping(value="/select/select_delete.do",method=RequestMethod.POST)
		public void selet_delete(@RequestParam String id){
			selectService.delete(id);
		
		}
		@ResponseBody
		@RequestMapping(value="/select/select_count.do", method=RequestMethod.POST)
		public int select_count(HttpSession session){
			String userid = (String)session.getAttribute("id");
			int count=0;
			count=selectService.count(userid);
			return count;
			
		}

}
