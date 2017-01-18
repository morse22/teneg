<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요청리스트</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 

<style>
.tooltip2 {
   position: relative;
   display: inline-block;
   border-bottom: 1px dotted black;
}

.tooltip2 .tooltiptext {
   visibility: hidden;
   width: 120px;
   background-color: black;
   color: #fff;
   text-align: center;
   border-radius: 6px;
   padding: 5px 0;
   /* Position the tooltip */
   position: absolute;
   z-index: 1;
}

.tooltip2:hover .tooltiptext {
   visibility: visible;
}
</style>
<script>
   $(document).ready(function() {
      $("#menu1").removeClass("active");
      $("#menu2").removeClass("active");
      $("#menu3").removeClass("active");
      $("#menu4").removeClass("active");
      $("#menu5").removeClass("active");
      $("#Dlist").removeClass("active");
      $("#Plist").removeClass("active");
      $("#Clist").removeClass("active");
      
      
      switch ("${param.maintype}") {
      case "menu1":
         $("#menu1").addClass("active");
         
         switch("${param.type}"){
         case "myPList" :
            $("#Plist").addClass("active");
            break;
         case "myDList" :
            $("#Dlist").addClass("active");
            break;
         case "myCList" :
            $("#Clist").addClass("active");
            break;
            
            
         }
         break;
      case "menu2":
         $("#menu2").addClass("active");
         break;
      case "menu3":
         $("#menu3").addClass("active");
         break;
      case "menu4":
         $("#menu4").addClass("active");
         break;
      case "menu5":
         $("#menu5").addClass("active");
         break;

      }      
      
   });
   
   function writeReview(no, expertId, id){
       var popUrl = "${ pageContext.request.contextPath }/review/write.do/" + no + "/" + expertId +"/" + id;
      var popOption = "width=480, height=480, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
      
      window.open(popUrl, "", popOption);
   }
   
   function refund(id, requestNo, expertId){
       var popUrl = "${ pageContext.request.contextPath }/refund/write.do/" + id + "/" + requestNo + "/" + expertId;
      var popOption = "width=480, height=480, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
      
      window.open(popUrl, "", popOption);
   }
   
</script>
<script>
   function onClickComplete(requestNo){
       var popUrl = "${pageContext.request.contextPath}/popup/doDComplete.do?requestNo=" + requestNo;
      var popOption = "width=470, height=190, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
      window.open(popUrl, "", popOption);
   }
   
   function updateProgress(requestNo){
       var popUrl = "${pageContext.request.contextPath}/popup/updateProgress.do?requestNo=" + requestNo;
      var popOption = "width=470, height=200, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
      window.open(popUrl, "", popOption);
   }
