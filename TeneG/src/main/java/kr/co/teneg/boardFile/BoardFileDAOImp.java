package kr.co.teneg.boardFile;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardFileDAOImp implements BoardFileDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insert(BoardFileVO boardFile){
		sqlSession.insert("kr.co.teneg.BoardFileDAO.insert", boardFile);
	}

	public List<BoardFileVO> selectByNo(int no) {
		return sqlSession.selectList("kr.co.teneg.BoardFileDAO.selectByNo", no);
	}
}
