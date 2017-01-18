package kr.co.teneg.response;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.dbVO.ResponseListVO;
import kr.co.teneg.request.RequestVO;

@Service
public class ResponseServiceImp implements ResponseService{
	
	@Autowired
	private ResponseDAO dao;


	public void response(ResponseVO responseVO){
		dao.response(responseVO);
	}

	public int getNextRequestNo2() {
		return dao.getNextRequestNo2();
	}


	public List<ResponseListVO> list(String id){
		return dao.list(id);
	}

	public int readNcount(String userid){
		return dao.readNcount(userid);
	}

	public void read(){
		 dao.read();
	}

	@Override
	public void doComplete(RequestVO vo) {
		dao.doComplete(vo);
	}
}
