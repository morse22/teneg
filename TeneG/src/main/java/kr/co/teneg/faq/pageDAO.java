package kr.co.teneg.faq;

public class pageDAO {

	static final int page_scale=5;
	static final int bloack_scale=5;
	private int curPage;
	private int prevPage;
	private int nextPage;
	private	int totPage;
	private int totBlock;
	private int curBlock;
	private int prevBlock;
	private int nextBlock;
	private int startPage;
	private int endPage;
	private int startBlock;
	private int endBlock;
	
	public pageDAO(int count, int curPage){
		curBlock =1; 
		this.curPage = curPage; 
		setTotPage(count);
		setPageRange();
		setTotBlock();
		setBloackRange();
		 
	}
	public void setBloackRange(){
	
		curBlock = (int)Math.ceil((curPage-1) / bloack_scale)+1;
		startBlock = (curBlock -1 ) * bloack_scale +1;
		endBlock = startBlock + bloack_scale -1;
		if(endBlock > totPage){
			endBlock = totPage;
		}

		prevPage = (curBlock == 1) ? 1 : (curBlock -1)*bloack_scale;
		
		nextPage = curBlock > totBlock ? (curBlock*bloack_scale)
		: (curBlock * bloack_scale) + 1;
	
		if(nextPage >= totPage){
			nextPage  = totPage;
	}
	
}
	public void setTotBlock(){
		totBlock = (int)Math.ceil(totPage/bloack_scale);
				
	}

	public void setPageRange(){
		startPage = (curPage -1 ) * page_scale + 1;
		endPage = startPage + page_scale -1;
	}
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int count) {
		totPage=(int)Math.ceil((count * 1.0)/page_scale);
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getTotBlock() {
		return totBlock;
	}
	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	
	
	
}
