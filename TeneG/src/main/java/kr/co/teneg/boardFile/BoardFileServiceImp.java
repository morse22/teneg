package kr.co.teneg.boardFile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardFileServiceImp implements BoardFileService{
	
	@Autowired
	private BoardFileDAOImp dao;

	public void insert(BoardFileVO boardFile) {
		dao.insert(boardFile);
	}

	public List<BoardFileVO> selectByNo(int no) {
		return dao.selectByNo(no);
	}
}
