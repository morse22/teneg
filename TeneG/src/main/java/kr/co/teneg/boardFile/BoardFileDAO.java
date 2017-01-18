package kr.co.teneg.boardFile;

import java.util.List;

public interface BoardFileDAO {
	public void insert(BoardFileVO boardFile);
	public List<BoardFileVO> selectByNo(int no);
}
