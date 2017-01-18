package kr.co.teneg.faq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest/*")
public class faqRestController {
	
	@Autowired
	private QnAService service;
	
	@RequestMapping(value="/update/{no}"
	,method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(
		@PathVariable("no") int no, @RequestBody faqVO vo){
		ResponseEntity<String> entity =null;
		try{
			vo.setNo(no);
			service.FaqUpdate(vo);
			entity =
		new ResponseEntity<String>("success",HttpStatus.OK);			
		}catch(Exception e){
			e.printStackTrace();
			entity = 
					new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	
	}

	@RequestMapping(value="/delete/{no}",
			method=RequestMethod.DELETE)
	public ResponseEntity<String> delete(
			@PathVariable("no") int no){
		ResponseEntity<String> entity =null;
		try{
			service.FaqDelete(no);
			entity = 
					new ResponseEntity<>("success", HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity =
					new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
		
	}
	


}
