package kr.co.teneg.dbVO;

import org.springframework.web.multipart.MultipartFile;

public class MyInfoVO {
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
	private String saveFileName;
	private MultipartFile file1;
	private String expert;
	private int egg;
	private int memberScore;
	private String expertId;
	private String expertField;
	private String expertContent;
	private String expertRegDate;
	private String titleImage;
	private String mainImage;
	private String approval;
	
	
	
	
	
	@Override
	public String toString() {
		return "MyInfoVO [id=" + id + ", name=" + name + ", password=" + password + ", regDate=" + regDate + ", phone="
				+ phone + ", addr=" + addr + ", email=" + email + ", memberGrade=" + memberGrade + ", birth=" + birth
				+ ", sex=" + sex + ", introduce=" + introduce + ", phoneAlarm=" + phoneAlarm + ", expert=" + expert
				+ ", egg=" + egg + ", memberScore=" + memberScore + ", expertId=" + expertId + ", expertField="
				+ expertField + ", expertContent=" + expertContent + ", expertRegDate=" + expertRegDate
				+ ", titleImage=" + titleImage + ", mainImage=" + mainImage + ", approval=" + approval + "]";
	}

	public MyInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
	

	public MyInfoVO(String id, String name, String password, String regDate, String phone, String addr, String email,
			String memberGrade, String birth, String sex, String introduce, String phoneAlarm, String saveFileName,
			MultipartFile file1, String expert, int egg, int memberScore, String expertId, String expertField,
			String expertContent, String expertRegDate, String titleImage, String mainImage, String approval) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.regDate = regDate;
		this.phone = phone;
		this.addr = addr;
		this.email = email;
		this.memberGrade = memberGrade;
		this.birth = birth;
		this.sex = sex;
		this.introduce = introduce;
		this.phoneAlarm = phoneAlarm;
		this.saveFileName = saveFileName;
		this.file1 = file1;
		this.expert = expert;
		this.egg = egg;
		this.memberScore = memberScore;
		this.expertId = expertId;
		this.expertField = expertField;
		this.expertContent = expertContent;
		this.expertRegDate = expertRegDate;
		this.titleImage = titleImage;
		this.mainImage = mainImage;
		this.approval = approval;
	}

	public String getExpertId() {return expertId;}
	public void setExpertId(String expertId) {this.expertId = expertId;}
	public String getExpertField() {return expertField;}
	public void setExpertField(String expertField) {this.expertField = expertField;}
	public String getExpertContent() {return expertContent;}
	public void setExpertContent(String expertContent) {this.expertContent = expertContent;}
	public String getExpertRegDate() {return expertRegDate;}
	public void setExpertRegDate(String expertRegDate) {this.expertRegDate = expertRegDate;}
	public String getTitleImage() {return titleImage;}
	public void setTitleImage(String titleImage) {this.titleImage = titleImage;}
	public String getMainImage() {return mainImage;}
	public void setMainImage(String mainImage) {this.mainImage = mainImage;}
	public String getApproval() {return approval;}
	public void setApproval(String approval) {this.approval = approval;}
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
	public String getSaveFileName() {return saveFileName;}
	public void setSaveFileName(String saveFileName) {this.saveFileName = saveFileName;}
	public MultipartFile getFile1() {return file1;}
	public void setFile1(MultipartFile file1) {this.file1 = file1;}

	
}
