package kr.co.teneg.message;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.teneg.faq.pageDAO;
import kr.co.teneg.member.MemberVO;

@Controller
public class messageController {
	
	@Autowired
	public MessageService messageService;
	
	@RequestMapping(value="/message/insert", method=RequestMethod.GET)
	public String insertForm(){
	
		return "message/insert";
	}
	
	@RequestMapping("/message/list")
	public String list(HttpSession session, Model model,
			@RequestParam (required = false, defaultValue = "all")String search_option, 
			@RequestParam(required = false, defaultValue = "") String search_keyword,
			@RequestParam(required=false, defaultValue="allNEW")String search_option_date,
			@RequestParam (defaultValue="1") int curPage){
		String userid = (String) session.getAttribute("id");
		int count = messageService.ListCount(search_option,search_keyword,userid);
		pageDAO page = new pageDAO(count, curPage);
		int start = page.getStartPage();
		int end   = page.getEndPage();

		
		String search_keyword2 =null; 	
		String search_keyword3 =search_keyword;
		
		String[] array = new String[2]; 
		array= search_keyword.split(" ");
		search_keyword2=array[0];
		if(array.length>1){
			search_keyword3=array[1];
		}	
		List<MessageVO> list = messageService.MessageList(search_option_date,search_option,search_keyword,search_keyword2,search_keyword3,start,end,userid);
			model.addAttribute("page",page);
			model.addAttribute("search_option",search_option);
			model.addAttribute("search_keyword",search_keyword);
			model.addAttribute("search_option_date",search_option_date);
			model.addAttribute("items",list);		
		
		messageService.updatePop(userid);	
			return "message/MessageList";
		}
	
	@ResponseBody
	@RequestMapping(value="/msg/count", method=RequestMethod.POST)
	public int count(HttpSession session){
		String userid = (String) session.getAttribute("id");	
		int readNcount=messageService.readNcount(userid);						
						
			return readNcount;
	}
	@ResponseBody
	@RequestMapping(value="/msg/count2", method=RequestMethod.POST)
	public int count2(HttpSession session){
			String userid = (String) session.getAttribute("id");	
		int readYcount=messageService.readYcount(userid);						
			
			return readYcount;
	}


	@RequestMapping(value="/msg/deletemsg", method=RequestMethod.POST)
	public String deleteMsg(@RequestParam(value="lists[]") List<Integer> param){
		ArrayList<Integer> list = new ArrayList<>();
			list.addAll(param);
			messageService.delete(list);
			return "redirect:/message/list";
	}
	@ResponseBody
	@RequestMapping(value="/msg/opendate", method=RequestMethod.POST)
	public int open(HttpSession session){
		String userid = (String) session.getAttribute("id");
		int opendate= messageService.readDate(userid);
		return opendate;
	}	
	@ResponseBody
	@RequestMapping(value="/msg/update_pop.do", method=RequestMethod.POST)
	public void update_pop(HttpSession session){
		String userid = (String)session.getAttribute("id");
		messageService.updatePop(userid);
		messageService.MsgUpdate(userid);
	}
	@ResponseBody
	@RequestMapping(value="/msg/updateValue.do", method=RequestMethod.POST)
	public int pop_value(HttpSession session){
		String userid = (String)session.getAttribute("id");
		int num=messageService.updateVlaue(userid);
		return num;
	}

}