</script>   
<body>
   <header>
      <div align="center">
         <div style="width: 85%; margin-top: 1%;">
            <jsp:include page="/include/header.jsp" />
         </div>
      </div>
   </header>
   <!--  -->

   <!--  -->

   <div class="container" style="margin-top: 100px;width:1500px">
      <div id="section1" class="container-fluid">
         <div class="col-md-12 col-sm-6 hero-feature">
            <div class="thumbnail" style="height: 600px; ">
               <div class=" col-sm-6 hero-feature">


                  <!--추가  -->
                  <div class="container">
                     <div class="row">
                        <div class="col-xs-12">
                           <div>
                              <b>마이페이지</b>
                           </div>
                        </div>
                     </div>

                     <div class="row mar_30">
                        <div class="col-xs-3">
                           <div class="thumbnail">
                              <div>
                                 <div align="center">
                                    <img style="height: 100px; width: 100px; margin: 15px;"
                                       align="left"
                                       src="${ pageContext.request.contextPath }/img/test3.png" />

                                    <span> <c:out value="${ myInfoVO.name }" /> 님 <br />
                                       등급 : <c:out value="${ myInfoVO.memberGrade }" /><br />
                                       Egg : <c:out value="${ myInfoVO.egg }" /><br />
                                    </span>

                                 </div>


                                 <div id="satisfaction" style="margin-top: 70px;">
                                    <div class="tooltip2">
                                       만족도 <span class="tooltiptext">
                                          <div>
                                             <div>
                                                <div>전체 &nbsp;&nbsp;&nbsp;&nbsp;0</div>
                                             </div>

                                             <div>
                                                <div>긍정 &nbsp;&nbsp;&nbsp;&nbsp;0</div>
                                             </div>

                                             <div>
                                                <div>부정 &nbsp;&nbsp;&nbsp;&nbsp;0</div>
                                             </div>
                                          </div>
                                       </span>
                                    </div>



                                 </div>


                                 <span> 평균응답시간 </span> <b> 1시간</b>


                              </div>

                              <div class="tooltip2" data-toggle="tooltip2"
                                 title="지난 30일 기반,<br/>첫 문의에 24 시간 내로 응답한 비율"
                                 data-placement="right">

                                 <div class="dash_left_bottom_title">응답률</div>
                                 <div class="dash_left_bottom_per">
                                    <b>100%</b>
                                 </div>


                              </div>

                              <div class="position_r dash_left_bottom mar_15"
                                 data-toggle="tooltip" title="전체 주문 건 대비<br/>취소 없이 완료된 건의 비율"
                                 data-placement="right">

                                 <div class="dash_left_bottom_title">주문 성공률</div>
                                 <div class="dash_left_bottom_per">
                                    <b>100%</b>
                                 </div>


                              </div>

                              <div class="position_r dash_left_bottom mar_15"
                                 data-toggle="tooltip"
                                 title="지난 60일 기반,</br>완료 건 대비 작업물 발송 예정일에</br>맞춰 작업을 완료한 비율"
                                 data-placement="right">

                                 <div class="dash_left_bottom_title">작업일 준수율</div>
                                 <div class="dash_left_bottom_per">
                                    <b>100%</b>
                                 </div>


                              </div>
                           </div>

                           <!-- request패널 -->
                           <div class="panel"
                              style="padding: 15px; margin-top: 10px !important; background: #eee; border: 1px solid #dfdfdf;">
                              <div class="panel-body">

                                 <div class="text_c mar_10">
                                    <h5 style="line-height: 1.4em;">도와주세요를 요청하면 정승훈 전문가님이
                                       해결해 드립니다.</h5>
                                 </div>
                                 <div class="mar_20">
                                    <a style="width: 100%;" class="btn btn-primary btn-ad"
                                       href="${ pageContext.request.contextPath }/request/write.do">도와주세요
                                       요청</a>
                                 </div>
                              </div>
                           </div>
                        </div>



                        <div class="col-xs-8">
                           <!-- 상단 -->
                           <div style="width: 1050px;">

                              <!-- 중단 리스트 -->
                              <!-- tap  -->
                              <div class="col-md-12 col-sm-6 hero-feature">
                                 <div class="thumbnail" >
                                    <!-- tap  -->
                                    <div role="tabpanel"  >

                                       <!-- Nav tabs -->
                                       <ul class="nav nav-tabs" role="tablist">
                                       
                                       <!-- 전문가 여부와 상관없이 들어가는 메뉴 -->
                                       <li role="presentation" class="active" id="menu1"><a
                                                href="${ pageContext.request.contextPath}/member/myInfo.do?id=${loginUser.id}&maintype=menu1&type=myDList"
                                                >요청관리&nbsp;
                                                   
                                             </a></li>
                                       <li role="presentation" id="menu2"><a
                                                href="${ pageContext.request.contextPath}/member/myInfo.do?id=${loginUser.id}&maintype=menu2"
                                                >egg
                                                   충전 리스트&nbsp; </a></li>
                                       <li role="presentation" id="menu3"><a
                                                href="${ pageContext.request.contextPath}/member/myInfo.do?id=${loginUser.id}&maintype=menu3"
                                                >egg
                                                   환전 리스트&nbsp; </a></li>
                                             
                                          <c:if test="${ not empty myInfoVO.expertId }">
                                             <!--전문가이면 보이는 메뉴 -->
                                             
                                             <li role="presentation" class="active" id="menu4"><a
                                                href="${ pageContext.request.contextPath}/member/myInfo.do?id=${loginUser.id}&maintype=menu4"
                                                >진행중인의뢰&nbsp;
                                                   
                                             </a></li>
                                             
                                          </c:if>

                                          <c:if test="${empty myInfoVO.expertId }">
                                             <!--일반회원이면 보이는 메뉴(동규형이 해둔 일반요청메뉴넣기) -->
                                             <li role="presentation" class="active" id="menu5"><a
                                                href="${ pageContext.request.contextPath}/member/myInfo.do?id=${loginUser.id}&maintype=menu5"
                                                >일반회원 메뉴 넣기&nbsp; <span class="buy_useralram_none">0 건</span>
                                             </a></li>

                                          </c:if>


                                       </ul>
                                    </div>
                                 </div>
                              </div>

                              <div id="section1" class="container-fluid">
                                 <div class="col-md-12 col-sm-6 hero-feature">
                                    <div class="thumbnail">

                                       <div class="caption" align="center">

                                          <div class="tab-content" style="height: 350px;">
                                             <c:choose>
                                                <c:when test="${ param.maintype eq 'menu1' }">      
                                          <!-- 메뉴1 -->      
      <div class="mar_30">
         <div role="tabpanel">
            <!-- 중단 리스트 -->
               <!-- tap  -->
               <div class="col-md-12 col-sm-6 hero-feature">
                  <div class="thumbnail">

                  <!-- tap  -->
                     <div role="tabpanel">

                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                           <li role="presentation" class="active" id="Dlist"><a href="${pageContext.request.contextPath }/member/myInfo.do?id=${loginUser.id}&maintype=menu1&type=myDList"
                              >대기중(전문가 매칭 전)&nbsp; <span class="buy_useralram_none">${ typeCount.dCount }건</span></a>
                           </li>
                           <li role="presentation" id="Plist"><a href="${pageContext.request.contextPath }/member/myInfo.do?id=${loginUser.id}&maintype=menu1&type=myPList">진행중&nbsp;
                              <span class="buy_useralram_none">${ typeCount.pCount }건</span></a>
                           </li>
                           <li role="presentation" id="Clist"><a href="${pageContext.request.contextPath }/member/myInfo.do?id=${loginUser.id}&maintype=menu1&type=myCList">
                                 처리완료&nbsp; <span class="buy_useralram_none">${ typeCount.cCount }건</span>
                           </a></li>
                          
                           <li>
                              <div class="position_r">
                                 <div class="buy_period">
                                    <form method="GET" action="#">
                                       <select
                                          class="form-control" onchange="this.form.submit();"
                                          name="request_date"><option value="60">요구기간</option>
                                          <option value="1">1개월</option>
                                          <option value="3">3개월</option>
                                          <option value="6">6개월</option>
                                          <option value="12">12개월</option></select>
                                    </form>
                                 </div>
                              </div>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>

               <div id="section1" class="container-fluid">
                  <div class="col-md-12 col-sm-6 hero-feature">
                        <div class="caption" align="center">
                           <div class="tab-content">
                              <div role="tabpanel" class="tab-pane active" id="home">
                                 <c:if test="${ empty list }">
                                    <img src="${ pageContext.request.contextPath }/img/물음표.PNG" class="img1" />
                                    <c:choose>
                                       <c:when test="${ param.type eq 'myDList' }">
                                          매칭 대기중인 의뢰 내역이 없습니다.
                                       </c:when>
                                       <c:when test="${ param.type eq 'myPList' }">
                                          진행중인 의뢰 내역이 없습니다.
                                       </c:when>
                                       <c:when test="${ param.type eq 'myCList' }">
                                          완료 된 의뢰 내역이 없습니다.
                                       </c:when>
                                       <c:when test="${ param.type eq 'myMList' }">
                                          기간만료 된 의뢰 내역이 없습니다.
                                       </c:when>
                                    </c:choose>
                                 </c:if>
                                 <c:if test="${ not empty list and param.type eq 'myPList'}">
                                    <div align="left">
                                       <span style="color:red; font-size: 8pt; font-weight: bold;">*후기작성을 하셔야 모든 거래가 완료됩니다.</span><br/>
                                       <span style="color:red; font-size: 8pt; font-weight: bold;"> 완료대기 상태인 의뢰의 최종첨부 파일을 확인하고 전문가에대한 후기(평점)을 작성해 주세요</span><br/>                                    
                                    </div>
                                 </c:if>
                                 <c:if test="${ not empty list and param.type eq 'myDList'}">
                                    <div align="left">
                                       <span style="color:red; font-size: 8pt; font-weight: bold;">*전문가 보기 버튼을 클릭 후 원하시는 전문가에게 의뢰수락을 해주시면 요청하신 의뢰에 대한 처리가 시작됩니다.</span><br/>                              
                                    </div>
                                 </c:if>
                                 <c:if test="${ not empty list }">
                                    <table class="table" border="1">
                                    <tr>
                                       <th style="width:5%; text-align: center;">No</th>   
                                       <th style="width:20%; text-align: center;">제목</th>
                                       <th style="width:4%; text-align: center;">타입</th>
                                       <th style="width:8%; text-align: center;">등록일</th>
                                       <th style="width:8%; text-align: center;">진행상태</th>
                                       <th style="width:5%; text-align: center;">진행률</th>
                                       <c:if test="${ param.type eq 'myCList' }">
                                          <th style="width:8%; text-align: center;">담당자</th>
                                          <th style="width:8%; text-align: center;">결과물</th>
                                       </c:if>
                                       <c:if test="${ param.type eq 'myPList' }">
                                          <th style="width:8%; text-align: center;">담당자</th>
                                          <th style="width:8%; text-align: center;">결과물</th>
                                          <th style="width:8%; text-align: center;">환불</th>
                                       </c:if>
                                       <c:if test="${ param.type eq 'myDList' }">
                                          <th style="width:8%; text-align: center;">전문가보기</th>
                                       </c:if>
                                       
                                    </tr>
                                    <c:forEach var="request" items="${ list }">
                                       <tr>
                                          <td style=" text-align: center;">${ request.no }</td>
                                          <td style=" text-align: center;">${ request.title }</td>
                                          <td style=" text-align: center;">${ request.field }</td>
                                          <td style=" text-align: center;">${ request.regDate }</td>
                                          
                                          <c:choose>
                                             <c:when test="${ request.status eq 'D' }">
                                                <td style=" text-align: center; color:green; font-weight: bold">대기중</td>
                                                <td style=" text-align: center; color:green; font-weight: bold">시작전</td>
                                             </c:when>
                                             <c:when test="${ request.status eq 'P' }">
                                                <td style=" text-align: center; color:red; font-weight: bold">진행중</td>
                                                <td style=" text-align: center; color:red; font-weight: bold">${ request.progress }%</td>      
                                             </c:when>
                                             <c:when test="${ request.status eq 'DC' }">
                                                <td style=" text-align: center; color:blue; font-weight: bold">완료대기</td>
                                                <td style=" text-align: center; color:blue; font-weight: bold">${ request.progress }%</td>
                                             </c:when>
                                             <c:when test="${ request.status eq 'RP' }">
                                                <td style=" text-align: center; color:rgb(255, 200, 14); font-weight: bold">환불진행</td>
                                                <td style=" text-align: center; color:blue; font-weight: bold">${ request.progress }%</td>
                                             </c:when>
                                             <c:when test="${ request.status eq 'RC' }">
                                                <td style=" text-align: center; color:blue; font-weight: bold">환불완료</td>
                                                <td style=" text-align: center; color:red; font-weight: bold">none</td>
                                             </c:when>
                                             <c:when test="${ request.status eq 'C' }">
                                                <td style=" text-align: center; color:blue; font-weight: bold">처리완료</td>
                                                <td style=" text-align: center; color:blue; font-weight: bold">${ request.progress }%</td>
                                             </c:when>
                                          </c:choose>
                                          <td style="text-align: center;">
                                             <c:if test="${ request.status eq 'DC' }">
                                             <button onclick="javascript:writeReview('${request.no}', '${request.expertId}', '${ loginUser.id }');">후기작성</button>
                                             </c:if>
                                             <c:if test="${ request.status eq 'D' }">
                                             <button onclick="location='${ pageContext.request.contextPath }/requestwaiting/listByNo.do?no=${ request.no }'">보기</button>
                                             </c:if>
                                             <c:if test="${ request.status eq 'C' or request.status eq 'P' or request.status eq 'RP' or request.status eq 'RC'}">
                                             <a href="${ pageContext.request.contextPath }/expert/detail.do/${ request.expertId }">${ request.expertId }</a>
                                             </c:if>
                                          </td>
                                          <c:choose>
                                             <c:when test="${ request.status eq 'P'}">
                                                <td style=" text-align: center; color:red; font-weight: bold">미첨부</td>
                                             </c:when>
                                             <c:when test="${ request.status eq 'RP'}">
                                                <td style=" text-align: center; color:rgb(255, 200, 14); font-weight: bold">환불진행</td>
                                             </c:when>
                                             <c:when test="${ request.status eq 'RC'}">
                                                <td style=" text-align: center; color:red; font-weight: bold">none</td>
                                             </c:when>
                                             <c:when test="${ request.status eq 'DC' or request.status eq 'C' }">
                                                <td style=" text-align: center; color:blue; font-weight: bold">
                                                   <a href="${ pageContext.request.contextPath }/finalFile/${request.saveFileName}" download>다운로드</a>
                                                </td>
                                             </c:when>
                                          </c:choose>
                                          <c:if test="${ param.type eq 'myPList' and request.status ne 'RP'}" >
                                             <td style="text-align: center;"><button onclick="refund('${loginUser.id}','${request.no}',' ${ request.expertId }')">신청</button></td>
                                          </c:if>
                                          <c:if test="${ request.status eq 'RP'}" >
                                             <td style=" text-align: center; color:rgb(255, 200, 14); font-weight: bold">환불진행</td>
                                          </c:if>
                                       </tr>   
                                    </c:forEach>
                                    </table>
                                 </c:if>
                              </div>
                           </div>                        
                        </div>
                  
                  </div>
               </div>
            </div>
         </div>
                                          
                                          
                                          
                                          
                                          
                                          
                                          <!--  -->
                                       </c:when>
                                                <c:when test="${ param.maintype eq 'menu2' }">
                                                <!-- 충전리스트 출력 -->
   <div class="chargeList">
         <table width="100%" border="1">
            <tr >
               <th width="35%" style="text-align: center; font-size: 17px;">날 짜</th>
               <th width="22%" style="text-align: center;font-size: 17px;">충 전 금 액</th>
               <th width="20%" style="text-align: center;font-size: 17px;">충 전 된 &nbsp; E g g</th>
               <th width="23%" style="text-align: center;font-size: 17px;">결 제 수 단</th>
            </tr>
            <c:forEach var="charge" items="${ chargeList }" varStatus="loop">
               <tr>
                  <td style="text-align: center">${ charge.chargeDate}</td>
                  <td class="rightAlign">${ charge.amount}</td>
                  <td class="rightAlign">${ charge.chargeEgg}</td>
                  <td class="rightAlign">${ charge.paymentOption}</td>
               </tr>
            </c:forEach>
         </table>
      </div>
                                                
                                                
                                                <!--  -->
                                       </c:when>
                                                <c:when test="${ param.maintype eq 'menu3' }">
