package kr.co.teneg.dbVO;

public class BoardListVO {
	private int no;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private int hit;
	private int good;
	private int goodCount;
	private int replyCount;
	private String type; // member, all, manager
	private String category; // free
	
	private String isImage;
	private String isNew;
	private String isFile;
	private String isMobile;
	
	@Override
	public String toString() {
		return "BoardListVO [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", hit=" + hit + ", good=" + good + ", goodCount=" + goodCount
				+ ", replyCount=" + replyCount + ", type=" + type + ", category=" + category + ", isImage=" + isImage
				+ ", isNew=" + isNew + ", isFile=" + isFile + ", isMobile=" + isMobile + "]";
	}
	public int getGoodCount() {return goodCount;}
	public void setGoodCount(int goodCount) {this.goodCount = goodCount;}
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
	public String getIsImage() {return isImage;}
	public void setIsImage(String isImage) {this.isImage = isImage;}
	public String getIsNew() {return isNew;}
	public void setIsNew(String isNew) {this.isNew = isNew;}
	public String getIsFile() {return isFile;}
	public void setIsFile(String isFile) {this.isFile = isFile;}
	public String getIsMobile() {return isMobile;}
	public void setIsMobile(String isMobile) {this.isMobile = isMobile;}
}
