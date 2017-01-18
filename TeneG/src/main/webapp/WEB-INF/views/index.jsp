<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TeneG</title>
<!-- 이거있어야 메뉴됨 -->
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.theme.min.css" />
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" />
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath }/css/half-slider.css?version=20161219" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/sb-admin.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/plugins/morris.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
<link href="${ pageContext.request.contextPath }/css/jquery.bxslider.css" rel="stylesheet" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery.banner.js"></script>

<script>
$(document).ready(function(){
$('#login_submint').click(function(){
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/member/login_index.do",
		data:{
			"id" : $('#logind_id').val(),
			"password" : $('#login_password').val()
		},
		success : function(data){
			if(data == "${false}"){
				location.href="${pageContext.request.contextPath}/member/login.do"
			}else{
				location.reload();
				
			}
		}
		
		});
	
	});
});	 
	
//var adpath = ["${pageContext.request.contextPath}/img/ad2.png", "${pageContext.request.contextPath}/img/ad3.png"];
//var idx = 0;

function changeLanguage(data) {
	if (data == "언어(Language)") return;
	location = "${pageContext.request.contextPath}/locale/changeLang.do?lang="
			+ data;
}

$(document).ready(function(){
	  $('.slider1').bxSlider({
	    slideWidth: 1000,
	    minSlides: 1,
	    maxSlides: 1,
	    auto : true
	  });
	  
/* 		 setInterval(function(){
		 $("#leftAd").attr("src",adpath[idx++%2]); 
	 }, 5000); */
	 
	$("#notiImageList").jQBanner({	//롤링을 할 영역의 ID 값
			nWidth:1000,					//영역의 width
			nHeight:100,				//영역의 height
			nCount:5,					//돌아갈 이미지 개수
			isActType:"up",				//움직일 방향 (left, right, up, down)
			nOrderNo:1,					//초기 이미지
			nDelay:3000					//롤링 시간 타임 (1000 = 1초)
		}
	);
	 
// 	신규 목록
    var count = $('#rank-list li').length;		// li의 갯수 : foreach를 돌고있으므로 요청의 갯수.
    var height = $('#rank-list li').height();

    function step(index) {	// index : 1.. 2.. 3.. 4.. 5.. % count의 갯수만큼씩 계속 돔.
        $('#rank-list ol').delay(1000).animate(
        	{ top: -height * index, }
        	, 500
        	, function() { step((index + 1) % count); }	// step(1.. 2.. 3.. 4.. 5.. % count의 갯수만큼씩 계속 돔.)
        );
    }
    step(1);
});

function onClickSearch(){
	var searchText = $("#service");
	if(searchText.val().trim() == ""){
		alert("검색어를 입력하세요");
		return;
	}

	location = "${ pageContext.request.contextPath}/expert/searchItem.do/" + searchText.val();
}

function sendEgg(){
	var receiver = $("#receiver").val();
	var egg = $("#egg").val();
	 $.ajax({
		type: "post",
		url : "${ pageContext.request.contextPath }/egg/checkGift.do/" + receiver +"/"+ egg+ "/${loginUser.id}" ,
		success : function(check){
		var data = check.split(":");
		 if(data[0] == 'null'){
			 alert("아이디가 존재하지 않습니다."); 
		 }else{
		
			 if(parseInt(data[1]) < parseInt(egg) ){
				 alert("보유한 Egg를 초과하였습니다.");
			 }else{			 
				 $("#giftForm").submit();
				 alert("선물을 보냈습니다.");
			 }
		}
		} 
	}); 
}

</script>

<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

.list {
	position: relative;
}

.list .overImg {
	position: absolute;
	display: none;
	top: 0;
}

.list p.money {
	position: absolute;
	top: 5px;
	left: 20px;
	color: #fff;
	background-color: hsla(360, 100%, 0%, 0.5);
	font-size: 14pt;
}

.list p.premium {
	position: absolute;
	top: 5px;
	left: 225px;
	color: #fff;
	background-color: rgb(255, 0, 0);
	font-size: 10pt;
}

.rating {
	unicode-bidi: bidi-override;
	direction: rtl;
}

.rating>span {
	display: inline-block;
	position: relative;
	width: 1.1em;
}

