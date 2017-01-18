package kr.co.teneg.message;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImp implements MessageService {

	@Autowired
	public MessageDAO messageDAO;

	@Override
	public void insert(MessageVO vo) {
		messageDAO.insert(vo);
		messageDAO.insert2(vo);
	}

	@Override
	public List<MessageVO> MessageList(String search_option_date, String search_option, String search_keyword, String search_keyword2,String search_keyword3,int start,int end,String userid) {
		List<MessageVO> list 
			= messageDAO.MessageList(search_option_date,search_option, search_keyword,search_keyword2,search_keyword3,start,end,userid);
		return list;
	}

	@Override
	public int ListCount(String search_option, String search_keyword,String userid) {
		
		return messageDAO.ListCount(search_option,search_keyword,userid);
	}

	@Override
	public void update(MessageVO vo) {
		messageDAO.update(vo);
		
	}

	@Override
	public int readNcount(String userid) {
		int result=0;
		result= messageDAO.readNcount(userid);
		return result;
	}

	@Override
	public int readYcount(String userid) {
		int result=0;
		result= messageDAO.readYcount(userid);
		return result;
	}

	@Override
	public void delete(List<Integer> param) {
		ArrayList<Integer> list = new ArrayList<>();
		list.addAll(param);
		messageDAO.delete(list);
		
		
		
	}

	@Override
	public void MsgUpdate(String userid) {
		messageDAO.MsgUpdate(userid);
		
	}

	@Override
	public int readDate(String userid) {
		int result= 0;
			result = messageDAO.readDate(userid);
		return result;
	}

	@Override
	public void updatePop(String userid) {
		messageDAO.updatePop(userid);
		
	}

	@Override
	public int updateVlaue(String userid) {
		int num=0;
		num=messageDAO.updateValue(userid);
		return num;
	}



}
