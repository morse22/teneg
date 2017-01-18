package kr.co.teneg.dbVO;

public class BoardDetailVO {
	private int no;
	private int currentPage;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private int hit;
	private int good;
	private int replyCount;
	private int preNo;
	private int nextNo;
	private String type; // member, all, noti, info
	private String category; // free, reply, develop
	private String preTitle;
	private String nextTitle;
	@Override
	public String toString() {
		return "BoardDetailVO [no=" + no + ", currentPage=" + currentPage + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", regDate=" + regDate + ", hit=" + hit + ", good=" + good + ", replyCount="
				+ replyCount + ", preNo=" + preNo + ", nextNo=" + nextNo + ", type=" + type + ", category=" + category
				+ ", preTitle=" + preTitle + ", nextTitle=" + nextTitle + "]";
	}	
	public int getCurrentPage() {return currentPage;}
	public void setCurrentPage(int currentPage) {this.currentPage = currentPage;}
	public int getPreNo() {return preNo;}
	public void setPreNo(int preNo) {this.preNo = preNo;}
	public int getNextNo() {return nextNo;}
	public void setNextNo(int nextNo) {this.nextNo = nextNo;}
	public String getPreTitle() {return preTitle;}
	public void setPreTitle(String preTitle) {this.preTitle = preTitle;}
	public String getNextTitle() {return nextTitle;}
	public void setNextTitle(String nextTitle) {this.nextTitle = nextTitle;}
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
	public int getReplyCount() {return replyCount;}
	public void setReplyCount(int replyCount) {this.replyCount = replyCount;}
}
