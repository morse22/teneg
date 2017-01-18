package kr.co.teneg.boardGood;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardGoodServiceImp implements BoardGoodService{
	
	@Autowired
	private BoardGoodDAO dao;

	@Override
	public void insert(BoardGoodVO boardGood) {
		dao.insert(boardGood);
	}

	@Override
	public BoardGoodVO select(BoardGoodVO boardGood) {
		return dao.select(boardGood);
	}

	@Override
	public int countByBoardNo(int boardNo) {
		return dao.countByBoardNo(boardNo);
	}
}
