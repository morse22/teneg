package kr.co.teneg.eggCharge;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EggChargeServiceImp implements EggChargeService {
	@Autowired
	private EggChargeDAO dao;

	public void charge(EggChargeVO eggChargeVO) {
		dao.charge(eggChargeVO);
	}

	public void eggAdd(EggChargeVO eggChargeVO) {
		dao.eggAdd(eggChargeVO);
	}

	public List<EggChargeVO> chargeList(String id) {
		List<EggChargeVO> chargeList = dao.chargeList(id);
		return chargeList;
	}
	
	
}
