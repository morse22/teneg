package kr.co.teneg.request;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.teneg.auction.AuctionDAO;
import kr.co.teneg.auction.AuctionVO;
import kr.co.teneg.dbVO.BoardPageVO;
import kr.co.teneg.dbVO.RequestCountVO;
import kr.co.teneg.dbVO.RequestListVO;
import kr.co.teneg.dbVO.RequestQueryVO;
import kr.co.teneg.dbVO.RequestdetailVO;
import kr.co.teneg.member.MemberDAO;

@Service
public class RequestServiceImp implements RequestService{
	
	@Autowired
	private RequestDAO dao;
	
	@Autowired
	private AuctionDAO aucDao;
	
	@Autowired 
	private MemberDAO memberDAO;

	@Override
	public List<RequestVO> list(RequestVO vo) {
		return dao.list(vo);
	}
	@Override
	public List<RequestVO> manage(String id) {
		return dao.manage(id);
	}
	
	@Override
	public RequestVO detail(int no){
		return dao.detail(no);
	}
	@Override
	public RequestdetailVO requestExpertDetail(RequestQueryVO requestQueryVO){
		return dao.requestExpertDetail(requestQueryVO);
	}
	@Override
	public int getNextRequestNo() {
		return dao.getNextRequestNo();
	}
	@Override
	public void insert(RequestVO request) {
		dao.insert(request);
		memberDAO.subStractEgg(request);
	}
	@Override
	public void auctionInsert(RequestVO request) {
		dao.auctionInsert(request);
		AuctionVO auction = new AuctionVO();
		auction.setId("start");
		auction.setPrice(request.getPrice());
		auction.setRequestNo(request.getNo());
		auction.setType("selected");
		aucDao.initInsert(auction);
	}

	@Override
	public void delete(int no){
		dao.delete(no);
	}

	@Override
	public void update(RequestVO request) {
		dao.update(request);
	}

	@Override
	public void progress(int requestNo){
		dao.progress(requestNo);
	}

	@Override
	public int readNcount(String userid){
		return dao.readNcount(userid);
	}
	@Override
	public void insertmessage(RequestVO request){
		 dao.insertmessage(request);
	}
	@Override
	public List<RequestVO> newList(String id){
		return dao.newList(id);
	}
	@Override
	public void read(String id){
		 dao.read(id);
	}
	@Override
	public List<RequestVO> selectByText(String searchText) {
		return dao.selectByText(searchText);
	}
	@Override
	public List<RequestVO> selectD(String id) {
		return dao.selectD(id);
	}
	@Override
	public List<RequestListVO> selectP(String id) {
		return dao.selectP(id);
	}
	@Override
	public RequestCountVO getTypeCount(String id) {
		return dao.getTypeCount(id);
	}
	@Override
	public void doComplete(int requestNo) {
		dao.doComplete(requestNo);
	}
	@Override
	public List<RequestListVO> selectC(String id) {
		return dao.selectC(id);
	}
	@Override
	public void doDComplete(int requestNo) {
		dao.doDComplete(requestNo);
	}
	@Override
	public void setProgress(RequestVO vo) {
		dao.setProgress(vo);
	}
	
	@Override
	public List<RequestListVO> selectDD(BoardPageVO vo) {
		List<RequestListVO> list = dao.selectDD(vo);
		int size = list.size();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(new Date());
		for(int i=0; i<size; i++){
			System.out.println(list.get(i));
			if(list.get(i).getIsRequested() == null) list.get(i).setIsRequested("N");
			if(list.get(i).getRegDate().equals(today)) list.get(i).setIsNew("Y");
			else list.get(i).setIsNew("N");
		}
		return list;
	}
	
	@Override
	public List<RequestVO> selectDP() {
		return dao.selectDP();
	}
	@Override
	public void doRP(int requestNo) {
		dao.doRP(requestNo);
	}
	@Override
	public void doRR(int requestNo) {
		dao.doRR(requestNo);
	}
	@Override
	public List<RequestVO> selectAUC(String id) {
		return dao.selectAUC(id);
	}
	@Override
	public void updateAuctionFinish(HashMap<String, Object> map) {	
		dao.updateAuctionFinish(map);
	}
}
