package kr.co.teneg.response;

import java.util.List;

import kr.co.teneg.dbVO.ResponseListVO;
import kr.co.teneg.request.RequestVO;

public interface ResponseDAO {
	public void response(ResponseVO responseVO);
	public int getNextRequestNo2();
	public List<ResponseListVO> list(String id);
	public int readNcount(String userid);
	public void read();
	public void doComplete(RequestVO vo);
}
