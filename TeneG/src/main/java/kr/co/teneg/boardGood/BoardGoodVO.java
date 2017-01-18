package kr.co.teneg.boardGood;

public class BoardGoodVO {
	private int boardNo;
	private String id;
	private String regDate;
	
	@Override
	public String toString() {
		return "BoardGoodVO [boardNo=" + boardNo + ", id=" + id + ", regDate=" + regDate + "]";
	}
	public int getBoardNo() {return boardNo;}
	public void setBoardNo(int boardNo) {this.boardNo = boardNo;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
}
