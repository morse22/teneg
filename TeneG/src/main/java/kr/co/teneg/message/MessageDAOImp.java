package kr.co.teneg.message;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOImp implements MessageDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insert(MessageVO vo) {
		sqlSessionTemplate.insert("kr.co.teneg.Message.insert",vo);
		
	}
	@Override
	public List<MessageVO> MessageList(String search_option_date, String search_option, String search_keyword, String search_keyword2,String search_keyword3,int start,int end,String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("search_option_date", search_option_date);
		map.put("search_keyword", search_keyword);
		map.put("search_keyword3", search_keyword3);
		map.put("search_keyword2", search_keyword2);
		map.put("start", start);
		map.put("end", end);
		map.put("userid", userid);
				 
		
		List<MessageVO> list
		 	= sqlSessionTemplate.selectList("kr.co.teneg.Message.list",map);
		
		return list;
	}
	@Override
	public int ListCount(String search_option, String search_keyword,String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("search_keyword",search_keyword);
		map.put("userid", userid);
		return sqlSessionTemplate.selectOne("kr.co.teneg.Message.ListCount",map);
	
	}
	@Override
	public void update(MessageVO vo) {
		sqlSessionTemplate.update("kr.co.teneg.Message.update", vo);
		
	}
	@Override
	public int readNcount(String userid) {
		int result=0;
		result=sqlSessionTemplate.selectOne("kr.co.teneg.Message.readNcount",userid);
		return result;
	}
	@Override
	public int readYcount(String userid) {
		return sqlSessionTemplate.selectOne("kr.co.teneg.Message.readYcount",userid);
	}
	@Override
	public void delete(List<Integer> param) {	
		ArrayList<Integer> list = new ArrayList<>();
		list.addAll(param);
		sqlSessionTemplate.delete("kr.co.teneg.Message.deletemsg",list);
		
	}
	@Override
	public void MsgUpdate(String userid ) {
		sqlSessionTemplate.update("kr.co.teneg.Message.msgUpdate",userid);
		
	}
	@Override
	public int readDate(String userid) {
	
		return sqlSessionTemplate.selectOne("kr.co.teneg.Message.readDate", userid);
	}
	@Override
	public void updatePop(String userid) {
		
		sqlSessionTemplate.update("kr.co.teneg.Message.pop", userid);
		
	}
	@Override
	public int updateValue(String userid) {
		int num=0;
		num = sqlSessionTemplate.selectOne("kr.co.teneg.Message.value", userid);
		return num;
	}
	@Override
	public void insert2(MessageVO vo) {
		sqlSessionTemplate.insert("kr.co.teneg.Message.insert_Level",vo);	
		
	}


}
