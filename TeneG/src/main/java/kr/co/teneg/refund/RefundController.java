package kr.co.teneg.refund;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class RefundController {
	@Autowired
	private RefundService service;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value="refund/write.do/{id}/{requestNo}/{expertId}", method=RequestMethod.GET)
	public String writeForm(@PathVariable String id, @PathVariable String requestNo, @PathVariable String expertId, Model model){
		model.addAttribute("requestNo", requestNo);
		model.addAttribute("expertId", expertId);
		model.addAttribute("id", id);
		return "popup/refundForm";
	}
	
	@RequestMapping(value="refund/write.do", method=RequestMethod.POST)
	public void write(RefundVO vo){
		service.insert(vo);
	}
	
	@RequestMapping("/refund/Plist.do")
	public String pList(Model model){
		model.addAttribute("list", service.plist());
		return "refund/plist";
	}
	
	@RequestMapping("/refund/detail.do/{requestNo}")
	public String detail(@PathVariable int requestNo, Model model){
		model.addAttribute("refund", service.selectByNo(requestNo));
		return "refund/refundDetail";
	}
	
	@ResponseBody
	@RequestMapping("/refund/refundOK.do")
	public String refundOK(@RequestParam int requestNo){
		service.refundOK(requestNo);
		return "yes";
	}
	
	@RequestMapping("/refund/noRefund.do/{requestNo}/{id}/{expertId}")
	public String noRefund(@PathVariable int requestNo, @PathVariable String id, @PathVariable String expertId, Model model){
		model.addAttribute("requestNo", requestNo);
		model.addAttribute("id", id);
		model.addAttribute("expertId", expertId);
		return "refund/noRefundForm";
	}
	
	@ResponseBody
	@RequestMapping("/refund/doRR.do")
	public String doRR(@RequestParam String replyContent, @RequestParam int requestNo, MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException{
		RefundVO vo = new RefundVO();
		String uploadDir = servletContext.getRealPath("/upload/");
		Iterator<String> iter = mRequest.getFileNames();
		String formFileName = iter.next();
		MultipartFile mFile = mRequest.getFile(formFileName);
		String oriFileName = mFile.getOriginalFilename();
		
		if(oriFileName != null && !oriFileName.equals("")) {
		
			String ext = "";
			int index = oriFileName.lastIndexOf(".");
			if (index != -1) {
				ext = oriFileName.substring(index);
			}
			
			String saveFileName = "RR-" + requestNo + ext;
			mFile.transferTo(new File(uploadDir + "/" + saveFileName));
			vo.setSaveFileName(saveFileName);
		}
		vo.setRequestNo(requestNo);
		vo.setReplyContent(replyContent);
		service.doRR(vo);
		return "yes";
	}
	
	@RequestMapping("/refund/replyDetail.do/{requestNo}")
	public String replyDetail(@PathVariable int requestNo, Model model){
		model.addAttribute("refund", service.selectByNo(requestNo));
		return "refund/replyDetail";
	}
}
