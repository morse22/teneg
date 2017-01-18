package kr.co.teneg.eggCharge;

import java.util.List;

public interface EggChargeService {
	public void charge(EggChargeVO eggChargeVO);
	public void eggAdd(EggChargeVO eggChargeVO);
	public List<EggChargeVO> chargeList(String id);
	
}
