package kr.co.teneg.requestWaiting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.dbVO.RequestMyWaitingVO;

@Service
public class RequestWaitingServiceImp implements RequestWaitingService{
	
	@Autowired
	private RequestWaitingDAO dao;

	@Override
	public void insert(RequestWaitingVO boardGood) {
		dao.insert(boardGood);
	}

	@Override
	public RequestWaitingVO select(RequestWaitingVO boardGood) {
		return dao.select(boardGood);
	}

	@Override
	public int countByRequestNo(int requestNo) {
		return dao.countByRequestNo(requestNo);
	}
	

	public List<RequestMyWaitingVO> list(String id) {
		return dao.list(id);
	}
	

	public int readNcount(String userid){
		return dao.readNcount(userid);
	}
	public void read(){
		 dao.read();
	}

	public void waitingdelete(int requestNo){
		dao.waitingdelete(requestNo);
	}

	@Override
	public List<RequestWaitingVO> selectByNo(int no) {
		return dao.selectByNo(no);
	}
}
