package kr.co.teneg.manager.image;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ManagerImageController {
	
	@Autowired
	private ServletContext servletContext;

	@Autowired
	private ManagerImageService service;
	
	@RequestMapping("/managerImage/update.do")
	public String update(MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException{
		String uploadDir = servletContext.getRealPath("/upload/");

		Iterator<String> iter = mRequest.getFileNames();
		
		while(iter.hasNext()){ 
			
			String formFileName = iter.next();

			MultipartFile mFile = mRequest.getFile(formFileName);
			
			String oriFileName = mFile.getOriginalFilename();
			if(oriFileName != null && !oriFileName.equals("")) {
			
				String ext = "";
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					ext = oriFileName.substring(index);
				}
				String saveFileName = "ad-";
				switch(formFileName){
				case "leftImage" :
					saveFileName += "leftSideAdImage" + ext;
					break;
				case "rightImage" :
					saveFileName += "rightSideAdImage" + ext;
					break;
				case "boardBanner" :
					saveFileName += "boardBannerImage" + ext;
					break;
				case "mainAd1" :
					saveFileName += "mainAd1" + ext;
					break;
				case "mainAd2" :
					saveFileName += "mainAd2" + ext;
					break;
				case "mainAd3" :
					saveFileName += "mainAd3" + ext;
					break;
				case "mainAd4" :
					saveFileName += "mainAd4" + ext;
					break;
				case "mainAd5" :
					saveFileName += "mainAd5" + ext;
					break;
				}
				mFile.transferTo(new File(uploadDir + "/" + saveFileName));			
				ManagerImageVO vo = new ManagerImageVO();
				vo.setOriFileName(oriFileName);
				vo.setSaveFileName(saveFileName);
				if(formFileName.equals("leftImage")) vo.setType("sideleft");
				if(formFileName.equals("rightImage")) vo.setType("sideright");
				if(formFileName.equals("boardBanner")) vo.setType("boardBanner");
				if(formFileName.equals("mainAd1")) vo.setType("mainAd1");
				if(formFileName.equals("mainAd2")) vo.setType("mainAd2");
				if(formFileName.equals("mainAd3")) vo.setType("mainAd3");
				if(formFileName.equals("mainAd4")) vo.setType("mainAd4");
				if(formFileName.equals("mainAd5")) vo.setType("mainAd5");
				service.update(vo);
			} 
		}
		return "redirect:/";
	}
	
}
