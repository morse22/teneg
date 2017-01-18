package kr.co.teneg.manager.image;

public class ManagerImageVO {
	private int no;
	private String type;
	private String saveFileName;
	private String regDate;
	private String oriFileName;
	@Override
	public String toString() {
		return "ManagerImageVO [no=" + no + ", type=" + type + ", saveFileName=" + saveFileName + ", regDate=" + regDate
				+ ", oriFileName=" + oriFileName + "]";
	}
	public int getNo() {return no;}
	public void setNo(int no) {this.no = no;}
	public String getType() {return type;}
	public void setType(String type) {this.type = type;}
	public String getSaveFileName() {return saveFileName;}
	public void setSaveFileName(String saveFileName) {this.saveFileName = saveFileName;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public String getOriFileName() {return oriFileName;}
	public void setOriFileName(String oriFileName) {this.oriFileName = oriFileName;}
}
