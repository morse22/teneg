package kr.co.teneg.reply;

import java.util.List;

public interface ReplyService {
	public void insert(ReplyVO reply);
	public void insertRR(ReplyVO reply);
	public List<ReplyVO> selectByNo(int no);
	public void delete(int no);
}
