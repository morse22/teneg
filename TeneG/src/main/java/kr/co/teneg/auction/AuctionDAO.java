package kr.co.teneg.auction;

import java.util.HashMap;
import java.util.List;

public interface AuctionDAO {
	public void join(AuctionVO auctionVO);
	public List<AuctionVO> joinList(int requestNo);
	public void choice(int no);
	public void choiceCancel(AuctionVO auctionVO);
	public AuctionVO selectedJoin(int requestNo);
	
	public List<AuctionVO> selectByNo(HashMap<String, Object> map);
	public void deleteNotNo(HashMap<String, Object> map);
	public void deleteAllByRequestNo(int requestNo);
	public void initInsert(AuctionVO auctionVO);
}
