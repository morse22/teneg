package kr.co.teneg.auction;

import java.util.HashMap;
import java.util.List;

public interface AuctionService {
	public void join(AuctionVO auctionVO);
	public List<AuctionVO> joinList(int requestNo);
	public void choice(int no);
	public void choiceCancel(AuctionVO auctionVO);
	public AuctionVO selectedJoin(int requestNo);
	
	public List<AuctionVO> selectByNo(HashMap<String, Object> map);
	public void deleteNotNo(HashMap<String, Object> map);
	public void deleteAllByRequestNo(int requestNo);
	public void finishAuction(int requestNo, String expertId, int finalPrice);
	public void initInsert(AuctionVO auctionVO);
}
