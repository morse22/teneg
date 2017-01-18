<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
   rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/bootstrap.css"
   rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/half-slider.css"
   rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/sb-admin.css"
   rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/plugins/morris.css"
   rel="stylesheet" type="text/css" />
<link
   href="${pageContext.request.contextPath }/css/font-awesome.min.css"
   rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<script
   src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
   var start = 0;
   var last = 0;

   function changeEgg(data) {

         last = start + data;
         start = last;
         $("#eggCount").html(last);
         $("#moneyCount").html(last * 80);

   }

   function resetEgg() {
      last = 0;
      start = 0;
      $("#eggCount").html(0);
      $("#moenyCount").html(0);

   }
   
   function myEgg(){
      var id = "${loginUser.id}";
      var password = "${loginUser.password}";
      var amount = $("#moneyCount").text();
      var exchangeEgg = $("#eggCount").text();
      $.ajax({
         type : "post",
         url : "${ pageContext.request.contextPath }/egg/exchange.do",
         data : {
            "id" : id,
            "password" : password,
            "amount" : amount,
            "exchangeEgg" : exchangeEgg
         },
         success : function() {
        	
            window.close();
            alert("환전 완료했습니다.");
            //             opener.location="${ pageContext.request.contextPath }/egg/exchangeList.do/"+ ${loginUser.id} ;
            opener.location.reload();

         },
      });

   }
   function doAuction() {
      var ck1 = document.getElementsByName("join_priv_agree");
      var id = "${loginUser.id}";
      var password = "${loginUser.password}";
      var amount = $("#moneyCount").text();
      var exchangeEgg = $("#eggCount").text();

      if (ck1[0].checked == false) {
         alert("환불 약관에 동의하세요.");
         return;
      }
      $.ajax({
         type : "get",
         url : "${ pageContext.request.contextPath }/egg/myEgg.do/${loginUser.id}",
         success : function(egg) {
            if (parseInt(exchangeEgg) <= parseInt(egg)) {
               myEgg();
               
            }else{
               alert("보유한 egg를 초과하였습니다.")
            }

         },
      });

      
   }

   function checkAgree() {
      var ck1 = document.getElementsByName("join_priv_agree");

      if (ck1[0].checked) {
         $("#exchangeBtn").addClass("btn-success");
      } else {
         $("#exchangeBtn").removeClass("btn-success");
      }
   }
</script>
<style type="text/css">
body {
   margin-top: 0px;
}
</style>
</head>
<body>

   <div style="margin-bottom: 15px;">
      <div class="row">
         <label class="col-sm-1"></label>
         <div>
            <div class="panel panel-default">
               <div class="panel-heading">&nbsp;&nbsp;Pay Provision</div>
               <!-- panel heading -->

               <div class="panel-body">
                  <div class="form-group pull-left">
                     <label class="control-label"> &nbsp; 개인정보 처리방침 안내 </label>
                     <div class="col-xs-12">
                        <textarea class="form-control" readonly rows="10" cols="68">개인정보수집

■ 수집하는 개인정보 항목

회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.


ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 ,  서비스 이용기록 , 접속 로그 , 쿠키 , 접속 IP 정보
ο 개인정보 수집방법 : 홈페이지(회원가입,게시판) 

■ 개인정보의 수집 및 이용목적

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다..

 ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송
 ο 회원 관리
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 가입 의사 확인 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달
 ο 마케팅 및 광고에 활용
접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계

■ 개인정보의 보유 및 이용기간

회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.
</textarea>
                     </div>
                     <div class="col-xs-12">
                        <div class="checkbox pull-right">
                           <label for="join_priv_agree"> <input type="checkbox"
                              name="join_priv_agree" id="join_priv_agree" value="1"
                              onchange="checkAgree()" /> 환불 약관에 동의합니다.
                           </label>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- panel body -->
            </div>

            <div style="margin-left: 20px;">
               <button type="button" onclick="changeEgg(1)" value="1" class="btn"
                  style="margin-left: 10px;">1 egg</button>
               <button type="button" onclick="changeEgg(5)" value="5" class="btn">5
                  egg</button>
               <button type="button" onclick="changeEgg(10)" value="10"
                  class="btn">10 egg</button>
               <img src="${ pageContext.request.contextPath }/img/egg2.png"
                  style="width: 27px; height: 30px; float: right; margin-right: 50px;">
               <span id="eggCount" name="exchangeEgg"
                  style="float: right; margin-top: 4px; margin-right: 5px;">0
               </span> <br />
               <button type="button" onclick="changeEgg(50)" value="50"
                  class="btn"
                  style="margin-left: 10px; margin-top: 5px; padding: 6px 8px 6px 8px;">50
                  egg</button>
               <button type="button" onclick="changeEgg(100)" value="100"
                  class="btn" style="margin-top: 5px; padding: 6px 4px 6px 4px;">100
                  egg</button>
               <button type="button" onclick="changeEgg(1000)" value="1000"
                  class="btn" style="margin-top: 5px; padding: 6px 4px 6px 4px;">1000
                  egg</button>
               <span style="float: right; margin-right: 55px; margin-top: 10px;"><b>원</b></span>
               <span id="moneyCount"
                  style="margin-top: 10px; margin-right: 13px; float: right;">0
               </span>

            </div>
            <input type="button" onclick="resetEgg()" class="btn" value="초기화"
               style="width: 70px; margin: 20px 0 0 150px; float: left;">
            <input type="button" class="btn" value="환전하기" id="exchangeBtn"
               onclick="doAuction()" style="width: 140px; margin: 20px 0 0 20px;">
         </div>
      </div>
   </div>
</body>
</html>