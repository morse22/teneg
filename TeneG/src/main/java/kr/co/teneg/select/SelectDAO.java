package kr.co.teneg.select;

import java.util.List;

public interface SelectDAO {

	public void select(SelectVO vo);
	
	public List<SelectVO> list(String userid,String search_option, String search_keyword);
	
	public int select_ajax(SelectVO vo); 

	public void delete(String id);
	
	public int count(String userid);

}
