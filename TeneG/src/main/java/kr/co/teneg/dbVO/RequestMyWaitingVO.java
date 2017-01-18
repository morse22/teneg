package kr.co.teneg.dbVO;

public class RequestMyWaitingVO {
	private String id;
	private String title;
	private int price;
	private String regDate;
	private String expertId;
	private int requestNo;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
		return "RequestMyWaitingVO [id=" + id + ", title=" + title + ", price=" + price + ", regDate=" + regDate
				+ ", expertId=" + expertId + ", requestNo=" + requestNo + "]";
	}
	
	
	
	

}
