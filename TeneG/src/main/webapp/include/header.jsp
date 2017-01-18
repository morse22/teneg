<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath }/css/half-slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/sb-admin.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/plugins/morris.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery.bpopup.min.js"></script>
<style> 		
#element_to_pop_up {background-color:#fff;border-radius:15px;color:#000;display:none; padding:20px;min-width:300px;min-height: 180px;}
.b-close{cursor:pointer;position:absolute;right:10px;top:5px;}	 	
</style>
<script>
 function exchangePopup(data){
      var popUrl;
      switch(data){
      case 'exchange' :
         popUrl = "${pageContext.request.contextPath}/egg/exchange.do";   //팝업창에 출력될 페이지 URL
         break;
      }   
      var popOption = "width=470, height=600, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
      window.open(popUrl, "", popOption);
   }
   

	////////////////////////////////////////////// ajax 전문가 등록 중첩 확인  start ////////////////////////////////////////////
	var httpRequest = null;
	// ajax 통신용으로 사용
	function requestExpertCheck(){
		// 1. XMLHttpRequest Object 생성
		if(window.XMLHttpRequest) httpRequest = new XMLHttpRequest();
		else if(window.ActiveObject) httpRequest = new ActiveObject("Microsoft.XMLHTTP");
		else return;
			
		// 2. callback function 정의
		httpRequest.onreadystatechange = expertCheckResponse;
		// 3. 서버에게 비동기 요청
		// 서버에게 hello.jsp라는 파일을 비동기로 요청
		httpRequest.open("GET", "${pageContext.request.contextPath}/expert/expertCheck.do/" + "${loginUser.id}", true);
		httpRequest.send(null);
	}
	
	function expertCheckResponse(){
		// 4. 서버에서 응답 완료
		if(httpRequest.readyState == 4 && httpRequest.status == 200){
			var results = httpRequest.responseText;
			if(results == "yes"){
				location = "${ pageContext.request.contextPath }/expert/write.do";
			}
			else{
				alert("이미 전문가 신청된 ID입니다.");
				return false;
			}
				
		}
	}
   
   function checkDuplicate(){
	   if("${sessionScope.loginUser}" == ""){
		   location="${pageContext.request.contextPath}/member/login.do";
	   }else{
	     requestExpertCheck();   
	   }
	   return false;
   }
   
	/////////////////////////////////////////////// ajax 전문가 등록 중첩 확인 end ////////////////////////////////////////////
	
	$(document).ready(function() { 
		setInterval(function(){
 			if('${sessionScope.id}'!= ""){
 			$.ajax({
 				type : "post",
 				url : "${pageContext.request.contextPath}/msg/opendate.do",
 				success : function(data) {	
 					if(data >= 1){
 						$('#ajax_msg').html("new");
 						$.ajax({
 							type:"post",
 							url:"${pageContext.request.contextPath}/msg/updateValue.do",
 							success:function(data){
 								if(data >= 1){
 									 $('#element_to_pop_up').bPopup({
 										    modalClose: false,
 										    opacity: 0.6,
 										    followSpeed: 1500, //can be a string ('slow'/'fast') or int
 										    speed: 450,
 										    transition: 'slideDown',
 										    transitionClose: 'slideBack', 										    			
 									 });
 		  						$('#element_to_pop_up, .b-close').click(function(){		
 		  							$.ajax({
 		  								type:"post",
 		  								url:"${pageContext.request.contextPath}/msg/update_pop.do",
 		  								success:function(){
 		  									$('element_to_pop_up').bPopup().close(); 		  						
 		  								}
 		  							});
 		  					       						 
 		 							}); 
 									
 								}
 							}
 						});
 						
 					}else{
 						$('#ajax_msg').html('');
 					}
 				  }
 			  });
 			}
 		}, 3000); 
 		
 		if('${sessionScope.id}'!= ""){
 			$.ajax({
 				type : "post",
 				url : "${pageContext.request.contextPath}/msg/opendate.do",
 				success : function(data) {	
 					if(data >= 1){
 						$('#ajax_msg').html("new");
 						
 						
 					}else{
 						$('#ajax_msg').html('');
 						 $('#popup_layer, #overlay_t').hide();
 					}
 				  }
 			  });
 			}
 	
 	$('.message-footer').click(function(){
 				$.ajax({
 					type : "put",
 					url : "${pageContext.request.contextPath}/msg/update.do",
 					headers:{
 						"Content-Type" : "application/json"
 					},
 					data : JSON.stringify({
 				
 					}),
 					dataType: "text",
 					success : function(result){
 						if(result == "success"){
 							opener.location.reload();
 						}
 					}
 		
 				})
 			}); 
 	//승 인터벌
    setInterval(function() {
         if('${loginUser.id}'!= ""){
            
            
         $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/requestwaiting/acceptcount.do?id=${loginUser.id}",
            success : function(data) {   
                if(data>=1){
                   $('#ajax_alert').html("new");
                }
              }
           });
         }
         
      }, 1000); 
 
    setInterval(function() {
         if('${loginUser.id}'!= ""){
            
            
         $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/response/acceptcount.do?id=${loginUser.id}",
            success : function(data) {   
                if(data>=1){
                   $('#ajax_alert').html("new");
                }
              }
           });
         }
         
      }, 1000); 

 
 setInterval(function() {
         if('${loginUser.id}'!= ""){
         $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/request/requestcount.do?id=${loginUser.id}",
            success : function(data) {   
                if(data>=1){
                   $('#ajax_alert').html("new");
                }
              }
           });
         }
         
      }, 1000); 
    
 	});  	
