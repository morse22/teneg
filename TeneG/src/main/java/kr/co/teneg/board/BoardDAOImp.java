package kr.co.teneg.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.dbVO.BoardDetailVO;
import kr.co.teneg.dbVO.BoardListVO;
import kr.co.teneg.dbVO.BoardPageVO;


@Service
public class BoardDAOImp implements BoardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<BoardListVO> list(BoardPageVO boardPage) {
		return sqlSession.selectList("kr.co.teneg.BoardDAO.selectNormalList", boardPage);
	}
	
	@Override
	public List<BoardListVO> getNotiInfoList() {
		return sqlSession.selectList("kr.co.teneg.BoardDAO.selectNotiInfo");
	}
	
	public BoardDetailVO detail(int no){
		return sqlSession.selectOne("kr.co.teneg.BoardDAO.selectDetail", no);
	}

	public int getNextBoardNo() {
		return sqlSession.selectOne("kr.co.teneg.BoardDAO.getNextNo");
	}

	public void insert(BoardVO board) {
		sqlSession.insert("kr.co.teneg.BoardDAO.insert", board);
	}

	public void delete(int no) {
		sqlSession.delete("kr.co.teneg.BoardDAO.delete", no);
	}

	public void update(BoardVO board) {
		sqlSession.update("kr.co.teneg.BoardDAO.update", board);
	}

	@Override
	public void deleteList(List<Integer> list) {
		sqlSession.delete("kr.co.teneg.BoardDAO.deleteList", list);
	}

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("kr.co.teneg.BoardDAO.selectTotalCount");
	}

	@Override
	public void incrementHit(int no) {
		sqlSession.update("kr.co.teneg.BoardDAO.incrementHit", no);
	}

	@Override
	public int newBoardCount() {
		return sqlSession.selectOne("kr.co.teneg.BoardDAO.newBoardCount");
	}
}
