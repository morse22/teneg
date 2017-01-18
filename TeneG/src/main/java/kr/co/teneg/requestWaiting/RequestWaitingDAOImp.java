package kr.co.teneg.requestWaiting;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teneg.dbVO.RequestMyWaitingVO;

@Repository
public class RequestWaitingDAOImp implements RequestWaitingDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insert(RequestWaitingVO requestWaiting) {
		sqlSession.insert("kr.co.teneg.RequestWaitingDAO.insert", requestWaiting);
	}

	@Override
	public RequestWaitingVO select(RequestWaitingVO requestWaiting) {
		return sqlSession.selectOne("kr.co.teneg.RequestWaitingDAO.select", requestWaiting);
	}

	@Override
	public int countByRequestNo(int requestNo) {
		return sqlSession.selectOne("kr.co.teneg.RequestWaitingDAO.countByRequestNo", requestNo);
	}
	@Override
	public List<RequestMyWaitingVO> list(String id) {
		return sqlSession.selectList("kr.co.teneg.RequestWaitingDAO.selectExpert",id);
		
	}
	@Override
	public int readNcount(String userid){
		return sqlSession.selectOne("kr.co.teneg.RequestWaitingDAO.readNcount", userid);
	}
	@Override
	public void read(){
		 sqlSession.update("kr.co.teneg.RequestWaitingDAO.read");
	}

	@Override
	public void waitingdelete(int requestNo) {
		sqlSession.delete("kr.co.teneg.RequestWaitingDAO.waitingDelete",requestNo);
		
	}

	@Override
	public List<RequestWaitingVO> selectByNo(int no) {
		return sqlSession.selectList("kr.co.teneg.RequestWaitingDAO.selectByNo",no);
	}

}
