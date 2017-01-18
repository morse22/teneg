package kr.co.teneg.requestWaiting;

import java.util.List;

import kr.co.teneg.dbVO.RequestMyWaitingVO;

public interface RequestWaitingService {
	public void insert(RequestWaitingVO requestWaiting);
	public RequestWaitingVO select(RequestWaitingVO requestWaiting);
	public int countByRequestNo(int requestNo);
	public List<RequestMyWaitingVO> list(String id);
	public List<RequestWaitingVO> selectByNo(int no);
	public int readNcount(String userid);
	public void read();
	public void waitingdelete(int requestNo);
}
