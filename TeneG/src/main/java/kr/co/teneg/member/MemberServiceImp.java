package kr.co.teneg.member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.dbVO.MemberPageVO;
import kr.co.teneg.dbVO.MyInfoVO;
import kr.co.teneg.request.RequestVO;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	private MemberDAO dao;
	
//	회원 가입.
	@Override
	public void signUp(MemberVO member) {
		dao.signUp(member);
	}
	
//	로그인
	@Override
	public MemberVO login(MemberVO member) {
		MemberVO memberVO = dao.login(member);
		return memberVO;
	}

//	마이페이지 불러오기
	@Override
	public MemberVO myPage(MemberVO member) {
		MemberVO memberVO = dao.myPage(member);
		return memberVO;
	}

//	마이페이지 수정
	@Override
	public void myPageUpdate(MemberVO member) {
		dao.myPageUpdate(member);
	}

//	회원 상세 정보 보기
	@Override
	public MemberVO memberDetail(MemberVO member) {
		MemberVO memberVO = dao.memberDetail(member);
		return memberVO;
	}

//	관리자의 회원 삭제, 회원의 탈퇴
	@Override
	public void memberDelete(MemberVO member) {
		dao.memberDelete(member);
	}
	
//	아이디 중복 체크
	@Override
	public String checkId(String id) {
		id = dao.checkId(id);
		return id;
	}

	@Override
	public String findId(MemberVO member) {
		return dao.findId(member);
	}

	@Override
	public String checkPhone(String phone) {
		return dao.checkPhone(phone);
	}

	@Override
	public String checkEmail(String email) {
		return dao.checkEmail(email);
	}

	@Override
	public String findPw(MemberVO member) {
		return dao.findPw(member);
	}

	@Override
	public void changePw(MemberVO memberVO) {
		dao.changePw(memberVO);
	}

	@Override
	public String checkLogin(MemberVO memberVO) {
		return dao.checkLogin(memberVO);
	}	

//	전체회원수 카운트
	@Override
	public int getTotalCount() {
		return dao.getTotalCount();
	}
	
//	오늘 가입한 회원
	@Override
	public int newMemberCount() {
		return dao.newMemberCount();
	}
	
//	검색
	@Override
	public List<MemberVO> list(MemberPageVO memberPage) {
		return dao.list(memberPage);
	}
	
//	선택 회원 삭제
	@Override
	public void deleteList(List<String> list) {
		dao.deleteList(list);
	}
	public MyInfoVO info(String id){
		return dao.infoList(id);
	}

	@Override
	public int getEggById(String id) {
		return dao.getEggById(id);
	}

	@Override
	public void subStractEgg(RequestVO vo) {
		dao.subStractEgg(vo);
	}

	@Override
	public void addEgg(HashMap<String, Object> map) {
		dao.addEgg(map);
	}
}
