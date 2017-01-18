package kr.co.teneg.member;

import java.util.HashMap;
import java.util.List;

import kr.co.teneg.dbVO.MemberPageVO;
import kr.co.teneg.dbVO.MyInfoVO;
import kr.co.teneg.request.RequestVO;

public interface MemberDAO {
	public void signUp(MemberVO member);
	public MemberVO login(MemberVO member);
	public MemberVO myPage(MemberVO member);
	public void myPageUpdate(MemberVO member);
	public MemberVO memberDetail(MemberVO member);
	public void memberDelete(MemberVO member);
	public String checkId(String id);
	public String checkPhone(String phone);
	public String checkEmail(String email);
	public String findId(MemberVO member);
	public String findPw(MemberVO member);
	public void changePw(MemberVO memberVO);
	public String checkLogin(MemberVO memberVO);
	public int getTotalCount();
	public int newMemberCount();
	public List<MemberVO> list(MemberPageVO memberPage);
	public void deleteList(List<String> list);
	public MyInfoVO infoList(String id);
	
	public int getEggById(String id);
	public void subStractEgg(RequestVO vo);
	public void addEgg(HashMap<String, Object> map);
	
}
