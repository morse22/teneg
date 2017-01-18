package kr.co.teneg.dbVO;

public class RequestListVO {
	private int no;
	private int progress;
	private int price;
	private String id;
	private String title;
	private String field;
	private String content;
	private String deadline;
	private String status;
	private String premium;
	private String regDate;
	private String saveFileName;
	private String expertId;
	
	private String isNew; // Y, N
	private String isRequested; // Y, N
	
	public String getIsNew() {return isNew;}
	public void setIsNew(String isNew) {this.isNew = isNew;}
	public String getIsRequested() {return isRequested;}
	public void setIsRequested(String isRequested) {this.isRequested = isRequested;}
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
	public String getExpertId() {return expertId;}
	public void setExpertId(String expertId) {this.expertId = expertId;}
	@Override
	public String toString() {
		return "RequestListVO [no=" + no + ", progress=" + progress + ", price=" + price + ", id=" + id + ", title="
				+ title + ", field=" + field + ", content=" + content + ", deadline=" + deadline + ", status=" + status
				+ ", premium=" + premium + ", regDate=" + regDate + ", saveFileName=" + saveFileName + ", expertId="
				+ expertId + ", isNew=" + isNew + ", isRequested=" + isRequested + "]";
	}
}
