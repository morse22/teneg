package kr.co.teneg.request;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.dbVO.BoardPageVO;
import kr.co.teneg.dbVO.RequestCountVO;
import kr.co.teneg.dbVO.RequestListVO;
import kr.co.teneg.dbVO.RequestQueryVO;
import kr.co.teneg.dbVO.RequestdetailVO;


@Service
public class RequestDAOImp implements RequestDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<RequestVO> list(RequestVO vo) {
		return sqlSession.selectList("kr.co.teneg.RequestDAO.selectAll", vo);
	}
	@Override
	public List<RequestVO> manage(String id) {
		return sqlSession.selectList("kr.co.teneg.RequestDAO.manageAll",id);
	}
	@Override
	public RequestVO detail(int no){
		return sqlSession.selectOne("kr.co.teneg.RequestDAO.selectDetail", no);
	}
	@Override
	public RequestdetailVO requestExpertDetail(RequestQueryVO requestQueryVO){
		return sqlSession.selectOne("kr.co.teneg.RequestDAO.selectRequestDetail", requestQueryVO);
	}
	@Override
	public int getNextRequestNo() {
		return sqlSession.selectOne("kr.co.teneg.RequestDAO.getNextNo");
	}
	@Override
	public void insert(RequestVO request) {
		sqlSession.insert("kr.co.teneg.RequestDAO.insert", request);
	}
	@Override
	public void auctionInsert(RequestVO request) {
		sqlSession.insert("kr.co.teneg.RequestDAO.auctionInsert", request);
	}
	@Override
	public void delete(int no) {
		sqlSession.delete("kr.co.teneg.RequestDAO.delete", no);
	}
	@Override
	public void update(RequestVO request) {
		sqlSession.update("kr.co.teneg.RequestDAO.update", request);
	}
	@Override
	public void progress(int requestNo){
		sqlSession.update("kr.co.teneg.RequestDAO.progress", requestNo);
	}
	@Override
	public int readNcount(String userid){
		return sqlSession.selectOne("kr.co.teneg.RequestDAO.readNcount", userid);
	}
	
	@Override
	public void insertmessage(RequestVO request){
		sqlSession.insert("kr.co.teneg.RequestDAO.insertmessage", request);
	}
	@Override
	public void read(String id){
		 sqlSession.update("kr.co.teneg.RequestDAO.read",id);
	}
	public List<RequestVO> newList(String id){
		return sqlSession.selectList("kr.co.teneg.RequestDAO.newList",id);
	}
	@Override
	public List<RequestVO> selectByText(String searchText) {
		return sqlSession.selectList("kr.co.teneg.RequestDAO.selectByText", searchText);
	}
	@Override
	public List<RequestVO> selectD(String id) {
		return sqlSession.selectList("kr.co.teneg.RequestDAO.selectD", id);
	}
	@Override
	public List<RequestListVO> selectP(String id) {
		return sqlSession.selectList("kr.co.teneg.RequestDAO.selectP", id);
	}
	@Override
	public RequestCountVO getTypeCount(String id) {
		return sqlSession.selectOne("kr.co.teneg.RequestDAO.getTypeCount", id);
	}
	@Override
	public void doComplete(int requestNo) {
		sqlSession.update("kr.co.teneg.RequestDAO.doComplte", requestNo);
		
	}
	@Override
	public List<RequestListVO> selectC(String id) {
		return sqlSession.selectList("kr.co.teneg.RequestDAO.selectC", id);
	}
	@Override
	public void doDComplete(int requestNo) {
		sqlSession.update("kr.co.teneg.RequestDAO.doDComplte", requestNo);
	}
	@Override
	public void setProgress(RequestVO vo) {
		sqlSession.update("kr.co.teneg.RequestDAO.setProgress", vo);
	}
	@Override
	public List<RequestListVO> selectDD(BoardPageVO vo) {
		return sqlSession.selectList("kr.co.teneg.RequestDAO.selectDD", vo);
	}
	@Override
	public List<RequestVO> selectDP() {
		return sqlSession.selectList("kr.co.teneg.RequestDAO.selectDP");
	}
	@Override
	public void doRP(int requestNo) {
		sqlSession.update("kr.co.teneg.RequestDAO.doRP", requestNo);	
	}
	@Override
	public void doRR(int requestNo) {
		sqlSession.update("kr.co.teneg.RequestDAO.doRR", requestNo);	
	}
	@Override
	public List<RequestVO> selectAUC(String id) {
		return sqlSession.selectList("kr.co.teneg.RequestDAO.selectAUC", id);
	}
	@Override
	public void updateAuctionFinish(HashMap<String, Object> map) {
		sqlSession.update("kr.co.teneg.RequestDAO.updateAuctionFinish", map);
	}
}
