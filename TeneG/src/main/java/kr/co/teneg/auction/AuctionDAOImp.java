package kr.co.teneg.auction;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuctionDAOImp implements AuctionDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void join(AuctionVO auctionVO) {
		sqlSession.insert("kr.co.teneg.AuctionDAO.join", auctionVO);
	}

	public List<AuctionVO> joinList(int requestNo) {
		return sqlSession.selectList("kr.co.teneg.AuctionDAO.joinList", requestNo );
	}

	public void choice(int no) {
		sqlSession.update("kr.co.teneg.AuctionDAO.choice", no);
	}

	public void choiceCancel(AuctionVO auctionVO) {
		sqlSession.delete("kr.co.teneg.AuctionDAO.choiceCancel", auctionVO);
		
	}

	public AuctionVO selectedJoin(int requestNo) {
		return sqlSession.selectOne("kr.co.teneg.AuctionDAO.selectedJoin", requestNo);
	}

	@Override
	public List<AuctionVO> selectByNo(HashMap<String, Object> map) {
		return sqlSession.selectList("kr.co.teneg.AuctionDAO.selectByNo", map);
	}

	@Override
	public void deleteNotNo(HashMap<String, Object> map) {
		sqlSession.delete("kr.co.teneg.AuctionDAO.deleteNotNo", map);
	}

	@Override
	public void deleteAllByRequestNo(int requestNo) {
		sqlSession.delete("kr.co.teneg.AuctionDAO.deleteAllByRequestNo", requestNo);
	}

	@Override
	public void initInsert(AuctionVO auctionVO) {
		sqlSession.insert("kr.co.teneg.AuctionDAO.initInsert", auctionVO);
	}
}
