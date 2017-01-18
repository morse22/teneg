package kr.co.teneg.faq;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	public QnADAO qnaDAO;


	@Override
	public void FAQInsert(faqVO vo) {
		qnaDAO.FAQInsert(vo);
		
	}

	@Override
	public List<faqVO> FAQList(String search_option_date,String search_option,String search_keyword,String search_keyword3,String search_keyword2,int start, int end) {
		List<faqVO> list =
				qnaDAO.FAQList(search_option_date,search_option,search_keyword,search_keyword3, search_keyword2,start, end);
		return list;
	}

	@Override
	public int QnACount(String search_option, String search_keyword) {
		int result = 0 ;
		result= qnaDAO.QnACount(search_option,search_keyword);
		return result;
	}

	@Override
	public faqVO FAQDetail(int no) {
		faqVO vo = 
				qnaDAO.FAQDetail(no);
		return vo;
	}
	
	@Override
	public void FaqUpdate(faqVO vo) {
		
		qnaDAO.FaqUpdate(vo);
	}
	@Override
	public void FaqDelete(int no) {
		qnaDAO.FaqDelete(no);
		
	}
//===========================================================================================
	@Override
	public void QNAInsert(qnaVO vo) {
		qnaDAO.QNAInsert(vo);
		
	}

	@Override
	public List<qnaVO> QNAList() {
		List<qnaVO> list 
		 = qnaDAO.QNAList();
		return list;
	}

	@Override
	public qnaVO QNADetail(int no) {
		qnaVO vo = qnaDAO.QNADetail(no);
		return vo;
	}

	@Override
	public void QNARefInsert(qnaVO vo) {
		qnaDAO.QNARefInsert(vo);
		
	}

	@Override
	public List<faqVO> FAQList_qna(String search_option_date, String search_option, String search_keyword,
			String search_keyword3, String search_keyword2, int start, int end) {
		List<faqVO> list =
				qnaDAO.FAQList_qna(search_option_date,search_option,search_keyword,search_keyword3, search_keyword2,start, end);
		return list;
	}

	




	
	
}
