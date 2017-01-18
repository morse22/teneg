package kr.co.teneg.boardGood;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardGoodDAOImp implements BoardGoodDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insert(BoardGoodVO boardGood) {
		sqlSession.insert("kr.co.teneg.BoardGoodDAO.insert", boardGood);
	}

	@Override
	public BoardGoodVO select(BoardGoodVO boardGood) {
		return sqlSession.selectOne("kr.co.teneg.BoardGoodDAO.select", boardGood);
	}

	@Override
	public int countByBoardNo(int boardNo) {
		return sqlSession.selectOne("kr.co.teneg.BoardGoodDAO.countByBoardNo", boardNo);
	}
}
