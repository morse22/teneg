package kr.co.teneg.manager.image;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerImageDAOImp implements ManagerImageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void update(ManagerImageVO managerImageVO) {
		sqlSession.update("kr.co.teneg.manager.image.ManagerImageDAO.update", managerImageVO);
	}
}