.rating>span:hover:before, .rating>span:hover ~ span:before {
	content: "\2605";
	position: absolute;
}

.img1:hover{
	opacity:0.4;
}

.clickIamge:hover{
	opacity:0.7;
}

video#bgvid { 
    position: fixed;
    min-width: 100%;
    min-height: 100%;
    width: auto;
    height: auto;
    z-index: -100;
    transform: translateX(-0%) translateY(-30%);
    background-size: cover; 
}

/* 신규 목록 css -- 여기부터 아래까지 40줄정도 */
.content {
	min-height: 300px;
}

.banner {
	min-height: 150px;
}

#content {
    margin: 20px;
    width: 20%;
    float: right;
    padding: 10px;
	min-height: 300px;
    border-style: double;
    border-color: black;
    background: gray;
}

#rank-list a {
    color: #000;
    text-decoration: none;
}

#rank-list a:hover {
    text-decoration: underline;
}

#rank-list {
    overflow: hidden;
    width: 500px;
    height: 20px;
    margin: 0;
}

#rank-list #dt {
    display: none;
}

#rank-list #dd {
    position: relative;
    margin: 0;
}

#rank-list ol {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    list-style-type: none;
}

#rank-list li {
    height: 20px;
    line-height: 20px;
}
.select-style {
    border: 1px solid #ccc;
    width: 60px;
    padding: 5px 0px 5px 0px;
    border-radius: 3px;
    overflow: hidden;
   	background: url('${ pageContext.request.contextPath }/img/icon-select.PNG') no-repeat 100% 0%; 

}

.select-style select {
    padding: 5px 8px;
    width: 70%;
    border: none;
    box-shadow: none;
    background: transparent;
    background-image: none;
    -webkit-appearance: none;
    
   
}

.select-style select:focus {
    outline: none;
}


</style>
</head>
<body>
	<header>
		<div align="center">
			<div style="width: 85%; margin-top: 1%;">
				<jsp:include page="/include/header.jsp" />
			</div>
		</div>
	</header>
	
<%-- 	<!-- 좌측광고 -->
	<div style="position:fixed; top:300px; left:30px;">
		<a href="http://store.musinsa.com/app/" target="_blank"><img id="leftAd" src="${ pageContext.request.contextPath }/img/ad3.png"/></a><br/>
		<a href="#"  style="text-decoration: none;">광고문의</a>
	</div> --%>

	<!-- Half Page Image Background Carousel Header -->
	<header id="myCarousel" class="carousel slide">
		<!-- Wrapper for Slides -->
		<div class="carousel-inner">
			<div class="item active">
				<!-- Set the first background image using inline CSS below. -->
 				<div class="fill">
 				<div >
                   <video loop autoplay class="fullscreen-bg__video" id="bgvid">
                          <source src="${ pageContext.request.contextPath }/img/backav.mp4" type="video/mp4">
                   </video>
               	</div>
					<div class="intro-header">
						<div class="container">
							<div class="row" style="margin-top: 140px; margin-bottom: 90px">
								<div class="col-lg-12" align="center">
									<div class="intro-message">
										<h3 style="font-size: 33px; color: white; font-weight: 800;">모든 일에는 전문가가 필요합니다</h3>
										<h5 style="font-size: 17px; color: white; margin-top: 10px; font-weight: 800;">당신의 비즈니스를 성장시킬 전문가들이 모인 곳, TeneG</h5>
										<ul class="list-inline intro-social-buttons" style="margin-top: 60px;">
											<li>
												<a href="${ pageContext.request.contextPath }/request/write.do" class="btn btn-default btn-lg" 
												style="background: rgba(0, 0, 0, 0); border:2px solid yellow;" 
												onmouseout="this.style.background='rgba(0, 0, 0, 0)';" onmouseover="this.style.background='rgba(0, 0, 0, 0.7)';">
													<span class="network-name" style="color:yellow;"><spring:message code="request" /></span>
												</a>
											</li>
											<li><a href="#" class="btn btn-default btn-lg"
												data-toggle="modal" data-target="#tenegManual"
												onclick="_gaq.push(['_trackEvent', 'clickEvent', 'main' ,'TeneG이용방법']);"
												style="background: rgba(0, 0, 0, 0); border: 2px solid yellow;"
												onmouseout="this.style.background='rgba(0, 0, 0, 0)';"
												onmouseover="this.style.background='rgba(0, 0, 0, 0.7)';">
													<span class="network-name" style="color: yellow;"><spring:message
															code="howtouse" /></span>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div style="height: 80px; width: 100%; background: rgba(0, 0, 0, 0.7);">
						<div align="center" style="padding-top: 22px;">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="service"></label>
								<div class="col-sm-3" style="padding: 0px; margin: 0px;">
									<input type="text" id="service" name="service" class="form-control" style="font-weight: bold;"
									placeholder="찾으시는 서비스를 한단어로 검색하세요 ex)자바 " maxlength="10" autofocus required/>
								</div>
								<div class="col-sm-1" style="padding: 0px; margin: 0px; height: 54px; width: 150px;">
									<input type="button" class="btn btn-danger" value="서비스 검색" onclick="onClickSearch()"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<div class="content">
