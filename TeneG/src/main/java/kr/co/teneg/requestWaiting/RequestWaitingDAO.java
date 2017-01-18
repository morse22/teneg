package kr.co.teneg.requestWaiting;

import java.util.List;

import kr.co.teneg.dbVO.RequestMyWaitingVO;

public interface RequestWaitingDAO {
	public void insert(RequestWaitingVO requestWaiting);
	public RequestWaitingVO select(RequestWaitingVO requestWaiting);
	public int countByRequestNo(int requestNo);
	public List<RequestMyWaitingVO> list(String id);
	// 2017.01.03 추가 
	public List<RequestWaitingVO> selectByNo(int no);
	//
	public int readNcount(String userid);
	public void read();

	public void waitingdelete(int requestNo);
}
