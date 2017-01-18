package kr.co.teneg.auction;



import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.request.RequestDAO;
import kr.co.teneg.response.ResponseDAO;
import kr.co.teneg.response.ResponseVO;

@Service
public class AuctionServiceImp implements AuctionService {
	@Autowired
	private AuctionDAO dao;
	
	@Autowired
	private RequestDAO requestDAO;
	
	@Autowired
	private ResponseDAO responseDAO;

	public void join(AuctionVO auctionVO) {
		dao.join(auctionVO);
	}

	public List<AuctionVO> joinList(int requestNo) {

		return dao.joinList(requestNo);
	}

	public void choice(int no) {
		dao.choice(no);
	}

	public void choiceCancel(AuctionVO auctionVO) {
		dao.choiceCancel(auctionVO);
		
	}

	public AuctionVO selectedJoin(int requestNo) {
		return dao.selectedJoin(requestNo);
	}

	@Override
	public List<AuctionVO> selectByNo(HashMap<String, Object> map) {
		return dao.selectByNo(map);
	}

	@Override
	public void deleteNotNo(HashMap<String, Object> map) {
		dao.deleteNotNo(map);	
	}
	
	public void finishAuction(int requestNo, String expertId, int finalPrice){
		
		dao.deleteAllByRequestNo(requestNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("requestNo", requestNo);
		map.put("finalPrice", finalPrice);
		requestDAO.updateAuctionFinish(map);
		
		ResponseVO vo = new ResponseVO();
		vo.setRequestNo(requestNo);
		vo.setExpertId(expertId);
		vo.setNo(responseDAO.getNextRequestNo2());
		responseDAO.response(vo);
	}

	@Override
	public void deleteAllByRequestNo(int requestNo) {
		dao.deleteAllByRequestNo(requestNo);
	}

	@Override
	public void initInsert(AuctionVO auctionVO) {
		dao.initInsert(auctionVO);
	}
}