<!-- 	신규 목록 -->
<!-- 	출처 : http://sir.kr/pg_tip/8224 -->
		
		<div id="content">
	       	<strong style="color: black;">실시간 의뢰 목록</strong>
	        <div id="rank-list">
	            <div id="dt">실시간 의뢰 목록</div>
	            <div id="dd">
	                <ol>
	                	<c:forEach var="request" items="${ list }">
	                    	<li>
	                    		<a href="${ pageContext.request.contextPath }/request/detail.do?no=${request.no}&id=${loginUser.id}">
		                    		제목 : <c:out value="${ request.title }" /> / 
		                    		등록시간 : <c:out value="${ request.regDate }" />
	                    		</a>
	                    	</li>
	                    </c:forEach>
	                </ol>
	            </div>
	        </div>
	        <div id="rank-list">
	            <div id="dt">실시간 의뢰 목록</div>
	            <div id="dd">
	                <ol>
	                	<c:forEach var="request" items="${ list }">
	                    	<li>
	                    		<a href="${ pageContext.request.contextPath }/request/detail.do?no=${request.no}&id=${loginUser.id}">
		                    		제목 : <c:out value="${ request.title }" /> / 
		                    		등록시간 : <c:out value="${ request.regDate }" />
	                    		</a>
	                    	</li>
	                    </c:forEach>
	                </ol>
	            </div>
	        </div>
	    </div>
	    
	    
