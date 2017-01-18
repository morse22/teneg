package kr.co.teneg.eggGift;

import java.util.List;

public interface EggGiftService {
	public String checkGift(String receiver, String sender);
	public void gift(EggGiftVO giftVO);
	public List<EggGiftVO> giftList(String id);
}
