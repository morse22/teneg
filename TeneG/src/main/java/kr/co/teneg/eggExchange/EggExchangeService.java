package kr.co.teneg.eggExchange;

import java.util.List;


public interface EggExchangeService {
	public void exchange(EggExchangeVO eggExchangeVO);
	public void eggSub(EggExchangeVO eggExchangeVO);
	public List<EggExchangeVO> exchangeList(String id);
	public int myEgg(String id);
}
