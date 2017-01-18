package kr.co.teneg.eggCharge;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EggChargeDAOImp implements EggChargeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void charge(EggChargeVO eggChargeVO) {
		sqlSession.insert("kr.co.teneg.EggChargeDAO.eggCharge", eggChargeVO);
	}

	public void eggAdd(EggChargeVO eggChargeVO) {
		sqlSession.update("kr.co.teneg.EggChargeDAO.eggAdd", eggChargeVO);
		
	}

	public List<EggChargeVO> chargeList(String id) {
		return sqlSession.selectList("kr.co.teneg.EggChargeDAO.eggChargeList", id);
		
	}
	
	
}
