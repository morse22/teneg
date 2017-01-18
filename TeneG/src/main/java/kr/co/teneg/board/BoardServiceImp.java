package kr.co.teneg.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.dbVO.BoardDetailVO;
import kr.co.teneg.dbVO.BoardListVO;
import kr.co.teneg.dbVO.BoardPageVO;

@Service
public class BoardServiceImp implements BoardService{
	
	@Autowired
	private BoardDAO dao;

	public List<BoardListVO> list(BoardPageVO boardPage) {
		return dao.list(boardPage);
	}
	
	@Override
	public List<BoardListVO> getNotiInfoList() {
		return dao.getNotiInfoList();
	}
	
	public BoardDetailVO detail(int no){
		return dao.detail(no);
	}

	public int getNextBoardNo() {
		return dao.getNextBoardNo();
	}

	public void insert(BoardVO board) {
		dao.insert(board);
	}

	public void delete(int no) {
		dao.delete(no);
	}

	public void update(BoardVO board) {
		dao.update(board);
	}

	@Override
	public void deleteList(List<Integer> list) {
		dao.deleteList(list);
	}

	@Override
	public int getTotalCount() {
		return dao.getTotalCount();
	}

	@Override
	public void incrementHit(int no) {
		dao.incrementHit(no);
	}

	@Override
	public int newBoardCount() {
		return dao.newBoardCount();
	}
}
