package kr.co.teneg.faq;

import java.util.ArrayList;
import java.util.List;

public interface QnAService {
	
	public List<faqVO> FAQList(String search_option_date,String search_option,String search_keyword ,String search_keyword3,String search_keyword2,int start, int end);
	
	public int QnACount(String search_option, String search_keyword);
	
	public void FAQInsert(faqVO vo);
	
	public faqVO FAQDetail(int no);
	
	public void FaqUpdate(faqVO vo);
	
	public void FaqDelete(int no);
//====================================================================================================	
	public List<qnaVO> QNAList();
	
	public void QNAInsert(qnaVO vo);
	
	public qnaVO QNADetail(int no);
	
	public void QNARefInsert(qnaVO vo);


	
	public List<faqVO> FAQList_qna(String search_option_date,String search_option,String search_keyword,String search_keyword3,String search_keyword2,int start, int end);
	
}
