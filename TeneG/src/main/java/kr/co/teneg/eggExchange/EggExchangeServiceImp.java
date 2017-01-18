package kr.co.teneg.eggExchange;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.eggCharge.EggChargeVO;

@Service
public class EggExchangeServiceImp implements EggExchangeService {
	@Autowired
	private EggExchangeDAO dao;

	public void exchange(EggExchangeVO eggExchangeVO) {
		dao.exchange(eggExchangeVO);
	}

	public void eggSub(EggExchangeVO eggExchangeVO) {
		dao.eggSub(eggExchangeVO);
	}

	public List<EggExchangeVO> exchangeList(String id) {

		return dao.exchangeList(id);
	}

	public int myEgg(String id) {
		
		return dao.myEgg(id);
	}
	
	
}
