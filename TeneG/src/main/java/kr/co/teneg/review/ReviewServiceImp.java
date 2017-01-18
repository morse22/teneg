package kr.co.teneg.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImp implements ReviewService{

	@Autowired
	private ReviewDAO dao;
	
	@Override
	public void insert(ReviewVO vo) {
		dao.insert(vo);
	}

	@Override
	public List<ReviewVO> selectById(String expertId) {
		return dao.selectById(expertId);
	}
}
