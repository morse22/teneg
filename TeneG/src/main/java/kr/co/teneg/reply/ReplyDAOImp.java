package kr.co.teneg.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ReplyDAOImp implements ReplyDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insert(ReplyVO reply) {
		sqlSession.insert("kr.co.teneg.ReplyDAO.insert", reply);
	}

	public List<ReplyVO> selectByNo(int no) {
		return sqlSession.selectList("kr.co.teneg.ReplyDAO.selectByNo", no);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete("kr.co.teneg.ReplyDAO.delete", no);
	}

	@Override
	public void insertRR(ReplyVO reply) {
		sqlSession.insert("kr.co.teneg.ReplyDAO.insertRR", reply);
	}
}
