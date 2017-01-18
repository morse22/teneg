package kr.co.teneg.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImp implements ReviewDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insert(ReviewVO vo) {
		sqlSession.insert("kr.co.teneg.ReviewDAO.insert", vo);
	}

	@Override
	public List<ReviewVO> selectById(String expertId) {
		return sqlSession.selectList("kr.co.teneg.ReviewDAO.selectById", expertId);
	}
}
