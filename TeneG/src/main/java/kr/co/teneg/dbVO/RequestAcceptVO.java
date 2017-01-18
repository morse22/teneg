package kr.co.teneg.dbVO;

public class RequestAcceptVO {
	private String expertId;
	private String success;
	public RequestAcceptVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RequestAcceptVO(String expertId, String success) {
		super();
		this.expertId = expertId;
		this.success = success;
	}
	public String getExpertId() {
		return expertId;
	}
	public void setExpertId(String expertId) {
		this.expertId = expertId;
	}
	public String getSuccess() {
		return success;
	}
	public void setSuccess(String success) {
		this.success = success;
	}
	@Override
	public String toString() {
		return "RequestAcceptVO [expertId=" + expertId + ", success=" + success + "]";
	}
	
	
	
	

}
