package kr.co.teneg.eggExchange;

public class EggExchangeVO {
	private int no;
	private int amount;
	private int exchangeEgg;
	private String id;
	private String password;
	private String exchangeDate;
	private String type;
	public EggExchangeVO() {
		super();
	}
	public EggExchangeVO(int no, int amount, int exchangeEgg, String id, String password, String exchangeDate,
			String type) {
		super();
		this.no = no;
		this.amount = amount;
		this.exchangeEgg = exchangeEgg;
		this.id = id;
		this.password = password;
		this.exchangeDate = exchangeDate;
		this.type = type;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getExchangeEgg() {
		return exchangeEgg;
	}
	
	public void setExchangeEgg(int exchangeEgg) {
		this.exchangeEgg = exchangeEgg;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getExchangeDate() {
		return exchangeDate;
	}
	public void setExchangeDate(String exchangeDate) {
		this.exchangeDate = exchangeDate;
	}




	@Override
	public String toString() {
		return "EggExchangeVO [no=" + no + ", amount=" + amount + ", exchangeEgg=" + exchangeEgg + ", id=" + id
				+ ", password=" + password + ", exchangeDate=" + exchangeDate + ", type=" + type + "]";
	}




	
}
