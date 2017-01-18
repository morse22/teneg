package kr.co.teneg.dbVO;

public class RequestCountVO {
	private int dCount;
	private int pCount;
	private int cCount;
	private int mCount;
	@Override
	public String toString() {
		return "RequestCountVO [dCount=" + dCount + ", pCount=" + pCount + ", cCount=" + cCount + ", mCount=" + mCount
				+ "]";
	}
	public int getdCount() {return dCount;}
	public void setdCount(int dCount) {this.dCount = dCount;}
	public int getpCount() {return pCount;}
	public void setpCount(int pCount) {this.pCount = pCount;}
	public int getcCount() {return cCount;}
	public void setcCount(int cCount) {this.cCount = cCount;}
	public int getmCount() {return mCount;}
	public void setmCount(int mCount) {this.mCount = mCount;}
}
