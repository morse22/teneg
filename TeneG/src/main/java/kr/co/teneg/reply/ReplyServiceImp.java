package kr.co.teneg.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImp implements ReplyService{
	
	@Autowired
	private ReplyDAOImp dao;
	
	public void insert(ReplyVO reply) {
		dao.insert(reply);	
	}

	public List<ReplyVO> selectByNo(int no) {
		return dao.selectByNo(no);
	}
	
	public void delete(int no){
		dao.delete(no);
	}

	@Override
	public void insertRR(ReplyVO reply) {
		dao.insertRR(reply);
	}
}
