package kr.co.teneg.select;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class SelectServiceImpl implements SelectService {
	
	@Autowired
	private SelectDAO dao;
	
	@Override
	public void select(SelectVO vo) {
		dao.select(vo);
		
	}

	@Override
	public List<SelectVO> list(String userid,String search_option, String search_keyword) {
		List<SelectVO> list = dao.list(userid,search_option,search_keyword);
		return list;
	}

	@Override
	public int select_ajax(SelectVO vo) {
		 int num = dao.select_ajax(vo);
		return num;
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
		
	}

	@Override
	public int count(String userid) {
		 int count =0;
		 count=dao.count(userid);
		 return count;
		
	}
}
