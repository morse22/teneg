package kr.co.teneg.review;

import java.util.List;

public interface ReviewDAO {
	public void insert(ReviewVO vo);
	public List<ReviewVO> selectById(String expertId);
}
