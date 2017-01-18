package kr.co.teneg.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnADAOImpl implements QnADAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public void FAQInsert(faqVO vo) {
		sqlSessionTemplate.insert("kr.co.teneg.QnABoard.boardFAQInsert", vo);
		
	}

	@Override
	public List<faqVO> FAQList(String search_option_date,String search_option,String search_keyword,String search_keyword3,String search_keyword2,int start, int end) {
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("search_option_date", search_option_date);
		map.put("search_keyword", search_keyword);
		map.put("search_keyword3", search_keyword3);
		map.put("search_keyword2", search_keyword2);
		map.put("start", start);
		map.put("end", end);
				
		List<faqVO> list = 
		sqlSessionTemplate.selectList("kr.co.teneg.QnABoard.QnAList",map);
		return list;
	}

	@Override
	public int QnACount(String search_option, String search_keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("search_keyword",search_keyword);
		int result = 0;
		result = sqlSessionTemplate.selectOne("kr.co.teneg.QnABoard.FaqCount",map);
		return result;
	}

	@Override
	public faqVO FAQDetail(int no) {
		faqVO vo =
				sqlSessionTemplate.selectOne("kr.co.teneg.QnABoard.FaqDetail",no);
		return vo;
	}
	
	@Override
	public void FaqUpdate(faqVO vo) {
		sqlSessionTemplate.update("kr.co.teneg.QnABoard.FaqUpdate",vo);
		
	}
	
	@Override
	public void FaqDelete(int no) {
		sqlSessionTemplate.delete("kr.co.teneg.QnABoard.FaqDelete", no);
		
	}
//====================================================================================================
	@Override
	public void QNAInsert(qnaVO vo) {
		sqlSessionTemplate.insert("kr.co.teneg.QnABoard.qnaInsert",vo);
		
	}

	@Override
	public List<qnaVO> QNAList() {
		List<qnaVO> list = 
				sqlSessionTemplate.selectList("kr.co.teneg.QnABoard.qnaList");
		return list;
	}

	@Override
	public qnaVO QNADetail(int no) {
		qnaVO vo = sqlSessionTemplate.selectOne("kr.co.teneg.QnABoard.qnaDetail",no);
		return vo;
	}

	@Override
	public void QNARefInsert(qnaVO vo) {
		sqlSessionTemplate.update("kr.co.teneg.QnABoard.qnaRefInsert", vo);
		
	}

	@Override
	public void QNAInsertStar(qnaVO vo) {
	
		sqlSessionTemplate.update("kr.co.teneg.QnABoard.starUpdate",vo);
		
	}

	@Override
	public List<faqVO> FAQList_qna(String search_option_date, String search_option, String search_keyword,
			String search_keyword3, String search_keyword2, int start, int end) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("search_option_date", search_option_date);
		map.put("search_keyword", search_keyword);
		map.put("search_keyword3", search_keyword3);
		map.put("search_keyword2", search_keyword2);
		map.put("start", start);
		map.put("end", end);
				
		List<faqVO> list = 
		sqlSessionTemplate.selectList("kr.co.teneg.QnABoard.QnAList_qna",map);
		return list;
	}

	

	



	

}
