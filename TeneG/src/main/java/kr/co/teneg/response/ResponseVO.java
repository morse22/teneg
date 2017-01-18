package kr.co.teneg.response;

public class ResponseVO {
	private int no;
	private int requestNo;
	private String expertId;
	private String status;
	private String regDate;
	private String readCheck;
	private String completeDate;
	private String saveFileName;
	
	public String getSaveFileName() {return saveFileName;}
	public void setSaveFileName(String saveFileName) {this.saveFileName = saveFileName;}
	public String getCompleteDate() {return completeDate;}
	public void setCompleteDate(String completeDate) {this.completeDate = completeDate;}
	public int getNo() {return no;}
	public void setNo(int no) {this.no = no;}
	public int getRequestNo() {return requestNo;}
	public void setRequestNo(int requestNo) {this.requestNo = requestNo;}
	public String getExpertId() {return expertId;}
	public void setExpertId(String expertId) {this.expertId = expertId;}
	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public String getReadCheck() {return readCheck;}
	public void setReadCheck(String readCheck) {this.readCheck = readCheck;}
	@Override
	public String toString() {
		return "ResponseVO [no=" + no + ", requestNo=" + requestNo + ", expertId=" + expertId + ", status=" + status
				+ ", regDate=" + regDate + ", readCheck=" + readCheck + ", completeDate=" + completeDate
				+ ", saveFileName=" + saveFileName + "]";
	}
}
