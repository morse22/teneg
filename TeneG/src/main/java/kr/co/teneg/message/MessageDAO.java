package kr.co.teneg.message;

import java.util.List;

public interface MessageDAO {

	public void insert(MessageVO vo);
	public void insert2(MessageVO vo);
	
	public List<MessageVO> MessageList(String search_option_date, String search_option, String search_keyword, String search_keyword2,String search_keyword3,int start,int end,String userid);
	
	public int ListCount(String search_option, String search_keyword,String userid);
	
	public void update(MessageVO vo);
	
	public int readNcount(String userid);
	
	public int readYcount(String userid);
	
	public void delete(List<Integer> param);
	
	public void MsgUpdate(String userid );
	
	public int readDate(String userid);
	
	public void updatePop(String userid);
	
	public int updateValue(String userid);
}
