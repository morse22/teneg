package kr.co.teneg.message;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

import kr.co.teneg.faq.faqVO;

@RestController
@RequestMapping("/msg/*")
public class messageRestController {

	@Autowired
	public MessageService messageService;
	
@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public ResponseEntity<String> insert(
			@RequestBody MessageVO vo, HttpSession session
			){
		ResponseEntity<String> entity =null;
		try{
			String userid = (String) session.getAttribute("id");
			vo.setSender(userid);
			String Recipient ="allmsg";
			if(vo.getRecipient() == ""){
				vo.setRecipient(Recipient);
			}
			messageService.insert(vo);
			entity= new ResponseEntity<String>("success", HttpStatus.OK); 
		}catch(Exception e){
			e.printStackTrace();
			entity= new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	
	
			@RequestMapping(value="/update/{no}", method={RequestMethod.PUT, RequestMethod.PATCH})
			public ResponseEntity<String> update(
				@PathVariable("no") int no, @RequestBody MessageVO vo, HttpSession session){
				ResponseEntity<String> entity =null;
				String userid = (String)session.getAttribute("id");
				try{
					vo.setRecipient(userid);
					vo.setNo(no);
					messageService.update(vo);
					entity =
				new ResponseEntity<String>("success",HttpStatus.OK);			
				}catch(Exception e){
					e.printStackTrace();
					entity = 
							new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
				}
				return entity;
			
			}
		
			@RequestMapping(value="update.do"
					,method={RequestMethod.PUT, RequestMethod.PATCH})
					public ResponseEntity<String> update(
						 HttpSession session){
						ResponseEntity<String> entity =null;
						try{
							String userid = (String) session.getAttribute("id");
													
							messageService.MsgUpdate(userid);
							entity =
						new ResponseEntity<String>("success",HttpStatus.OK);			
						}catch(Exception e){
							e.printStackTrace();
							entity = 
									new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
						}
						return entity;
					
					}


}
