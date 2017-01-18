package kr.co.teneg.dbVO;

public class MemberPageVO {
	private int start;
	private int end;
	private String sort;
	private String searchType;
	private String period;
	private String searchText;
	@Override
	public String toString() {
		return "BoardPageVO [start=" + start + ", end=" + end + ", sort=" + sort + ", searchType=" + searchType
				+ ", period=" + period + ", searchText=" + searchText + "]";
	}
	public MemberPageVO(int start, int end, String sort, String searchType, String period, String searchText) {
		super();
		this.start = start;
		this.end = end;
		this.sort = sort;
		this.searchType = searchType;
		this.period = period;
		this.searchText = searchText;
	}
	public int getStart() {return start;}
	public void setStart(int start) {this.start = start;}
	public int getEnd() {return end;}
	public void setEnd(int end) {this.end = end;}
	public String getSort() {return sort;}
	public void setSort(String sort) {this.sort = sort;}
	public String getSearchType() {return searchType;}
	public void setSearchType(String searchType) {this.searchType = searchType;}
	public String getPeriod() {return period;}
	public void setPeriod(String period) {this.period = period;}
	public String getSearchText() {return searchText;}
	public void setSearchText(String searchText) {this.searchText = searchText;}
}
