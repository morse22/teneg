package kr.co.teneg.board;

public class BoardVO {
	private int no;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private int hit;
	private int good;
	private String type; // member, all, manager
	private String category; // free
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regDate="
				+ regDate + ", hit=" + hit + ", good=" + good + ", type=" + type + ", category=" + category + "]";
	}
	public int getNo() {return no;}
	public void setNo(int no) {this.no = no;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public String getWriter() {return writer;}
	public void setWriter(String writer) {this.writer = writer;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public int getHit() {return hit;}
	public void setHit(int hit) {this.hit = hit;}
	public int getGood() {return good;}
	public void setGood(int good) {this.good = good;}
	public String getType() {return type;}
	public void setType(String type) {this.type = type;}
	public String getCategory() {return category;}
	public void setCategory(String category) {this.category = category;}
}