<!-- 임시 베너 -->
		<div align="right" style="margin-top: 30px; margin-right: 300px; position: relative;">
			<a href="#" data-toggle="modal" data-target="#requestModal"><img class="img1" id="temp"
				src="${ pageContext.request.contextPath }/img/banner1-1.png" /></a> <a
				href="#"><img class="img1" id="temp"
				src="${ pageContext.request.contextPath }/img/banner1-2.png" /></a> <a
				href="#"><img class="img1" id="temp"
				src="${ pageContext.request.contextPath }/img/banner1_3.png" /></a> <a
				href="#"><img class="img1" id="temp"
				src="${ pageContext.request.contextPath }/img/banner1_4.png" /></a> <a
				href="#"><img class="img1" id="temp"
				src="${ pageContext.request.contextPath }/img/banner1_5.png" /></a>

						<c:choose>
			<c:when test="${empty sessionScope.id  }">
			<div style="width: 330px; height: 150px; line-height: 3.3em; float: right;
			margin-right: 30px; padding-top: 15px; position: relative; background-color: rgb(240, 240, 240); border : 1px solid rgb(200, 200, 200);">
				<form>
					<input type="button" value="LOGIN" id="login_submint"
						style="background-color:white; border-radius: 4px; float: right; height: 80px; 
						width: 80px;  margin-left: 5px; margin-top: 5.5p; margin-right: 10px;"> 
					<input type="text" id="logind_id" name="logind_id" placeholder=" ID"
					    style="height: 35px; width:220px; border-radius: 4px;">
					<input type="password" id="login_password" name="login_passsword" placeholder=" PASSWORD"
					    style="height: 35px; width:220px; border-radius: 4px;">
				</form>
				<p style=" line-height:5px; font-size: 13px; margin-top: 10px; margin-right: 15px;">
					<a href="${pageContext.request.contextPath }/member/singinAgree.do"><span>회원가입</span></a>&nbsp;&nbsp;
					<a href="#" onclick="heloPopup()"><span>아이디/비빌번호찾기</span></a>
				</p>
			</div>
			</c:when>
			<c:when test="${not empty sessionScope.id  }">
					<div
						style="width: 330px; height: 150px; line-height: 3.3em; float: right; margin-right: 30px; padding-top: 15px;">
						<div
							style="width: 120px; height: 100px; border: 1px solid #bbb; margin-left: 15px; float: left">
							<img
								src="${pageContext.request.contextPath }/expertFile/${loginUser.saveFileName}"
								style="width: 120px; height: 100px;">
						</div>
						<div style="width: 170px; height: 100px; float: right;">
							<p>
								<span>${loginUser.name}님 환영합니다</span>
							</p>
							<p>[마이페이지]&nbsp;|&nbsp;${loginUser.memberGrade }</p>
							<a href="#" data-toggle="modal" data-target="#giftModal">선물하기</a>
						</div>
					</div>
				</c:when>
			</c:choose>
		</div>
		<!-- 전문가 베너 -->
		<div id="notiImageList" align="right">
			<div class="clsBannerScreen">
				<div class="images"><img src="${ pageContext.request.contextPath }/img/expertbanner.png" /></div>
				<div class="images"><img src="${ pageContext.request.contextPath }/img/adtest1.png" /></div>
				<div class="images"><img src="${ pageContext.request.contextPath }/img/adtest3.png" /></div>
				<div class="images"><img src="${ pageContext.request.contextPath }/img/adtest4.png" /></div>
				<div class="images"><img src="${ pageContext.request.contextPath }/img/adtest5.png" /></div>
			</div>
		</div>
    </div>
	

	<!-- Page Content -->
	<div style="background-color: rgb(240, 240, 240); margin-top: 40px;">
	<div class="container">
		<hr>
		<!-- Title -->
		<div class="row">
			<div class="col-lg-12">
				<h3>의뢰 목록</h3> 
			</div>
		</div>
		<!-- /row -->
		<!-- egg gift modal창 -->
		<div id="giftModal" class="modal fade" role="dialog" >
			<div class="modal-dialog"  >

				<!-- Modal content-->
				<div class="modal-content" style="width: 500px; ">
					<div class="modal-header" style="padding-bottom: 0px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h5 class="modal-title"> <img src="${ pageContext.request.contextPath }/img/gift.png" style="width: 30px; height: 30px; margin-bottom: 8px;" > </h5> 
					</div>
					<form  id="giftForm" action="${ pageContext.request.contextPath }/egg/gift.do" method="post" >
					<div class="modal-body">
						<input type="hidden" name="sender" value="${loginUser.id }" >
						<span> 받는 사람 <input type="text" name="receiver" id="receiver" placeholder="ID 입력" style="width: 100px; margin-left: 5px; text-align: center;"></span>
						<span style="margin-left: 20px;"> <img src="${ pageContext.request.contextPath }/img/egg2.png" style="width: 23px; height: 27px; padding-bottom: 3px; ">
						 <input type="text" name="egg" id="egg" style="width: 100px; text-align: center; " placeholder="egg 입력" ></span>
						<span style="float: right;"><input type="button" class="btn" value="보내기" style="padding: 4px 7px 4px 7px; background-color: red; color: white;" onclick="sendEgg()"></span><br/><br/>
						<span> 보낼 메세지 
							<span class="select-style">
								<select  name="title" id="title">
									<option value="의뢰 잘 마무리되서 감사드려요" selected>의뢰 잘 마무리되서 감사드려요</option>
									<option value="생일 축하합니다!!">생일 축하합니다!!</option>
									<option value="새해 복 많이 받으세요~"> 새해 복 많이 받으세요</option>
									<option value="메리 크리스마스~"> 메리 크리스마스~</option>
								</select>
							</span>
						</span>
					</div>
					</form>
					<div class="modal-footer" style="margin-top: 0px;">
						
					</div>
				</div>

			</div>
		</div>




		<!-- Page Features -->
		<div class="row text-center">
			<c:forEach var="request" varStatus="status" items="${ list }">
				<div class="col-md-3 col-sm-6 hero-feature" class="itemObj">
					<div class="thumbnail">
						<div class="gig-price">
							<div class="list">
								<a href="${ pageContext.request.contextPath }/request/detail.do?no=${request.no}&id=${loginUser.id}">
									<c:if test="${ request.field eq 'c' }">
										<img src="${ pageContext.request.contextPath }/img/c.png" style="height: 180px; width: 250px;" class="img1" />
									</c:if>
									<c:if test="${ request.field eq 'java' }">
										<img src="${ pageContext.request.contextPath }/img/java.png" style="height: 180px; width: 250px;" class="img1" />
									</c:if>
									<c:if test="${ request.field eq 'python' }">
										<img src="${ pageContext.request.contextPath }/img/python.png" style="height: 180px; width: 250px;" class="img1" />
									</c:if>
									<c:if test="${ request.field eq 'cpp' }">
										<img src="${ pageContext.request.contextPath }/img/cplusplus.png" style="height: 180px; width: 250px;" class="img1" />
									</c:if>
									<c:if test="${ request.field eq 'php' }">
										<img src="${ pageContext.request.contextPath }/img/php.png" style="height: 180px; width: 250px;" class="img1" />
									</c:if>				
								</a>
								<img style="position:absolute; top:135px; left:180px; border-radius: 50px; height: 60px; width: 60px;" src="${ pageContext.request.contextPath }/img/test3.png"/>		
								<p class="money">&nbsp;<i class="fa fa-krw"></i>&nbsp;${request.price}&nbsp;</p>
								<p class="premium">&nbsp;P&nbsp;</p>
							</div>
						</div>
						<div class="caption">
							<h5 style="font-weight: bold;">${request.title}</h5>
							<p>${request.id}</p>
							<div class="rating">
								<span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- row -->
		<hr>
	</div>
	</div>
	
	<!-- 의뢰서 sample modal창 -->
		<div id="requestModal" class="modal fade" role="dialog" >
			<div class="modal-dialog" style="margin-left: 150px;" >

				<!-- Modal content-->
				<div class="modal-content" style="width: 1500px; ">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">의뢰서 Sample</h4> 
						<span style="color: red; font-size: 11px;" >- sample과 같이 상세히 요구사항을 올리지 않을 경우 원하는 결과물을 못 받을 수 있습니다.<br/> 
						&nbsp;&nbsp;환불 요청시 첨부파일과 비교를 통해 판단하므로, 상세하게 작성하세요. </span>
						<span style="margin-left: 150px;">
							<button type="button" class="btn btn-success" onclick="location.href='${ pageContext.request.contextPath }/request/write.do'">동의</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</span>
					</div>
					<div class="modal-body">
						<img src="${ pageContext.request.contextPath }/img/reqSample.png">
					</div>
					<div class="modal-footer">
						
					</div>
				</div>

			</div>
		</div>

	<!--  구매방법 modal창 -->

	<div style="background-color: rgb(248, 248, 248);">
	<div class="modal fade" id="kmongManual" tabindex="-1" role="dialog"
		aria-labelledby="myModal" aria-hidden="false">
		<div class="modal-dialog manual_modal">
			<div class="modal-content" style="width: 640px;">
				<div class="row how-aticle">
					<div class="kmong-how">
						<div class="kmong-how-title text-center">
							<div class="kmong-how-close" data-dismiss="modal" align="right"
								style="color: white; cursor: pointer;">X</div>
							<h3 class="color-black">
								<b>구매방법</b>
							</h3>
						</div>
						<div align="center">
							<hr style="width: 80%; border-color: black;" />
						</div>
						<div class="col-lg-12">
							<table>
								<tr>
									<td class="col-lg-4"><img src="img/request2.png" alt="의뢰하기"
										style="margin-left: 100px" /></td>
									<td class="col-lg-8"><h3
											class="margin-top-0 color-dark-yellow-400">
											<i style="color: rgb(0, 200, 60); font-weight: bold;">01</i>
										</h3>
										<h5>
											<b>'의뢰하기'</b> 를 통해 요구사항을 올립니다.
										</h5>
									</td>
								</tr>
								<tr><td><div style="height: 20px;"></div></td></tr>
								<tr>
									<td class="col-lg-4"><img src="img/feedback2.png" alt="피드백"
										style="margin-left: 100px" /></td>
									<td class="col-lg-8"><h3
											class="margin-top-0 color-dark-yellow-400">
											<i style="color: rgb(0, 200, 60); font-weight: bold;">02</i>
										</h3>
										<h5>
											전문가들에게 <b>실시간</b>으로 알려줌으로써 빠른 피드백이 옵니다.
										</h5></td>
								</tr>
								<tr><td><div style="height: 20px;"></div></td></tr>
								<tr>
									<td class="col-lg-4"><img src="img/choice2.png" alt="전문가찾기"
										style="margin-left: 100px" /></td>
									<td class="col-lg-8"><h3
											class="margin-top-0 color-dark-yellow-400">
											<i style="color: rgb(0, 200, 60); font-weight: bold;">03</i>
										</h3>
										<h5>
											<b>전문가</b>의 <b>프로필, 마감시간, 견적</b>등을 <br /> 고려하여 선택하세요.
										</h5></td>
								</tr>
								<tr><td><div style="height: 20px;"></div></td></tr>
								<tr>
									<td class="col-lg-4"><img src="img/pay2.png" alt="결제하기"
										style="margin-left: 100px" /></td>
									<td class="col-lg-8"><h3
											class="margin-top-0 color-dark-yellow-400">
											<i style="color: rgb(0, 200, 60); font-weight: bold;">04</i>
										</h3>
										<h5>
											<b>결제하기</b>를 완료하면 의뢰가 성공적으로 이루어집니다 .
										</h5></td>
								</tr>
								<tr><td><div style="height: 20px;"></div></td></tr>
								<tr>
									<td class="col-lg-4"><img src="img/star2.png" alt="평가하기"
										style="margin-left: 100px" /></td>
									<td class="col-lg-8"><h3
											class="margin-top-0 color-dark-yellow-400">
											<i style="color: rgb(0, 200, 60); font-weight: bold;">05</i>
										</h3>
										<h5>
											<b>전문가를 평가</b>해주세요.
										</h5></td>
								</tr>
							</table>
							<div style="min-height: 70px"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- 구매후기 -->
	<div style="background-color: white;">
	<div class="container" style="margin-top: 80px;">
	<div align="center" style="margin-bottom: 80px;"><span style="font-size: 13pt; font-weight: bold;">구매후기</span></div>
		<div class="slider1">
		
		  <div align="center">
			  <div class="slide">
				  <div style="height: 400px; width: 500px; text-align: center;">
				  	<div style="margin-top: 60px; width: 500px; height: 180px;">
					<span style="font-weight: bold;" >충성충성충성! 진짜 이분 번역은 대박이다, 그렇게 생각합니다. 어디 흠 잡을 데가 없이 바꿔주시네요. 우주의 기운을 모아 감사드립니다!!!</span>
				  	</div>
				  	
				  	<div style="margin-top: 5px;">
				  		<div class="rating">
							<span style="color:yellow; font-size: 15pt;">★</span>
							<span style="color:yellow; font-size: 15pt;">★</span>
							<span style="color:yellow; font-size: 15pt;">★</span>
							<span style="color:yellow; font-size: 15pt;">★</span>
							<span style="color:yellow; font-size: 15pt;">★</span>
							<div><span style="font-weight: bold; color:rgb(40, 40, 40);" >orgazon1</span></div>
							<div><span style="font-weight: bold;" >16.12.18</span></div>
						</div>
				  	</div>
				  	
				  	<div style="margin-top: 20px;" align="center">
				  		<img style="border-radius: 50px; height: 60px; width: 60px;" src="${ pageContext.request.contextPath }/img/test3.png"/>
				  	</div>
				  			  	
				  	
				  </div>
			  </div>
		  </div>
		  
		  <div align="center">
			  <div class="slide">
				  <div style="height: 400px; width: 500px;  text-align: center;">
				  	<div style="margin-top: 60px; width: 500px; height: 200px;">
					<span style="font-weight: bold;" >진짜 결과물 너무 맘에 들고 디자이너 님께서 정말 센스있으세요~~!!!
					학원 전단지 부탁 드렸는데 제가 수정 여러번 요구해도 다 들어주시고, 결과물도 정말 맘에 들어요!!!!♡♡♡♡♡♡추천 100개해주고 싶어요!! 
					가격도 저렴하고 일단 시안이 센스있습니다!! 디자이너님도 굉장히 빠르고 꼼꼼하세요 ㅎㅎ 정말 친절하시고 ㅠㅠㅠㅠ 
					다음에 다시 전단지 또 만들어야하는데 무조건 다시 이분한테 하고 싶네용 !!!정말 감사합니다 ㅎㅎ 맘에 쏙 들고 예뻐요 디자인감각 좋으신거 같아요ㅎㅎ!!!
					</span>
				  	</div>
				  	
				  	<div style="margin-top: 5px;">
				  		<div class="rating">
							<span style="font-size: 15pt;">★</span>
							<span style="color:yellow; font-size: 15pt;">★</span>
							<span style="color:yellow; font-size: 15pt;">★</span>
							<span style="color:yellow; font-size: 15pt;">★</span>
							<span style="color:yellow; font-size: 15pt;">★</span>
							<div><span style="font-weight: bold; color:rgb(40, 40, 40);" >ManagerSystemMaster</span></div>
							<div><span style="font-weight: bold;" >16.12.22</span></div>
						</div>
				  	</div>
				  	
				  	<div style="margin-top: 20px;" align="center">
				  		<img style="border-radius: 50px; height: 60px; width: 60px;" src="${ pageContext.request.contextPath }/img/test4.png"/>
				  	</div>
				  	
				  </div>
			  </div>
		  </div>
		  
		</div>
	</div>
	</div>

	<!-- 오시는길 -->
	<div style="background-color: rgb(240, 240, 240); margin-top: 30px;">
	<div class="container">
		<section class="main-section contact" id="contact">
			<div class="row">
				<div class="col-lg-6 col-sm-7 wow fadeInLeft">
					<div class="contact-info-box address clearfix">
						<h3>
							<i class="fa-pencil"></i>주소:
						</h3>
						<span>서울특별시 서초구 서초대로 74길 33 비트빌 4층 R43</span>
					</div>
					<div class="contact-info-box phone clearfix">
						<h3>
							<i class="fa-phone"></i>연락처:
						</h3>
						<span>TEL : 02-3486-3456 FAX : 02-3486-7890</span>
					</div>
					<div class="contact-info-box email clearfix">
						<h3>
							<i class="fa-pencil"></i>이메일:
						</h3>
						<span> HTTP://www.BITacademy.com</span>
					</div>
					<div class="contact-info-box hours clearfix">
						<h3>
							<i class="fa-clock-o"></i>운영시간:
						</h3>
						<span><strong>월요일 - 금요일:</strong> 9am - 22pm<br />
						<strong>토요일 - 일요일:</strong> 9am - 18pm</span>
					</div>
				</div>
				<div class="col-lg-6 col-sm-5 wow fadeInUp delay-05s">
					<div id="map" style="width: 100%; height: 350px;"></div>
					<br />
					<p>
						<button class="btn" onclick="panTo()">본사 위치 찾기</button>
					</p>
					<script type="text/javascript"
						src="//apis.daum.net/maps/maps3.js?apikey=2df2c1f65af583cfa3fa312c65e560ca"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new daum.maps.LatLng(37.494639176802124,
									127.0276116841608), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
						var map = new daum.maps.Map(mapContainer, mapOption);

						map.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC);

						var marker = new daum.maps.Marker({
							// 지도 중심좌표에 마커를 생성합니다 
							position : map.getCenter()
						});
						// 지도에 마커를 표시합니다
						marker.setMap(map);

						function panTo() {
							// 이동할 위도 경도 위치를 생성합니다 
							var moveLatLon = new daum.maps.LatLng(
									37.494639176802124, 127.0276116841608);

							// 지도 중심을 부드럽게 이동시킵니다
							// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
							map.panTo(moveLatLon);
						}
					</script>
				</div>
			</div>
		</section>
	</div>
	</div>

	<!-- Footer -->
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>