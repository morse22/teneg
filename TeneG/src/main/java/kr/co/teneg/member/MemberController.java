package kr.co.teneg.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.teneg.dbVO.MemberPageVO;
import kr.co.teneg.dbVO.MyInfoVO;
import kr.co.teneg.dbVO.RequestListVO;
import kr.co.teneg.eggCharge.EggChargeService;
import kr.co.teneg.eggCharge.EggChargeVO;
import kr.co.teneg.eggExchange.EggExchangeService;
import kr.co.teneg.eggExchange.EggExchangeVO;
import kr.co.teneg.request.RequestService;
import kr.co.teneg.request.RequestVO;
import kr.co.teneg.response.ResponseService;

/*
 * @ModelAttribute MemberVO member   : request.getParameter() 를 한꺼번에 다 해줌.
 * @ModelAttribute("member") MemberVO member   : 
 *       모델의 이름은 기본적으로 파라미터 타입의 이름을 따른다.
 *       MemberVO클래스라면 memberVO라는 이름의 모델로 등록이 된다.
 *       다른 이름을 사용하고 싶은 경우에는 ("") 에 모델 이름을 지정해 줄 수도 있다.
 *       해당 Key에 MemberVO 오브젝트가 저장.
 */
// 모델 어트리뷰트에 " "란 이름이 나왔을때, 리퀘스트영역에 올리지말고 세션에 올리라는 의미
@SessionAttributes("loginUser") // " "를 종속되는곳들에서 공유하고 form을 사용하기 위함.
@Controller
@RequestMapping(value = "/member")
public class MemberController {
   @Autowired
   private MemberService service;

   @Autowired
   private RequestService reqService;

   @Autowired
   private ResponseService responseService;
   
   @Autowired
   private EggChargeService chService;

   @Autowired
   private EggExchangeService exService;
   
   @Autowired
   private ServletContext servletContext;

   @RequestMapping("/singinAgree.do")
   public String agree() {
      return "member/signinAgree";
   }

   // 회원가입폼
   @RequestMapping(value = "/signUpForm.do")
   public String signUpForm() {
      return "member/signUpForm";
   }

   // 회원가입
   @RequestMapping(value = "/signUp.do", method = RequestMethod.POST)
   public String signUp(@ModelAttribute("member") MemberVO member, MultipartHttpServletRequest mRequest)
         throws IllegalStateException, IOException {
      String filename = "";
      if (!member.getFile1().isEmpty()) {
         filename = System.currentTimeMillis() + "_" + member.getFile1().getOriginalFilename();
         String uploadDir = servletContext.getRealPath("/expertFile/");
         try {
            new File(uploadDir).mkdir();
            member.getFile1().transferTo(new File(uploadDir + filename));
         } catch (Exception e) {
            e.printStackTrace();
         }
      } else if (member.getFile1().isEmpty()) {
         filename = "파일없음";
      }
      member.setSaveFileName(filename);
      service.signUp(member);
      return "member/signUp";
   }

   // 로그인 Get방식
   @RequestMapping(value = "/login.do")
   public String loginForm() {
      return "member/login";
   }

   // 로그인 Post방식
   @RequestMapping(value = "/login.do", method = RequestMethod.POST)
   // MemberVO를 어떤 이름으로 등록을 할 것인가? // @ModelAttribute("member") MemberVO member
   public String login(@ModelAttribute("member") MemberVO member, Model model, HttpSession session) {
      MemberVO memberVO = service.login(member);
      if (memberVO != null) {
         model.addAttribute("loginUser", memberVO);
         session.setAttribute("id", memberVO.getId());
         return "redirect:/";
      } else {
         model.addAttribute("msg", "로그인을 실패하였습니다.");
      }
      return "member/login";
   }

   // 로그아웃
   @RequestMapping("/logout.do")
   public String logout(SessionStatus sessionStatus, HttpServletRequest request) {
      HttpSession session = request.getSession();
      session.invalidate();
      sessionStatus.setComplete();
      return "redirect:/";
   }

   // 마이페이지폼으로 이동
   @RequestMapping(value = "/myPageForm.do")
   public String myPageForm(@ModelAttribute("member") MemberVO member, Model model) {
      model.addAttribute("loginUser", service.myPage(member));
      return "member/myPageForm";
   }

   // 마이페이지 수정하기
   @RequestMapping(value = "/myPage.do", method = RequestMethod.POST)
   public String myPage(@ModelAttribute("loginUser") MemberVO member, Model model) {
      System.out.println(member);
      service.myPageUpdate(member);
      return "member/myPage";
   }

   // 회원 관리창 보기
   @RequestMapping("/memberList.do")
   public ModelAndView memberList(@RequestParam("pc") String pc // pc 11
         , @RequestParam("page") String page // page 1
         , @RequestParam(value = "sort", defaultValue = "egg") String sort,
         @RequestParam(value = "period", defaultValue = "all") String period,
         @RequestParam(value = "searchType", defaultValue = "id") String searchType,
         @RequestParam(value = "searchText", defaultValue = "") String searchText) {

      double pageSize = Double.parseDouble(pc); // 11
      int currentPage = Integer.parseInt(page); // 1
      int totalCount = service.getTotalCount(); // 전체 회원 수 카운트
      int newMemberCount = service.newMemberCount(); // 오늘 가입한 회원 수
      ModelAndView mav = new ModelAndView();

      // currentPage가 몇이 넘어오느냐에 따라
      int start, end; // 한 페이지에 게시물 ( start ~ end )
      start = (int) (1 + (pageSize * (currentPage - 1))); // start= 1 , 12 ...
      end = (int) (pageSize * currentPage); // end = 11, 22 ...
      if (end > totalCount)
         end = totalCount;

      if (!searchType.equals("egg"))
         searchText = "%" + searchText + "%";

      List<MemberVO> list = service.list(new MemberPageVO(start, end, sort, searchType, period, searchText));

      mav.addObject("cpage", currentPage);
      mav.addObject("pCount", (int) pageSize);
      mav.addObject("pageSize", Math.ceil(totalCount / pageSize)); // ceil 올림
      mav.addObject("list", list);
      mav.addObject("totalCount", totalCount);
      mav.addObject("newMemberCount", newMemberCount);
      mav.addObject("sort", sort);
      mav.addObject("searchType", searchType);
      mav.addObject("period", period);
      mav.setViewName("member/memberList");

      return mav;
   }

