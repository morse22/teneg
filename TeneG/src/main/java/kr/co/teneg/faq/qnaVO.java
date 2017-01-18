package kr.co.teneg.faq;



public class qnaVO {
	
	private int no;
	private String productName;
	private String title;
	private String writer;
	private String type;
	private String content;
	private String regDate;
	private String answerer;
	private String answer;
	private String modifyDate;
	
	
	public qnaVO() {
	
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getAnswerer() {
		return answerer;
	}


	public void setAnswerer(String answerer) {
		this.answerer = answerer;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public String getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}


	@Override
	public String toString() {
		return "qnaVO [no=" + no + ", productName=" + productName + ", title=" + title + ", writer=" + writer
				+ ", type=" + type + ", content=" + content + ", regDate=" + regDate + ", answerer=" + answerer
				+ ", answer=" + answer + ", modifyDate=" + modifyDate + "]";
	}

	
	
}
