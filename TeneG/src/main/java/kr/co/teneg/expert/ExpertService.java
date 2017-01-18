package kr.co.teneg.expert;

import java.util.List;

public interface ExpertService {
	public void insert(ExpertVO expert);
	public List<ExpertVO> selectAll(String type);
	public ExpertVO selectById(String id);
	public List<ExpertVO> selectApproved();
	public void approve(String id);
	public List<ExpertVO> selectByText(String searchText);
}
