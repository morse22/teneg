package kr.co.teneg.dbVO;

public class ResponseListVO {
	private int no;
	private int requestNo;
	private int progress;
	private String expertId;
	private String status;
	private String regDate;
	private String readCheck;
	private String completeDate;
	
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
	public int getProgress() {return progress;}
	public void setProgress(int progress) {this.progress = progress;}
	@Override
	public String toString() {
		return "ResponseListVO [no=" + no + ", requestNo=" + requestNo + ", progress=" + progress + ", expertId="
				+ expertId + ", status=" + status + ", regDate=" + regDate + ", readCheck=" + readCheck
				+ ", completeDate=" + completeDate + "]";
	}
}