   // 선택 회원 삭제
   @RequestMapping("/deleteList.do")
   public String deleteList(@RequestParam("query") String query) {
      List<String> list = new ArrayList<String>();
      String[] datas = query.split(",");
      for (int i = 0; i < datas.length; i++) {
         list.add(datas[i]);
      }
      service.deleteList(list);
      return "redirect:/member/memberList.do?pc=11&page=1";
   }

   // 회원의 상세정보 보기
   @RequestMapping(value = "/memberDetail.do")
   public String memberDetail(@ModelAttribute("member") MemberVO member, Model model) {
      model.addAttribute("loginUser", service.memberDetail(member));
      return "member/memberDetail";
   }

   // 관리자의 회원 추방시키기
   @RequestMapping("/memberDelete.do")
   public String memberDelete(@ModelAttribute("member") MemberVO member) {
      service.memberDelete(member);
      return "member/memberDelete";
   }

   // 회원 탈퇴하기
   @RequestMapping("/memberWithdraw.do")
   public String memberWithdraw(@ModelAttribute("member") MemberVO member) {
      service.memberDelete(member);
      return "member/memberWithdraw";
   }

   @ResponseBody
   @RequestMapping(value = "/checkId.do")
   public String checkId(@RequestParam String id) {
      return service.checkId(id);
   }

   @ResponseBody
   @RequestMapping(value = "/checkPhone.do")
   public String checkPhone(@RequestParam String phone) {
      return service.checkPhone(phone);
   }

   @ResponseBody
   @RequestMapping(value = "/checkEmail.do")
   public String checkEmail(@RequestParam String email) {
      return service.checkEmail(email);
   }

   @ResponseBody
   @RequestMapping(value = "/findId.do")
   public String findId(MemberVO memberVO) {
      return service.findId(memberVO);
   }

   @ResponseBody
   @RequestMapping(value = "/findPw.do")
   public String findPw(MemberVO memberVO) {
      return service.findPw(memberVO);
   }

   @ResponseBody
   @RequestMapping("/changePw.do")
   public String changePw(MemberVO memberVO) {
      service.changePw(memberVO);
      return "success";
   }

   @ResponseBody
   @RequestMapping("/checkLogin.do")
   public String checkLogin(MemberVO memberVO) {
      return service.checkLogin(memberVO);
   }

   @ResponseBody
   @RequestMapping(value = "/login_index.do", method = RequestMethod.POST)
   public String login_index(MemberVO member, Model model, HttpSession session) {
      MemberVO memberVO = service.login(member);
      if (memberVO == null) {
         return "false";
      }
      model.addAttribute("loginUser", memberVO);
      session.setAttribute("id", memberVO.getId());
      return "id";
   }

   // 승인
   @RequestMapping("/myInfo.do")
   public ModelAndView myInfo(@RequestParam("id") String id, @RequestParam("maintype") String maintype, @RequestParam(value="type",defaultValue="myDlist") String type) {
      List<RequestVO> list3 = null;
      List<RequestListVO> list4 = null;
      MyInfoVO myInfoVO = service.info(id);
      ModelAndView mav = new ModelAndView();
      mav.addObject("myInfoVO", myInfoVO);
      mav.addObject("typeCount",reqService.getTypeCount(id));
      
      
      switch(maintype){
      case "menu1":
         switch(type){
         case "myDList" :
            list3 = reqService.selectD(id);
            mav.addObject("list",list3);
            break;
         case "myPList" :
            list4 = reqService.selectP(id);
            mav.addObject("list",list4);
            break;
         case "myCList" :
            list4 = reqService.selectC(id);
            mav.addObject("list",list4);
            break;
        
         }
         break;
         
      case "menu2":
         List<EggChargeVO> list = chService.chargeList(id);
         for(int i = 0; i < list.size() ; i ++){
            list.get(i).setChargeEgg(list.get(i).getAmount()/100);
         }
         mav.addObject("chargeList", list);
         break;
         
      case "menu3":
         List<EggExchangeVO> list2 = exService.exchangeList(id);
         for(int i = 0; i < list2.size() ; i ++){
            list2.get(i).setExchangeEgg(list2.get(i).getAmount()/80);
         }
         mav.addObject("exchangeList", list2);
         break;
      
      }
      
      // 전문가이면
      if (myInfoVO.getExpertId() != null) {
         
         switch (maintype) {      
            
         case "menu4":
            // 진행중인의뢰
            mav.addObject("response",responseService.list(id));            
            break;            
         }
      } else {
         // 전문가가아니면
      }

      mav.setViewName("member/info");
      return mav;
   }

}