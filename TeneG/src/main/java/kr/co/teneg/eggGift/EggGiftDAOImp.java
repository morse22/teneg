package kr.co.teneg.eggGift;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class EggGiftDAOImp implements EggGiftDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void gift(EggGiftVO giftVO) {
		sqlSession.insert("kr.co.teneg.EggGiftDAO.gift", giftVO);
	}

	@Override
	public List<EggGiftVO> giftList(String id) {
		return sqlSession.selectList("kr.co.teneg.EggGiftDAO.giftList", id);
	}
	
	
	
	
}
