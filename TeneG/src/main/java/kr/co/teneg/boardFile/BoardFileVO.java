package kr.co.teneg.boardFile;

public class BoardFileVO {
	private int no;
	private int boardNo;
	private int fileSize;
	private String oriFileName;
	private String saveFileName;
	@Override
	public String toString() {
		return "BoardFileVO [no=" + no + ", boardNo=" + boardNo + ", fileSize=" + fileSize + ", oriFileName="
				+ oriFileName + ", saveFileName=" + saveFileName + "]";
	}
	public String getOriFileName() {return oriFileName;}
	public void setOriFileName(String oriFileName) {this.oriFileName = oriFileName;}
	public String getSaveFileName() {return saveFileName;}
	public void setSaveFileName(String saveFileName) {this.saveFileName = saveFileName;}
	public int getNo() {return no;}
	public void setNo(int no) {this.no = no;}
	public int getBoardNo() {return boardNo;}
	public void setBoardNo(int boardNo) {this.boardNo = boardNo;}
	public int getFileSize() {return fileSize;}
	public void setFileSize(int fileSize) {this.fileSize = fileSize;}
}
