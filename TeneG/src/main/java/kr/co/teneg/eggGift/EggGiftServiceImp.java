package kr.co.teneg.eggGift;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.eggCharge.EggChargeDAO;
import kr.co.teneg.eggCharge.EggChargeVO;
import kr.co.teneg.eggExchange.EggExchangeDAO;
import kr.co.teneg.eggExchange.EggExchangeVO;
import kr.co.teneg.member.MemberDAO;

@Service
public class EggGiftServiceImp implements EggGiftService {
	@Autowired
	private EggGiftDAO dao;

	@Autowired
	private EggExchangeDAO exDao;

	@Autowired
	private EggChargeDAO chDao;

	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public String checkGift(String receiver , String sender) {
		
		int myEgg = exDao.myEgg(sender);
		String myId = memberDao.checkId(receiver);
		String check = myId +":" + myEgg;
		return check;
	}

	@Override
	public void gift(EggGiftVO giftVO) {
		EggChargeVO chargeVO = new EggChargeVO();
		EggExchangeVO exchangeVO = new EggExchangeVO();

		chargeVO.setId(giftVO.getReceiver());
		chargeVO.setChargeEgg(giftVO.getEgg());
		chDao.eggAdd(chargeVO);
		
		exchangeVO.setId(giftVO.getSender());
		exchangeVO.setExchangeEgg(giftVO.getEgg());
		exDao.eggSub(exchangeVO);
		
		dao.gift(giftVO);
	}

	@Override
	public List<EggGiftVO> giftList(String id) {
		return dao.giftList(id);
	}
	
	
	
	
}
