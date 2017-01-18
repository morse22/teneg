package kr.co.teneg.reply;

public class ReplyVO {
	private int boardNo;
	private String no;
	private String content;
	private String writer;
	private String regDate;
	private int groupNo;
	private String parentId;
	@Override
	public String toString() {
		return "ReplyVO [boardNo=" + boardNo + ", no=" + no + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", groupNo=" + groupNo + ", parentId=" + parentId + "]";
	}
	public int getBoardNo() {return boardNo;}
	public void setBoardNo(int boardNo) {this.boardNo = boardNo;}
	public String getNo() {return no;}
	public void setNo(String no) {this.no = no;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public String getWriter() {return writer;}
	public void setWriter(String writer) {this.writer = writer;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public int getGroupNo() {return groupNo;}
	public void setGroupNo(int groupNo) {this.groupNo = groupNo;}
	public String getParentId() {return parentId;}
	public void setParentId(String parentId) {this.parentId = parentId;}
}
