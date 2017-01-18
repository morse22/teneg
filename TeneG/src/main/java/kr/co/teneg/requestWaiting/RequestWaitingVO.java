package kr.co.teneg.requestWaiting;

public class RequestWaitingVO {
	private int requestNo;
	private String expertId;
	private String regDate;
	private String readCheck;
	
	public int getRequestNo() {return requestNo;}
	public void setRequestNo(int requestNo) {this.requestNo = requestNo;}
	public String getExpertId() {return expertId;}
	public void setExpertId(String expertId) {this.expertId = expertId;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public String getReadCheck() {return readCheck;}
	public void setReadCheck(String readCheck) {this.readCheck = readCheck;}
	@Override
	public String toString() {
		return "RequestWaitingVO [requestNo=" + requestNo + ", expertId=" + expertId + ", regDate=" + regDate
				+ ", readCheck=" + readCheck + "]";
	}
}
