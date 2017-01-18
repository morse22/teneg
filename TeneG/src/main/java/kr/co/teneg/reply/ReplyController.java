package kr.co.teneg.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyServiceImp service;
	
	@RequestMapping("/boardReply/write.do")
	public String boardReplyWrite(@RequestParam("no") int no
			, @RequestParam("replyContent") String content
			, @RequestParam("writer") String writer
			, @RequestParam("page") int page
			, @RequestParam("pc") int pc){
		ReplyVO reply = new ReplyVO();
		reply.setBoardNo(no);
		reply.setContent(content);
		reply.setWriter(writer);
		
		service.insert(reply);
		return "redirect:/board/" + page +"/" + pc + "/detail.do/" + no;
	}
	
	@RequestMapping("/boardReply/rrwrite.do")
	public String boardRReplyWrite(@RequestParam("no") int no
			, @RequestParam("replyContent") String content
			, @RequestParam("writer") String writer
			, @RequestParam("page") int page
			, @RequestParam("groupNo") int groupNo
			, @RequestParam("parentId") String parentId
			, @RequestParam("pc") int pc){
		
		ReplyVO reply = new ReplyVO();
		reply.setBoardNo(no);
		reply.setContent(content);
		reply.setWriter(writer);
		reply.setParentId(parentId);
		reply.setGroupNo(groupNo);
		service.insertRR(reply);
		return "redirect:/board/" + page + "/" + pc +"/detail.do/" + no;
	}
	
	@RequestMapping("/reply/{no}/{page}/{pc}/delete.do/{boardNo}")
	public String delete(@PathVariable int no, @PathVariable int boardNo, @PathVariable int page, @PathVariable int pc){
		service.delete(no);
		return "redirect:/board/" + page + "/" + pc + "/detail.do/" + boardNo;
	}
	
}
