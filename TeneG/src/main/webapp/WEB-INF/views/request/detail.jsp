<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요구사항 상세</title>
<script
   src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>

<script
   src="${ pageContext.request.contextPath }/js/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"
   src="${ pageContext.request.contextPath }/js/bootbox.min.js"></script>


<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/userProfile.css?version=20161226_3" />
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/bootstrap.theme.min.css" />


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
   /***********************************************
    * Floating Top Bar script- ⓒ Dynamic Drive (www.dynamicdrive.com)
    * Sliding routine by Roy Whittle (http://www.javascript-fx.com/)
    * This notice must stay intact for legal use.
    * Visit http://www.dynamicdrive.com/ for full source code
    ***********************************************/

   var persistclose = 0 //set to 0 or 1. 1 means once the bar is manually closed, it will remain closed for browser session
   var startX = 1300 //set x offset of bar in pixels
   var startY = 60 //set y offset of bar in pixels

   function iecompattest() {
      return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement
            : document.body
   }

   function get_cookie(Name) {
      var search = Name + "="
      var returnvalue = "";
      if (document.cookie.length > 0) {
         offset = document.cookie.indexOf(search)
         if (offset != -1) {
            offset += search.length
            end = document.cookie.indexOf(";", offset);
            if (end == -1)
               end = document.cookie.length;
            returnvalue = unescape(document.cookie.substring(offset, end))
         }
      }
      return returnvalue;
   }

   var verticalpos = "fromtop"

   function closebar() {
      if (persistclose)
         document.cookie = "remainclosed=1"
      document.getElementById("topbar").style.visibility = "hidden"
   }

   function staticbar() {

      var ns = (navigator.appName.indexOf("Netscape") != -1);
      var d = document;
      function ml(id) {
         var el = d.getElementById(id);
         if (!persistclose || persistclose
               && get_cookie("remainclosed") == "")
            el.style.visibility = "visible"
         if (d.layers)
            el.style = el;
         el.sP = function(x, y) {
            this.style.left = x + "px";
            this.style.top = y + "px";
         };
         el.x = startX;
         if (verticalpos == "fromtop")
            el.y = startY;
         else {
            el.y = ns ? pageYOffset + innerHeight
                  : iecompattest().scrollTop
                        + iecompattest().clientHeight;
            el.y -= startY;
         }
         return el;
      }
      window.stayTopLeft = function() {
         if (verticalpos == "fromtop") {
            var pY = ns ? pageYOffset : iecompattest().scrollTop;
            ftlObj.y += (pY + startY - ftlObj.y) / 8;
         } else {
            var pY = ns ? pageYOffset + innerHeight
                  : iecompattest().scrollTop
                        + iecompattest().clientHeight;
            ftlObj.y += (pY - startY - ftlObj.y) / 8;
         }
         ftlObj.sP(ftlObj.x, ftlObj.y);
         setTimeout("stayTopLeft()", 10);
      }
      ftlObj = ml("topbar");
      stayTopLeft();
   }

   if (window.addEventListener)
      window.addEventListener("load", staticbar, false)
   else if (window.attachEvent)
      window.attachEvent("onload", staticbar)
   else if (document.getElementById)
      window.onload = staticbar

   function get_status(status) {
      if (status == 'D') {
         document.getElementById("sta").innerHTML = "현재상태: 대기중";
      }  else if (status == 'P') {
         document.getElementById("sta").innerHTML = "현재상태: 진행중";
      } else if (status == 'T') {
         document.getElementById("sta").innerHTML = "현재상태: 처리완료";
      }
   }
   function btnClick(btnMenu) {
      if (btnMenu == 'S') {
         alert('수락');
         location.href = "${ pageContext.request.contextPath }/response/response.do?no=${request.no}";
         
      }
      if (btnMenu == 'U') {
         location.href = "${ pageContext.request.contextPath }/request/update.do?no=${request.no}";
      }
      if (btnMenu == 'D') {
         if (confirm("삭제하시겠습니까?")==true) {
            location.href = "${ pageContext.request.contextPath }/request/delete.do?no=${request.no}";
         }
         else{return;}
      }

   }
   
   
   function onClickRes(){
      requestMsg("${request.no}", "${loginUser.id}");
   }
   
   ///////////////////////////////////////////////////// ajax 중복추천 check ////////////////////////////////////////////
   var httpRequest = null;
   // ajax 통신용으로 사용
   function requestMsg(requestNo, id){
      // 1. XMLHttpRequest Object 생성
      if(window.XMLHttpRequest) httpRequest = new XMLHttpRequest();
      else if(window.ActiveObject) httpRequest = new ActiveObject("Microsoft.XMLHTTP");
      else return;
         
      // 2. callback function 정의
      httpRequest.onreadystatechange = responseMsg;
      // 3. 서버에게 비동기 요청
      // 서버에게 hello.jsp라는 파일을 비동기로 요청
      httpRequest.open("GET", "${pageContext.request.contextPath}/response/responseCheck.do/" + requestNo + "/" + id, true);
      httpRequest.send(null);
   }
   
   function responseMsg(){
      // 4. 서버에서 응답 완료
      if(httpRequest.readyState == 4 && httpRequest.status == 200){
         var results = httpRequest.responseText.trim().split(",");
          if(results[0] == "yes"){ // 이미 추천한 상태
            alert("이미 수락 했습니다!\n" + "수락한 날짜 : " + results[1]);
         }else{ // 추천안한 상태
            recommend("${request.no}", "${loginUser.id}");
            alert("수락 하였습니다!");
         }
      }
   }
   function recommend(requestNo, id){
      // 1. XMLHttpRequest Object 생성
      if(window.XMLHttpRequest) httpRequest = new XMLHttpRequest();
      else if(window.ActiveObject) httpRequest = new ActiveObject("Microsoft.XMLHTTP");
      else return;

      httpRequest.open("GET", "${pageContext.request.contextPath}/response/recommend.do/" + requestNo + "/" + id, true);
      httpRequest.send(null);
   }
   
   function auction(){
	  location="${ pageContext.request.contextPath }/auction/auction.do?no=${request.no}";
   }
   
