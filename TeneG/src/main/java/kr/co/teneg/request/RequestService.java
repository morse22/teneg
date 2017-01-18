package kr.co.teneg.request;

import java.util.HashMap;
import java.util.List;

import kr.co.teneg.dbVO.BoardPageVO;
import kr.co.teneg.dbVO.RequestCountVO;
import kr.co.teneg.dbVO.RequestListVO;
import kr.co.teneg.dbVO.RequestQueryVO;
import kr.co.teneg.dbVO.RequestdetailVO;

public interface RequestService {
	public List<RequestVO> list(RequestVO vo);
	public List<RequestVO> manage(String id);
	public RequestVO detail(int no);
	public RequestdetailVO requestExpertDetail(RequestQueryVO requestQueryVO);
	public int getNextRequestNo();
	public void insert(RequestVO request);
	public void auctionInsert(RequestVO request);
	public void delete(int no);
	public void update(RequestVO request);
	public void progress(int requestNo);
	public int readNcount(String userid);
	public void insertmessage(RequestVO request);
	public void read(String id);
	public List<RequestVO> newList(String id);
	
	public List<RequestVO> selectByText(String searchText);//동규형추가부분
	public List<RequestVO> selectDP();
	public List<RequestVO> selectD(String id);
	public List<RequestListVO> selectP(String id);
	public List<RequestListVO> selectC(String id);	
	public RequestCountVO getTypeCount(String id);
	public void doComplete(int requestNo);
	public List<RequestListVO> selectDD(BoardPageVO vo);
	public void doDComplete(int requestNo);
	public void setProgress(RequestVO vo);
	public void doRR(int requestNo);
	public void doRP(int requestNo);
	public List<RequestVO> selectAUC(String id);
	public void updateAuctionFinish(HashMap<String, Object> map);
}