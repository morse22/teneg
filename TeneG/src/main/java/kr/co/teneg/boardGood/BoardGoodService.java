package kr.co.teneg.boardGood;

public interface BoardGoodService {
	public void insert(BoardGoodVO boardGood);
	public BoardGoodVO select(BoardGoodVO boardGood);
	public int countByBoardNo(int boardNo);
}