</script>


<style>
body {
   position: relative;
}

#sections {
   margin-left: 430px;   
   margin-right: 430px;
}

#section1 {
   padding-top: 40px;
   color: #fff;
   height:250px;
   background-color: #FFFFFF;
}

#section2 {
   padding-top: 40px;
   color: #fff;
   background-color: #FFFFFF;
}

#section3 {
   padding-top: 40px;
   color: #fff;
   background-color: #FFFFFF;
}
img {
  max-width: 100%;
}

</style>



<style type="text/css">
/* 프로팅바 스타일 */
#topbar {
   position: absolute;
   border: 1px solid black;
   padding: 5px;
   background-color: white;
   width: 400px;
   visibility: hidden;
   z-index: 100;
}
</style>

</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
   <header>
      <div align="center">
         <div style="width: 85%; margin-top: 1%;">
            <jsp:include page="/include/header.jsp" />
         </div>


      </div>
   </header>
   <br />
   <br />



   <div id="topbar">
      <nav>

         <div class="container-fluid">
            <div class="collapse navbar-collapse" id="myNavbar">
               <ul class="nav navbar-nav">
               	  
                  <li><a href="#section1">서비스 설명</a></li>
                  <li><a href="#section1">서비스 설명</a></li>
                  <li><a href="#section1">서비스 설명</a></li>
                  <li><a href="#section1">서비스 설명</a></li>
                  <li><a href="#section1">서비스 설명</a></li>
                  <li><a href="#section1">서비스 설명</a></li>
                  <li><a href="#section1">서비스 설명</a></li>
                  <li><a href="#section1">서비스 설명</a></li>
                  <li><a href="#section1">서비스 설명</a></li>
                  <li><a href="#section2">가격정보 </a></li>
                  <li><a href="#section3">A/S및 환불</a></li>

               </ul>
            </div>

         </div>
      </nav>

   </div>

   <div id="sections" class="container-fluid">
      <div id="section1" class="container-fluid">
         <div class="col-md-8 col-sm-6 hero-feature">
            <div class="thumbnail">
               <!--    <img src="http://placehold.it/800x500" alt="">  이거있던자리 ㅎ;-->
               <div class="gig-price">
                  <div class="list">
                     <!-- 이미지 출력 -->
			        <div>
			           <img src="${ pageContext.request.contextPath }/upload/${request.saveFileName}"  width=610px height=300px />
			        </div>
                  </div>
               </div>
               <div class="caption">
                  <h3>${request.title}</h3>
                  <p>카테고리 : ${request.field}
                  <p>
                     <i class="fa fa-krw"></i>&nbsp;${request.price}
                  </p>
               </div>
            </div>
         </div>
         
         <div class="col-md-4 col-sm-6 hero-feature">
            <div class="thumbnail">
               <!--    <img src="http://placehold.it/800x500" alt="">  이거있던자리 ㅎ;-->
               <div class="gig-price">
                  <div class="caption">
                  <!-- 글쓴이이면 메뉴가능-->
                  <c:if test="${loginUser.id eq request.id}">
                     <button class="btn" onclick="btnClick('U')">수정</button>
                     <br />
                     <br />
                     
                     <button class="btn" onclick="btnClick('D')">삭제</button>
                     <br />
                     <br />
                     <!--  -->
                     </c:if>
            <!-- 전문가이면 수락메뉴 가능-->
            <c:if test="${request.expertId ne null }">
            <button class="btn" type="button"  onclick="onClickRes()">
            <span class="glyphicon glyphicon-ok-sign">의뢰수락(<i class="fa fa-krw"></i>&nbsp;${request.price})</span>
            </button>
            <input type="button" onclick="auction()" value="경매참여">   
            </c:if>
            
                  </div>
               </div>

            </div>
         </div>

      </div>
      
      <br/><br/><br/>
      <h3>서비스설명</h3>
      <div id="section2" class="container-fluid">      
         <div class="col-md-8 col-sm-6 hero-feature">
            <div class="form-group">
               <label for="title" class="col-sm-4 control-label">가격정보</label>
               <div class="col-sm-4"></div>
            </div>
            
            <!-- 컨텐츠 내용 수정부분  -->
            <div class="thumbnail">
               <div class="gig-price">
                  <div class="list"></div>
               </div>

               <div class="caption">
                   ${request.content}
               </div>
            </div>
            
            <!--  -->
            <div class="thumbnail">
               <div class="gig-price">
                  <div class="list"></div>
               </div>
               <div class="caption">
                  <h3 id="sta">
                     현재상태 :
                     <script type="text/javascript">
                        get_status('${request.status}')
                     </script>
                  </h3>
                  <h3 id="sta">진행률</h3>
                  <div class="progress">
                     <div class="progress-bar progress-bar-success" role="progressbar"
                        aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                        style="width: ${request.progress}%">${request.progress}%
                        Complete (success)</div>
                  </div>
               </div>
            </div>
         </div>
         
      
         <div class="col-md-4 col-sm-6 hero-feature">
            <div class="thumbnail">
               <!--    <img src="http://placehold.it/800x500" alt="">  이거있던자리 ㅎ;-->
               <div class="gig-price">
                  <div class="caption">
                     <h3>요청자 정보찍기</h3>

                     <!-- ------------------------------------------------------  -->
                     <!-- 프로필  -->
                     <div class="container">
                        <div class="row">
                           <div class="col-lg-3 col-sm-6">

                              <div class="card hovercard">
                                 <div class="cardheader"></div>
                                 <div class="avatar">
                                    <a href="#"><img
                                       src="${ pageContext.request.contextPath }/img/profileImg.PNG"
                                       class="img1" /></a>
                                 </div>
                                 <div class="info">
                                    <div class="title">
                                       <a target="_blank" href="http://scripteden.com/">정승훈</a>
                                    </div>
                                    <div class="desc">총 거래건수 120건</div>
                                    <div class="desc">만족도 22%</div>
                                    <div class="desc">불량 이용자</div>

                                 </div>
                                 <div class="bottom">
                                    <a class="btn btn-primary btn-twitter btn-sm"
                                       href="https://twitter.com/webmaniac"> <i
                                       class="fa fa-twitter"></i>
                                    </a> <a class="btn btn-danger btn-sm" rel="publisher"
                                       href="https://plus.google.com/+ahmshahnuralam"> <i
                                       class="fa fa-google-plus"></i>
                                    </a> <a class="btn btn-primary btn-sm" rel="publisher"
                                       href="https://plus.google.com/shahnuralam"> <i
                                       class="fa fa-facebook"></i>
                                    </a> <a class="btn btn-warning btn-sm" rel="publisher"
                                       href="https://plus.google.com/shahnuralam"> <i
                                       class="fa fa-behance"></i>
                                    </a>
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
      
      <br/><br/><br/><h1>A/S및 환불</h1>
      
      <div id="section3" class="container-fluid">
         <div class="col-md-8 col-sm-6 hero-feature">
            <div class="thumbnail">

               <div class="caption">
                  <h3>프로그램에 따라 다름으로 제작 전 협의 후 진행 합니다. 환불규정: 작업이 당초 약정일자보다 지연되거나
                     그에 상응하는 사안이 발생했을 경우 협의에 따라 환불이 가능합니다.</h3>
               </div>

            </div>
         </div>
      </div>
      
   </div>

	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</head>
</html>