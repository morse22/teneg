package kr.co.teneg.eggCharge;

public class EggChargeVO {
	private int no;
	private String id;
	private int amount;
	private int chargeEgg;
	private String chargeDate;
	private String paymentOption;
	private String visible;
	private String type;
	public EggChargeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getChargeEgg() {
		return chargeEgg;
	}

	public EggChargeVO(int no, String id, int amount, int chargeEgg, String chargeDate, String paymentOption,
			String visible, String type) {
		super();
		this.no = no;
		this.id = id;
		this.amount = amount;
		this.chargeEgg = chargeEgg;
		this.chargeDate = chargeDate;
		this.paymentOption = paymentOption;
		this.visible = visible;
		this.type = type;
	}

	public void setChargeEgg(int chargeEgg) {
		this.chargeEgg = chargeEgg;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
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
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getChargeDate() {
		return chargeDate;
	}
	public void setChargeDate(String chargeDate) {
		this.chargeDate = chargeDate;
	}
	public String getPaymentOption() {
		return paymentOption;
	}
	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}
	public String getVisible() {
		return visible;
	}
	public void setVisible(String visible) {
		this.visible = visible;
	}

	@Override
	public String toString() {
		return "EggChargeVO [no=" + no + ", id=" + id + ", amount=" + amount + ", chargeEgg=" + chargeEgg
				+ ", chargeDate=" + chargeDate + ", paymentOption=" + paymentOption + ", visible=" + visible + ", type="
				+ type + "]";
	}

	
}
