package kr.co.teneg.refund;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RefundDAOImp implements RefundDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void insert(RefundVO vo) {
		sqlSession.insert("kr.co.teneg.refund.RefundDAO.insert", vo);
	}

	@Override
	public List<RefundVO> plist() {
		return sqlSession.selectList("kr.co.teneg.refund.RefundDAO.plist");
	}

	@Override
	public RefundVO selectByNo(int requestNo) {
		return sqlSession.selectOne("kr.co.teneg.refund.RefundDAO.selectByNo", requestNo);
	}

	@Override
	public void refundOK(int requestNo) {
		sqlSession.update("kr.co.teneg.refund.RefundDAO.refundOK", requestNo);
	}

	@Override
	public void doRR(RefundVO vo) {
		sqlSession.update("kr.co.teneg.refund.RefundDAO.doRR", vo);
	}
}
