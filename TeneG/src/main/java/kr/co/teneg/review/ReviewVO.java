package kr.co.teneg.review;

public class ReviewVO {
	private int no;
	private int requestNo;
	private String content;
	private String writer;
	private String regDate;
	private String expertId;
	private int grade;
	private int price;
	
	@Override
	public String toString() {
		return "ReviewVO [no=" + no + ", requestNo=" + requestNo + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", expertId=" + expertId + ", grade=" + grade + ", price=" + price + "]";
	}
	
	public int getPrice() {return price;}
	public void setPrice(int price) {this.price = price;}
	public String getExpertId() {return expertId;}
	public void setExpertId(String expertId) {this.expertId = expertId;}
	public int getNo() {return no;}
	public void setNo(int no) {this.no = no;}
	public int getRequestNo() {return requestNo;}
	public void setRequestNo(int requestNo) {this.requestNo = requestNo;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public String getWriter() {return writer;}
	public void setWriter(String writer) {this.writer = writer;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public int getGrade() {return grade;}
	public void setGrade(int grade) {this.grade = grade;}
}
