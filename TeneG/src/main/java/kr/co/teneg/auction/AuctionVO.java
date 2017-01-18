package kr.co.teneg.auction;

public class AuctionVO {
	private int no ;
	private String id;
	private int requestNo;
	private int price;
	private String auctionDate;
	private String type;
	public AuctionVO() {
		super();
	}
	public AuctionVO(int no, String id, int requestNo, int price, String auctionDate, String type) {
		super();
		this.no = no;
		this.id = id;
		this.requestNo = requestNo;
		this.price = price;
		this.auctionDate = auctionDate;
		this.type = type;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRequestNo() {
		return requestNo;
	}
	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAuctionDate() {
		return auctionDate;
	}
	public void setAuctionDate(String auctionDate) {
		this.auctionDate = auctionDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "AuctionVO [no=" + no + ", id=" + id + ", requestNo=" + requestNo + ", price=" + price + ", auctionDate="
				+ auctionDate + ", type=" + type + "]";
	}	
}
