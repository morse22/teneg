package kr.co.teneg.dbVO;

public class RequestQueryVO {
	private String expertId;
	private int requestNo;
	public RequestQueryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RequestQueryVO(String expertId, int requestNo) {
		super();
		this.expertId = expertId;
		this.requestNo = requestNo;
	}
	public String getExpertId() {
		return expertId;
	}
	public void setExpertId(String expertId) {
		this.expertId = expertId;
	}
	public int getRequestNo() {
		return requestNo;
	}
	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}
	@Override
	public String toString() {
		return "RequestQueryVO [expertId=" + expertId + ", requestNo=" + requestNo + "]";
	}
	
	
	
}
