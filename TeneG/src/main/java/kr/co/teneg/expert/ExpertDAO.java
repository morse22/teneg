package kr.co.teneg.expert;

import java.util.List;

public interface ExpertDAO {
	public void insert(ExpertVO expert);
	public List<ExpertVO> selectAll(String type);
	public List<ExpertVO> selectApproved();
	public ExpertVO selectById(String id);
	public void approve(String id);
	public List<ExpertVO> selectByText(String searchText);
}
