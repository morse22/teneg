package kr.co.teneg.board;

import java.util.List;

import kr.co.teneg.dbVO.BoardDetailVO;
import kr.co.teneg.dbVO.BoardListVO;
import kr.co.teneg.dbVO.BoardPageVO;

public interface BoardDAO {
	public List<BoardListVO> list(BoardPageVO boardPage);
	public BoardDetailVO detail(int no);
	public int getNextBoardNo();
	public void insert(BoardVO board);
	public void delete(int no);
	public void update(BoardVO board);
	public void deleteList(List<Integer> list);
	public int getTotalCount();
	public void incrementHit(int no);
	public int newBoardCount();
	public List<BoardListVO> getNotiInfoList();
}
