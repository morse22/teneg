package kr.co.teneg.expert;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExpertDAOImp implements ExpertDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insert(ExpertVO expert) {
		sqlSession.insert("kr.co.teneg.ExpertDAO.insert", expert);
	}

	@Override
	public List<ExpertVO> selectAll(String type) {
		return sqlSession.selectList("kr.co.teneg.ExpertDAO.selectAll", type);
	}

	@Override
	public ExpertVO selectById(String id) {
		return sqlSession.selectOne("kr.co.teneg.ExpertDAO.selectById", id);
	}

	@Override
	public List<ExpertVO> selectApproved() {
		return sqlSession.selectList("kr.co.teneg.ExpertDAO.selectApproved");
	}

	@Override
	public void approve(String id) {
		sqlSession.update("kr.co.teneg.ExpertDAO.approve", id);
	}

	@Override
	public List<ExpertVO> selectByText(String searchText) {
		return sqlSession.selectList("kr.co.teneg.ExpertDAO.selectByText", searchText);
	}
}
