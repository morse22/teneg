package kr.co.teneg.eggGift;

import java.util.List;

public interface EggGiftDAO {
	public void gift(EggGiftVO giftVO);
	public List<EggGiftVO> giftList(String id);
}
