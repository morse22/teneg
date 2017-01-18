package kr.co.teneg.faq;

import java.io.File;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

	@Controller
	@SessionAttributes("vo")
	public class faqController {
	
		@Autowired
		private QnAService service;
		
		
		@RequestMapping("/qna/QnAList.do")
		public String BoardFAQList(Model model,
				@RequestParam (required = false, defaultValue = "all")String search_option, 
				@RequestParam(required = false, defaultValue = "") String search_keyword,
				@RequestParam(required=false, defaultValue="allNEW")String search_option_date,
				@RequestParam (defaultValue="1") int curPage){
			int count = service.QnACount(search_option,search_keyword);
			pageDAO page = new pageDAO(count, curPage);
			int start=page.getStartPage();
			int end = page.getEndPage();
		
			String search_keyword2 =null;
			String search_keyword3 =search_keyword;
			
			String[] array = new String[2]; 
			array= search_keyword.split(" ");
			search_keyword2=array[0];
			if(array.length>1){
				search_keyword3=array[1];
			}
			List<faqVO> list=
					service.FAQList(search_option_date,search_option,search_keyword,search_keyword2,search_keyword3,start,end);
			
			model.addAttribute("items", list);
			model.addAttribute("page",page);
			model.addAttribute("search_option",search_option);
			model.addAttribute("search_keyword",search_keyword);
			model.addAttribute("search_option_date",search_option_date);
			return "faq/main";
		}

		@RequestMapping(value="/qna/boardFAO.do",method=RequestMethod.GET)
		public String boardFAQ(){
			return "faq/FAQinsert";
		}
		
		@RequestMapping(value="/qna/boardFAO.do",method=RequestMethod.POST)
		public String boardFAQ_Pro(faqVO vo, HttpSession session){
			String filename="";
			if(!vo.getFile1().isEmpty()){
				filename=vo.getFile1().getOriginalFilename()+"_"+System.currentTimeMillis();
				String path="D:\\Lecture\\Work-Space\\TeneG\\src\\main\\webapp\\view\\";
				try{
					new File(path).mkdir();
					vo.getFile1().transferTo(new File(path + filename));
				}catch(Exception e){
					e.printStackTrace();
				}
			}else if(vo.getFile1().isEmpty()){
				filename="파일없음";
			}
			String userid = (String) session.getAttribute("id");
			System.out.println(userid);
			String content = vo.getContent();
			content = content.replace("<", "&lt");
			content = content.replace(">", "&gt");
			content = content.replace("  ", "&nbsp;&nbsp;");
			content = content.replace("\n", "<br>");
			
			String title = vo.getTitle();
			title = title.replace("<", "&lt");
			title = title.replace(">", "&gt");
			title = title.replace("  ", "&nbsp;&nbsp;");
			title = title.replace("\n", "<br>");
			
			vo.setWriter(userid);			
			vo.setContent(content);
			vo.setTitle(title);
			vo.setPictureUrl(filename);
			service.FAQInsert(vo);
			return "redirect:/qna/QnAList.do";
		}

		@RequestMapping(value="/faq/update.do", method=RequestMethod.GET)
		public String FaqUpdate(@RequestParam int no, Model model){
			faqVO vo = service.FAQDetail(no);
			
			model.addAttribute("vo", vo);
			
			return "faq/FAQupdate";
		}
		@RequestMapping(value="/faq/update.do", method=RequestMethod.POST)
		public String FaqUpdate_Pro(faqVO vo, Model model){
	
			service.FaqUpdate(vo);
			
			return "faq/FAQreturn";
		}
		@RequestMapping("/faq/delete.do")
		public String FaqDelete(@RequestParam int no){
			service.FaqDelete(no);
				
			return "faq/FAQreturn";
		}
		

	//==========================================================================================================
		
	@RequestMapping(value="/qna/insertQna.do", method=RequestMethod.GET)
		public String QnA(Model model,
				@RequestParam (required = false, defaultValue = "all")String search_option, 
				@RequestParam(required = false, defaultValue = "") String search_keyword,
				@RequestParam(required=false, defaultValue="allNEW")String search_option_date,
				@RequestParam (defaultValue="1") int curPage){
			int count = service.QnACount(search_option,search_keyword);
			pageDAO page = new pageDAO(count, curPage);
			int start=page.getStartPage();
			int end = page.getEndPage();
			String search_keyword2 =null;
			String search_keyword3 =search_keyword;
			
			String[] array = new String[2]; 
			array= search_keyword.split(" ");
			search_keyword2=array[0];
			if(array.length>1){
				search_keyword3=array[1];
			}
			
			
			
			List<faqVO> list=
					service.FAQList_qna(search_option_date,search_option,search_keyword,search_keyword2,search_keyword3,start,end);
			
			model.addAttribute("items", list);
			model.addAttribute("page",page);
			model.addAttribute("search_option",search_option);
			model.addAttribute("search_keyword",search_keyword);
			model.addAttribute("search_option_date",search_option_date);
			
			
			return "faq/qanForm";
		}
	
	
	
	
	
		@RequestMapping(value="/qna/insertQna.do", method=RequestMethod.POST)
		public String QnA_Pro(qnaVO vo, HttpSession session){
				String content = vo.getContent();
				content = content.replace("<", "&lt");
				content = content.replace(">", "&gt");
				content = content.replace("  ", "&nbsp;&nbsp;");
				content = content.replace("\n", "<br>");
				
				String title = vo.getTitle();
				title = title.replace("<", "&lt");
				title = title.replace(">", "&gt");
				title = title.replace("  ", "&nbsp;&nbsp;");
				title = title.replace("\n", "<br>");
				String userid = (String) session.getAttribute("id");
				vo.setWriter(userid);
				vo.setTitle(title);
				vo.setContent(content);
				service.QNAInsert(vo);
			return "redirect:/qna/QnAList.do";
		}
		
		@RequestMapping("/qna/myPageQna.do")
		public String qnaList(Model model){
			List<qnaVO> list = service.QNAList();
			model.addAttribute("vo", list);
			
			return "faq/MyPageQnA";
		}
		@RequestMapping("/qna/qnaDetail.do")
		public String qnaDetail(@RequestParam int no, Model model){
			qnaVO vo = service.QNADetail(no);
			model.addAttribute("vo",vo);
			return "qna/QnADetail";
		}
		
		@RequestMapping(value="/qna/qnaRef.do")
		public String qnaRef_Pro(@ModelAttribute qnaVO vo){
			String answer = vo.getAnswer();
			answer = answer.replace("<", "&lt");
			answer = answer.replace(">", "&gt");
			answer = answer.replace("  ", "&nbsp;&nbsp;");
			answer = answer.replace("\n", "<br>");
			
			vo.setAnswer(answer);
			service.QNARefInsert(vo);
			return "redirect:/qna/insertQna.do";
		}

	}


