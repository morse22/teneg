package kr.co.teneg.request;

import java.util.HashMap;
import java.util.List;

import kr.co.teneg.dbVO.BoardPageVO;
import kr.co.teneg.dbVO.RequestCountVO;
import kr.co.teneg.dbVO.RequestListVO;
import kr.co.teneg.dbVO.RequestQueryVO;
import kr.co.teneg.dbVO.RequestdetailVO;

public interface RequestDAO {
	public List<RequestVO> list(RequestVO vo);
	public List<RequestVO> manage(String id);
	public RequestVO detail(int no);
	public RequestdetailVO requestExpertDetail(RequestQueryVO requestQueryVO);
	public void insert(RequestVO request);
	public void auctionInsert(RequestVO request);
	public int getNextRequestNo();
	public void delete(int no);
	public void update(RequestVO request);
	public void progress(int requestNo);
	public int readNcount(String userid);
	public void insertmessage(RequestVO request);
	public void read(String id);
	public List<RequestVO> newList(String id);
	public List<RequestVO> selectByText(String searchText);//동규형
	// 추가 17.01.04
	public List<RequestVO> selectD(String id);
	public List<RequestListVO> selectDD(BoardPageVO vo);
	public List<RequestVO> selectDP();
	public List<RequestListVO> selectP(String id);
	public List<RequestListVO> selectC(String id);	
	public RequestCountVO getTypeCount(String id);
	public void doComplete(int requestNo);
	public void doDComplete(int requestNo);
	public void doRP(int requestNo); // 환불 진행중 상황
	public void doRR(int requestNo); // 환불 불가 승인
	public void setProgress(RequestVO vo);
	public List<RequestVO> selectAUC(String id);
	public void updateAuctionFinish(HashMap<String, Object> map);
}
