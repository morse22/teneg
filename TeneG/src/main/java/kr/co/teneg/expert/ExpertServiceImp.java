package kr.co.teneg.expert;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpertServiceImp implements ExpertService{
	
	@Autowired
	private ExpertDAO dao;

	@Override
	public void insert(ExpertVO expert) {
		dao.insert(expert);
	}

	@Override
	public List<ExpertVO> selectAll(String type) {
		return dao.selectAll(type);
	}

	@Override
	public ExpertVO selectById(String id) {
		return dao.selectById(id);
	}

	@Override
	public List<ExpertVO> selectApproved() {
		return dao.selectApproved();
	}

	@Override
	public void approve(String id) {
		dao.approve(id);
	}

	@Override
	public List<ExpertVO> selectByText(String searchText) {
		return dao.selectByText(searchText);
	}
}
