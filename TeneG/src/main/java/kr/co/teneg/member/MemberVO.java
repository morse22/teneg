package kr.co.teneg.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String id;
	private String name;
	private String password;
	private String regDate;
	private String phone;
	private String addr;
	private String email;
	private String memberGrade;
	private String birth;
	private String sex;
	private String introduce;
	private String phoneAlarm;
	private String expert;
	private int egg;
	private int memberScore;
	private MultipartFile file1;
	private String saveFileName;
	
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", password=" + password + ", regDate=" + regDate + ", phone="
				+ phone + ", addr=" + addr + ", email=" + email + ", memberGrade=" + memberGrade + ", egg=" + egg
				+ ", memberScore=" + memberScore + ", birth=" + birth + ", sex=" + sex + ", introduce=" + introduce
				+ ", phoneAlarm=" + phoneAlarm + ", expert=" + expert + "]";
	}
	
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getPassword() {return password;}
	public void setPassword(String password) {this.password = password;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public String getPhone() {return phone;}
	public void setPhone(String phone) {this.phone = phone;}
	public String getAddr() {return addr;}
	public void setAddr(String addr) {this.addr = addr;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getMemberGrade() {return memberGrade;}
	public void setMemberGrade(String memberGrade) {this.memberGrade = memberGrade;}
	public int getEgg() {return egg;}
	public void setEgg(int egg) {this.egg = egg;}
	public int getMemberScore() {return memberScore;}
	public void setMemberScore(int memberScore) {this.memberScore = memberScore;}
	public String getBirth() {return birth;}
	public void setBirth(String birth) {this.birth = birth;}
	public String getSex() {return sex;}
	public void setSex(String sex) {this.sex = sex;}
	public String getIntroduce() {return introduce;}
	public void setIntroduce(String introduce) {this.introduce = introduce;}
	public String getPhoneAlarm() {return phoneAlarm;}
	public void setPhoneAlarm(String phoneAlarm) {this.phoneAlarm = phoneAlarm;}
	public String getExpert() {return expert;}
	public void setExpert(String expert) {this.expert = expert;}
	public MultipartFile  getFile1(){return file1;}
	public void setFile1(MultipartFile file1) {this.file1 = file1;}
	public String getSaveFileName() {return saveFileName;}
	public void setSaveFileName(String saveFileName) {this.saveFileName = saveFileName;}
	
	
	
}
