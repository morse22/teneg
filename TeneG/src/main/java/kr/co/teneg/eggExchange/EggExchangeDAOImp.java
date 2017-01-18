package kr.co.teneg.eggExchange;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.eggCharge.EggChargeVO;

@Service
public class EggExchangeDAOImp implements EggExchangeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void exchange(EggExchangeVO eggExchangeVO) {
		sqlSession.insert("kr.co.teneg.EggExchangeDAO.eggExchange", eggExchangeVO);
	}

	public void eggSub(EggExchangeVO eggExchangeVO) {
		sqlSession.update("kr.co.teneg.EggExchangeDAO.eggSub", eggExchangeVO);
		
	}

	public List<EggExchangeVO> exchangeList(String id) {
		return sqlSession.selectList("kr.co.teneg.EggExchangeDAO.eggExchangeList", id);
	}

	public int myEgg(String id) {

		return sqlSession.selectOne("kr.co.teneg.EggExchangeDAO.myEgg",id);
	}

	
}
