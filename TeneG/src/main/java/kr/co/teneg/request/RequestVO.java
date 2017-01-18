package kr.co.teneg.request;

public class RequestVO {
	private int no;
	private String id;
	private String title;
	private String field;
	private String content;
	private String deadline;
	private String status;
	private int progress;
	private int price;
	private String premium;
	private String regDate;
	private String saveFileName;
	
	public int getNo() {return no;}
	public void setNo(int no) {this.no = no;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public String getField() {return field;}
	public void setField(String field) {this.field = field;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public String getDeadline() {return deadline;}
	public void setDeadline(String deadline) {this.deadline = deadline;}
	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}
	public int getProgress() {return progress;}
	public void setProgress(int progress) {this.progress = progress;}
	public int getPrice() {return price;}
	public void setPrice(int price) {this.price = price;}
	public String getPremium() {return premium;}
	public void setPremium(String premium) {this.premium = premium;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public String getSaveFileName() {return saveFileName;}
	public void setSaveFileName(String saveFileName) {this.saveFileName = saveFileName;}
	@Override
	public String toString() {
		return "RequestVO [no=" + no + ", id=" + id + ", title=" + title + ", field=" + field + ", content=" + content
				+ ", deadline=" + deadline + ", status=" + status + ", progress=" + progress + ", price=" + price
				+ ", premium=" + premium + ", regDate=" + regDate + "]";
	}
}
