package kr.co.teneg.eggGift;

public class EggGiftVO {
	private int no;
	private String receiver;
	private String sender;
	private int egg;
	private String regDate;
	private String read;
	private String title;
	public EggGiftVO() {
		super();
	}
	public EggGiftVO(int no, String receiver, String sender, int egg, String regDate, String read, String title) {
		super();
		this.no = no;
		this.receiver = receiver;
		this.sender = sender;
		this.egg = egg;
		this.regDate = regDate;
		this.read = read;
		this.title = title;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public int getEgg() {
		return egg;
	}
	public void setEgg(int egg) {
		this.egg = egg;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "EggGiftVO [no=" + no + ", receiver=" + receiver + ", sender=" + sender + ", egg=" + egg + ", regDate="
				+ regDate + ", read=" + read + ", title=" + title + "]";
	}
	
	
}