</script>
<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container" style="margin-left: 11%;">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="${ pageContext.request.contextPath }/"
					style="margin-left: 40px;">
						<img src="${ pageContext.request.contextPath }/img/footerlogo3.png" style="height: 50px; width: 100px;"/>
					</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="width: 1400px;">
			    <ul class="nav navbar-nav">
                    <li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><spring:message
							code="request" /><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${ pageContext.request.contextPath }/request/write.do"><spring:message
							code="request" /></a></li>
						<li><a href="${ pageContext.request.contextPath }/request/manage.do?id=${loginUser.id}&type=myDList">의뢰관리</a></li>
						<li><a href="${ pageContext.request.contextPath }/request/list.do/all/all">의뢰리스트(전체)</a></li>
						<li><a href="${ pageContext.request.contextPath }/request/dlist.do?field=all&id=${loginUser.id}">대기리스트</a></li>
						<li><a href="${ pageContext.request.contextPath }/requestwaiting/list.do?id=${loginUser.id}">응답온 전문가 리스트</a></li>
					</ul></li>
                      
                    <c:if test="${ not empty loginUser }">
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> Egg관리 <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
                       		 <a href="${ pageContext.request.contextPath }/egg/charge.do"><spring:message code="eggCharge"/></a>
                  			</li>
							<li><a href="${ pageContext.request.contextPath }/egg/chargeList.do/${loginUser.id}">충전내역</a></li>
							<li><a href="javascript:exchangePopup('exchange')">환전하기</a></li>
							<li><a href="${ pageContext.request.contextPath }/egg/giftList.do/${loginUser.id}/all">선물함</a></li>
							
							
						</ul>
					</li>
                    </c:if>  
                    <li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> 전등 <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="return checkDuplicate();">전문가 신청</a></li>		
							<li><a href="${ pageContext.request.contextPath }/expert/list.do">전문가 리스트(사용자)</a></li>			
							<li><a href="${ pageContext.request.contextPath }/expert/managerList.do?type=all">전문가 리스트(관리자)</a></li>
							<c:if test="${ not empty loginUser }">
								<li><a href="${ pageContext.request.contextPath }/expert/workList.do/${loginUser.id}">진행중인 의뢰</a></li>			
							</c:if>					
							<c:if test="${ not empty loginUser }">
								<li><a href="${ pageContext.request.contextPath }/refund/Plist.do/">환불관리(관리자)</a></li>			
							</c:if>					
						</ul>
					</li>
                    <li>
                        <a href="${ pageContext.request.contextPath }/board/list.do?pc=11&page=1"><spring:message code="board"/></a>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">광고관리<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${ pageContext.request.contextPath }/manager/editad.do">사이드 광고</a></li>		
							<li><a href="${ pageContext.request.contextPath }/manager/editBoardBanner.do">게시판 베너</a></li>			
							<li><a href="${ pageContext.request.contextPath }/manager/mainAd.do">메인광고</a></li>					
							<li><a href="${ pageContext.request.contextPath }/auction/test.do">경매테스트</a></li>					
							<li><a href="${ pageContext.request.contextPath }/ttt.do">테스트jsp</a></li>					
						</ul>
					</li>
					<li><a
					href="${ pageContext.request.contextPath }/manager/memberManage.do">관리자P</a>
				</li>
                </ul>

				<ul class="nav navbar-right top-nav">
				<c:if test="${ not empty loginUser }">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><b id="ajax_alert" style="color: red;"></b><i
							class="fa fa-bell"></i> <b class="caret"></b></a>
						<ul class="dropdown-menu alert-dropdown">

							
							
							<li><a
								href="${ pageContext.request.contextPath }/requestwaiting/list.do?id=${loginUser.id}">응답온
									전문가 <span id="ajax_count1" class="badge" >0</span></a></li>
							<li><a
								href="${ pageContext.request.contextPath }/response/list.do?id=${loginUser.id}">매칭된리스트
								 <span id="ajax_count2" class="badge">0</span></a></li>
							<li><a
								href="${ pageContext.request.contextPath }/request/newList.do?id=${loginUser.id}">새로올라온
									요청 <span id="ajax_count3" class="badge">0</span></a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><b id="ajax_msg" style="color: red;"></b><i
							class="fa fa-envelope"></i> <b class="caret"></b></a>
						<ul class="dropdown-menu message-dropdown">
							<li class="message-preview"><a href="#">
									<div class="media">
										<span class="pull-left"> <img class="media-object"
											src="http://placehold.it/50x50" alt="">
										</span>
										<div class="media-body">
											<h5 class="media-heading">
												<strong>매니져</strong>
											</h5>
											<p class="small text-muted">
												<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
											</p>
											<p>Lorem ipsum dolor sit amet, consectetur...</p>
										</div>
									</div>
							</a></li>
							<li class="message-preview"><a href="#">
									<div class="media">
										<span class="pull-left"> <img class="media-object"
											src="http://placehold.it/50x50" alt="">
										</span>
										<div class="media-body">
											<h5 class="media-heading">
												<strong>John</strong>
											</h5>
											<p class="small text-muted">
												<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
											</p>
											<p>Lorem ipsum dolor sit amet, consectetur...</p>
										</div>
									</div>
							</a></li>
							<li class="message-preview"><a href="#">
									<div class="media">
										<span class="pull-left"> <img class="media-object"
											src="http://placehold.it/50x50" alt="">
										</span>
										<div class="media-body">
											<h5 class="media-heading">
												<strong>John</strong>
											</h5>
											<p class="small text-muted">
												<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
											</p>
											<p>Lorem ipsum dolor sit amet, consectetur...</p>
										</div>
									</div>
							</a></li>
							<li class="message-footer"><a
								href="${ pageContext.request.contextPath }/message/list">Read
									All New Messages</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="fa fa-user"></i> <c:if
								test="${ empty loginUser }">
								로그인
							</c:if> <c:if test="${ not empty loginUser }">
								${loginUser.id}
							</c:if> <b class="caret"></b> </a>
						<ul class="dropdown-menu">
							<li><a href="${ pageContext.request.contextPath}/member/myInfo.do?id=${loginUser.id}&maintype=menu1&type=myDList"><i class="fa fa-fw fa-user"></i>마이페이지</a></li>
							<li><a
								href="${pageContext.request.contextPath}/member/memberList.do"><i
									class="fa fa-fw fa-list"></i>
								<spring:message code="memberlist" /></a></li>
								<!--myPageForm -회워정보수정임  -->
							<li><a
								href="${pageContext.request.contextPath}/member/myPageForm.do?id=${loginUser.id}">
									<i class="fa fa-fw fa-gear"></i>
								<spring:message code="memberupdate" />
							</a></li>
							<li class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/member/logout.do">
									<i class="fa fa-fw fa-power-off"></i>Log Out
							</a></li>
						</ul></li>
				</c:if>
				<c:if test="${not empty loginUser }">
					<li><a href="#" style="color: yellow;">${loginUser.egg }<img
							style="width: 21px; height: 25px; margin-left: 3px;"
							src="${ pageContext.request.contextPath }/img/egg2.png"></a></li>
				</c:if>
				<c:if test="${ empty loginUser }">
					<li><a
						href="${pageContext.request.contextPath}/member/login.do"><spring:message
								code="login" /></a></li>
				</c:if>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-fw fa-language"></i>언어(Language)<b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a onclick="changeLanguage('ko')"><i
								class="fa fa-fw fa-language"></i>한국어(ko)</a></li>
						<li><a onclick="changeLanguage('en')"><i
								class="fa fa-fw fa-language"></i>영어(en)</a></li>
					</ul></li>
			</ul>
			</div>
			<!-- /.navbar-collapse -->
			<div id="element_to_pop_up">
				<b class="b-close">x</b><a href="${pageContext.request.contextPath }/message/list">New Message</a>
			</div> 
		</div>
		<!-- /.container -->
	</nav>


