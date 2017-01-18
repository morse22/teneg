package kr.co.teneg.refund;

public class RefundVO {
	private int requestNo;
	private String title;
	private String content;
	private String writer;
	private String expertId;
	private String regDate;
	private String saveFileName;
	private String replyContent;
	@Override
	public String toString() {
		return "RefundVO [requestNo=" + requestNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", expertId=" + expertId + ", regDate=" + regDate + ", saveFileName=" + saveFileName
				+ ", replyContent=" + replyContent + "]";
	}
	
	public String getSaveFileName() {return saveFileName;}
	public void setSaveFileName(String saveFileName) {this.saveFileName = saveFileName;}
	public String getReplyContent() {return replyContent;}
	public void setReplyContent(String replyContent) {this.replyContent = replyContent;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public int getRequestNo() {return requestNo;}
	public void setRequestNo(int requestNo) {this.requestNo = requestNo;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public String getWriter() {return writer;}
	public void setWriter(String writer) {this.writer = writer;}
	public String getExpertId() {return expertId;}
	public void setExpertId(String expertId) {this.expertId = expertId;}
}
