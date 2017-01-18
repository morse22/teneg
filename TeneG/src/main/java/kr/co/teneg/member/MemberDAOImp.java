package kr.co.teneg.member;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.teneg.dbVO.MemberPageVO;
import kr.co.teneg.dbVO.MyInfoVO;
import kr.co.teneg.request.RequestVO;

@Repository
public class MemberDAOImp implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
//	회원가입
	@Override
	public void signUp(MemberVO member) {
		sqlSessionTemplate.insert("kr.co.teneg.member.dao.MemberDAO.signUp", member);
		
	}
//	로그인
	@Override
	public MemberVO login(MemberVO member) {
		MemberVO memberVO = sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.login", member);
		return memberVO;
	}
	
//	마이페이지 불러오기
	@Override
	public MemberVO myPage(MemberVO member) {
		MemberVO memberVO = sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.myPage", member);
		return memberVO;
	}
	
//	마이페이지 수정
	@Override
	public void myPageUpdate(MemberVO member) {
		sqlSessionTemplate.update("kr.co.teneg.member.dao.MemberDAO.myPageUpdate", member);
	}
	
//	회원 상세정보 보기
	@Override
	public MemberVO memberDetail(MemberVO member) {
		MemberVO memberVO = sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.memberDetail", member);
		return memberVO;
	}
	
//	관리자의 회원 삭제, 회원의 탈퇴
	@Override
	public void memberDelete(MemberVO member) {
		sqlSessionTemplate.delete("kr.co.teneg.member.dao.MemberDAO.memberDelete", member);
	}
	
//	아이디 중복 확인
	@Override
	public String checkId(String id) {
		id = sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.checkId", id);
		return id;
	}
	
	@Override
	public String findId(MemberVO member) {
		return sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.findId", member);
	}
	@Override
	public String checkPhone(String phone) {
		return sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.checkPhone", phone);
	}
	@Override
	public String checkEmail(String email) {
		return sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.checkEmail", email);
	}
	@Override
	public String findPw(MemberVO member) {
		return sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.findPw", member);
	}
	@Override
	public void changePw(MemberVO memberVO) {
		sqlSessionTemplate.update("kr.co.teneg.member.dao.MemberDAO.changePw", memberVO);
	}
	@Override
	public String checkLogin(MemberVO memberVO) {
		return sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.loginCheck", memberVO);
	}
	
//	전체회원수 카운트
	@Override
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.selectTotalCount");
	}
	
//	오늘 가입한 회원
	@Override
	public int newMemberCount() {
		return sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.newMemberCount");
	}
	
//	검색조건에 맞춰서 뽑아냄
	@Override
	public List<MemberVO> list(MemberPageVO memberPage) {
		return sqlSessionTemplate.selectList("kr.co.teneg.member.dao.MemberDAO.selectSearchList", memberPage);
	}
	
//	선택 회원 삭제
	@Override
	public void deleteList(List<String> list) {
		sqlSessionTemplate.delete("kr.co.teneg.member.dao.MemberDAO.deleteList", list);
	}
	public MyInfoVO infoList(String id){

		return sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.selectInfo", id);
	}
	@Override
	public int getEggById(String id) {
		return sqlSessionTemplate.selectOne("kr.co.teneg.member.dao.MemberDAO.getEggById", id);
	}

	@Override
	public void subStractEgg(RequestVO vo) {
		sqlSessionTemplate.update("kr.co.teneg.member.dao.MemberDAO.subStractEgg", vo);
		
	}
	@Override
	public void addEgg(HashMap<String, Object> map) {
		sqlSessionTemplate.update("kr.co.teneg.member.dao.MemberDAO.addEgg", map);
		
	}
}