<!--  환전리스트 출력 -->
<div class="exchangeList">
         <table width="100%" border="1">
            <tr >
               <th width="40%" style="text-align: center; font-size: 17px;">날 짜</th>
               <th width="30%" style="text-align: center">환 전 금 액</th>
               <th width="30%" style="text-align: center">환 전 된 &nbsp; E g g</th>
            </tr>
            <c:forEach var="exchange" items="${ exchangeList }" varStatus="loop">
               <tr>
                  <td style="text-align: center">${ exchange.exchangeDate}</td>
                  <td class="rightAlign">${ exchange.amount}</td>
                  <td class="rightAlign">${ exchange.exchangeEgg}</td>
               </tr>
            </c:forEach>
         </table>
      </div>
   <div>   
      <span id="total">총환전액:
            <c:set var="total" value="0"></c:set>
            <c:forEach var="exchange" items="${ exchangeList }" varStatus="loop">
               
               <c:set var="total" value="${total+exchange.amount }"/>
            </c:forEach>
                     <c:out value="${total}"/> 원
                     
      </span>
   </div>
                                       </c:when>
                                       <c:when test="${ param.maintype eq 'menu4' }">
                                       
                                       
                                       
                                       <!-- 메뉴4 -->
                                       
      <div style="width:100%;">
      <div align="left">
         <span style="color:red; font-size:8pt; font-weight:bold;">*상태가 'U'일 때 완료 버튼을 누른 후 최종파일을 점부하게 되면 완료상태 'S'로 전환됩니다.</span>
      </div><br/>
      <table class="table" id="listTable" border="1">
         <tr>
            <th width="7%" style="text-align: center; color:black;">요청번호</th>
            <th width="10%" style="text-align: center; color:black; ">담당전문가</th>
            <th width="8%" style="text-align: center; color:black; ">상태</th>
            <th width="8%" style="text-align: center; color:black; ">등록일</th>
            <th width="8%" style="text-align: center; color:black; ">진행률</th>
            <th width="8%" style="text-align: center; color:black; ">완료일</th>
         </tr>            
         <!-- 일반게시물 출력 -->
         <c:forEach var="response" items="${ response }" varStatus="cnum">
            <tr>                     
               <td style="text-align: center;">
                  <a href="${ pageContext.request.contextPath }/request/detail.do?no=${response.requestNo}&id=${loginUser.id}">
                     <c:out value="${ response.requestNo }"/>
                  </a>
               </td>
               <td style="text-align: center;"><c:out value="${ response.expertId}"/></td>
               <td style="text-align: center;">
                  <c:if test="${ response.status eq 'U'}">
                     <span style="color:red; font-weight: bold;">
                        <c:out value="${ response.status}"/>
                     </span>   
                     <button onclick="onClickComplete(${response.requestNo})">완료</button>
                  </c:if>
                  <c:if test="${ response.status eq 'S'}">
                     <span style="color:blue; font-weight: bold;">
                        <c:out value="${ response.status}"/>
                     </span>   
                  </c:if>
               </td>
               <td style="text-align: center;"><c:out value="${ response.regDate}"/></td>                  
               <td style="text-align: center;">
                  <c:if test="${ response.status eq 'U'}">
                     <span style="color:red; font-weight: bold;">
                        <c:out value="${ response.progress }%"/>
                     </span><button onclick="updateProgress(${response.requestNo})">수정</button>
                  </c:if>
                  <c:if test="${ response.status eq 'S'}">
                     <span style="color:blue; font-weight: bold;">
                        <c:out value="${ response.progress }%"/>
                     </span>
                  </c:if>
               </td>
               <td style="text-align: center;">
                  <c:if test="${ response.status eq 'S'}">
                     ${ response.completeDate }
                  </c:if>
                  <c:if test="${ response.status eq 'U'}">
                     <span style="color:red; font-weight: bold;">미완료</span>
                  </c:if>
               </td>                  
            </tr>
         </c:forEach>   
      </table>
      </div>
                                       
                                       
                                       
                                       
                                       
                                       
                                       <!--  -->
                                       </c:when>
                                             </c:choose>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>

                           </div>

                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!--전문가이면-->
   <%-- 
                   <c:if test="${ not empty myInfoVO.getExpertField()}">${myInfoVO.getExpertField()} 전문가 ${myInfoVO.getExpertId()} 님</c:if>
                     <!--전문가가아니면 -->
                  <c:if test="${empty myInfoVO.getExpertField()}"> ${myInfoVO.getExpertId()} 회원님</c:if>
               
               


   <div style="width: 70%; height: 800px;">
      ------------------------------------------------ --> 걍테이블
      <table class="table" id="listTable">
         <tr>
            <th width="10%" style="text-align: center;">아이디</th>
            <th width="10%" style="text-align: center;">이름</th>
            <th width="20%" style="text-align: center;">가입일</th>
            <th width="7%" style="text-align: center;">폰번호</th>
            <th width="10%" style="text-align: center;">주소</th>
            <th width="5%" style="text-align: center;">등급</th>
            <th width="5%" style="text-align: center;">에그</th>
            <th width="5%" style="text-align: center;">폰알람여부</th>
            <th width="5%" style="text-align: center;">프사</th>
            <th width="5%" style="text-align: center;">전문가필드</th>
         </tr>
         <!-- 일반게시물 출력 -->
         <c:forEach var="info" items="${ info }" varStatus="cnum">
            <tr>

               <td style="text-align: center;"><c:out value="${ info.id }" /></td>
               <td style="text-align: center;"><c:out value="${ info.name }" /></td>
               <td style="text-align: center;"><c:out
                     value="${ info.regDate}" /></td>
               <td style="text-align: center;"><c:out value="${ info.phone}" /></td>
               <td style="text-align: center;"><c:out value="${ info.addr}" /></td>
               <td style="text-align: center;"><c:out
                     value="${ info.memberGrade}" /></td>
               <td style="text-align: center;"><c:out value="${ info.egg}" /></td>
               <td style="text-align: center;"><c:out
                     value="${ info.phoneAlarm}" /></td>

               <td style="text-align: center;">   <img
                        src="${pageContext.request.contextPath }/expertFile/${info.saveFileName}"
                        style="width: 120px; height: 50px;"></td>
                     
               <td style="text-align: center;"><c:out
                     value="${ info.expertField}" /></td>

            </tr>
         </c:forEach>
      </table>


   </div> --%>
   <div></div>


   <footer style="margin-top: 200px;">
      <jsp:include page="/include/footer.jsp" />
   </footer>
</body>
</head>
</html>



