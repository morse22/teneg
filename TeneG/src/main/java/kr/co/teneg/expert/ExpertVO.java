package kr.co.teneg.expert;

public class ExpertVO {
	private String id;
	private String field;
	private String content;
	private String regDate;
	private String title;
	private String titleImage;
	private String mainImage;
	private String approval;
	@Override
	public String toString() {
		return "ExpertVO [id=" + id + ", field=" + field + ", content=" + content + ", regDate=" + regDate + ", title="
				+ title + ", titleImage=" + titleImage + ", mainImage=" + mainImage + ", approval=" + approval + "]";
	}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getField() {return field;}
	public void setField(String field) {this.field = field;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public String getTitleImage() {return titleImage;}
	public void setTitleImage(String titleImage) {this.titleImage = titleImage;}
	public String getMainImage() {return mainImage;}
	public void setMainImage(String mainImage) {this.mainImage = mainImage;}
	public String getApproval() {return approval;}
	public void setApproval(String approval) {this.approval = approval;}	
}
