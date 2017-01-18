package kr.co.teneg.select;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SelectDAOImpl implements SelectDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void select(SelectVO vo) {
		sqlSessionTemplate.insert("kr.co.teneg.Select.select",vo);
		
	}

	@Override
	public List<SelectVO> list(String userid,String search_option, String search_keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("search_option", search_option);
		map.put("search_keyword", search_keyword);
		
		List<SelectVO> list = 
				sqlSessionTemplate.selectList("kr.co.teneg.Select.list",map);
		return list;
	}

	@Override
	public int select_ajax(SelectVO vo) {
		int num = sqlSessionTemplate.selectOne("kr.co.teneg.Select.select_ajax",vo);
		return num;
	}

	@Override
	public void delete(String id) {
		sqlSessionTemplate.delete("kr.co.teneg.Select.delete", id);
		
	}

	@Override
	public int count(String userid) {
		int count=0;
		count=sqlSessionTemplate.selectOne("kr.co.teneg.Select.count",userid);
		return count;
	}
	
	
}
