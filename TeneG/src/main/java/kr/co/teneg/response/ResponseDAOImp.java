package kr.co.teneg.response;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.dbVO.ResponseListVO;
import kr.co.teneg.request.RequestVO;


@Service
public class ResponseDAOImp implements ResponseDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void response(ResponseVO responseVO) {
		sqlSession.insert("kr.co.teneg.ResponseDAO.response", responseVO);
	}
	public int getNextRequestNo2() {
		return sqlSession.selectOne("kr.co.teneg.ResponseDAO.getNextNo2");
	}

	public List<ResponseListVO> list(String id){
		return sqlSession.selectList("kr.co.teneg.ResponseDAO.selectAll",id);	
	}
	public int readNcount(String userid){
		return sqlSession.selectOne("kr.co.teneg.ResponseDAO.readNcount", userid);
	}
	@Override
	public void read(){
		sqlSession.update("kr.co.teneg.ResponseDAO.read");
	}
	@Override
	public void doComplete(RequestVO vo) {
		sqlSession.update("kr.co.teneg.ResponseDAO.doComplete", vo);
	}
}