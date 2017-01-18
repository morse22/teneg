<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전문가 상세</title>

<style type="text/css">
/* 프로팅바 스타일 */
#topbar {
	position: absolute;
	border: 1px solid rgb(200, 200, 200);
	padding: 5px;
	background-color: white;
	width: 480px;
	z-index: 100;
}
</style>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/userProfile.css" />
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	/***********************************************
	 * Floating Top Bar script- ⓒ Dynamic Drive (www.dynamicdrive.com)
	 * Sliding routine by Roy Whittle (http://www.javascript-fx.com/)
	 * This notice must stay intact for legal use.
	 * Visit http://www.dynamicdrive.com/ for full source code
	 ***********************************************/

	var persistclose = 0; //set to 0 or 1. 1 means once the bar is manually closed, it will remain closed for browser session
	var startX = (window.innerWidth / 2 - (480/2)); //set x offset of bar in pixels
	var startY = 60; //set y offset of bar in pixels

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


	function onClickApproval(){
		if(confirm("정말 승인 하시겠습니까?")){
			location = "${pageContext.request.contextPath}/expert/approve.do/${expert.id}"
		}
	}
</script>
</head>
<body style="background-color: rgb(245, 245, 245);">
	<header>
		<div align="center">
			<div style="width:85%; margin-top: 1%;">	
				<jsp:include page="/include/header.jsp" />
			</div>
		</div>
	</header>
	
	<div style="position:fixed; top:300px; left:30px;">
		<a href="http://store.musinsa.com/app/" target="_blank"><img src="${ pageContext.request.contextPath }/img/ad3.png"/></a><br/>
		<a href="#"  style="text-decoration: none;">광고문의</a>
	</div>
	<div style="position:fixed; top:300px; left:87%;">
		<a href="http://www.bitacademy.com/" target="_blank"><img src="${ pageContext.request.contextPath }/img/ad2.png"/></a><br/>
		<a href="#" style="text-decoration: none;">광고문의</a>
	</div>
	
	<div align="center">
	<div align="center" style="margin-top: 200px; margin-bottom: 80px; width:40%;
	 background-color: white; padding: 80px 0px 80px 0px; border: 1px solid rgb(210, 210, 210);">
		<img style="margin-top: 50px; margin-bottom: 10px;" src="${ pageContext.request.contextPath }/expertFile/${ expert.titleImage}"/><br/>
		<span style=" margin-bottom: 50px; font-size: 16pt; color:rgb(40, 40, 40); font-weight: bold;">${ expert.title }</span><br/>
		<span style=" margin-bottom: 50px; font-size: 10pt; font-weight: bold;">${ expert.field }</span>
	</div>
	</div>
	
	<div align="center">
	<div style="margin-top: 50px; text-align: left; width: 40%;">
		<h4 style="color:rgb(70, 70, 70); font-weight: bold;">서비스 설명</h4>
	</div>
	</div>
	
	<div align="center">
		<div style="margin-bottom: 50px;width:40%; 
		background-color: white; padding-bottom: 80px; padding-top: 80px; border: 1px solid rgb(210, 210, 210); padding: 30px;">
			<div style="background-color: white; font-size: 10pt; color:rgb(70, 70, 70);">${ expert.content }</div>
			<img src="${ pageContext.request.contextPath }/expertFile/${expert.mainImage}"/>
		</div>
	</div>
	
	<div align="center">
	<div style="margin-top: 50px; text-align: left; width: 40%;">
		<h4 style="color:rgb(70, 70, 70); font-weight: bold;">A/S 및 환불</h4>
	</div>
	</div>
	
	<div align="center">
		<div style="margin-bottom: 50px;width:40%;
		 background-color: white;  padding: 40px 40px 40px 40px; border: 1px solid rgb(210, 210, 210);">
			<span style="font-size: 10pt; color:rgb(70, 70, 70);">작업이 당초 약정일자보다 지연되거나 그에 상응하는 사안이 발생했을 경우 협의에 따라 환불이 가능합니다.
파일전체를 넘겨드리면 환불이 불가능하오니 이 점 인지하여 주시기 바랍니다.</span>
		</div>
	</div>
	
	<div align="center">
	<div style="margin-top: 50px; text-align: left; width: 40%;">
		<h4 style="color:rgb(70, 70, 70); font-weight: bold;">서비스 평가</h4>
	</div>
	</div>
	
	<div align="center" style="margin-bottom: 50px;">
		<div class="rating">
			<span style="color:yellow; font-size: 25pt;">★</span>
			<span style="color:yellow; font-size: 25pt;">★</span>
			<span style="color:yellow; font-size: 25pt;">★</span>
			<span style="color:yellow; font-size: 25pt;">★</span>
			<span style="font-size: 25pt;">★</span><br/>
			<span style="font-weight: bold;">총381개의 평가</span>
		</div>
	</div>
	
	<div align="center">
		<div style="margin-bottom: 50px; width:40%;
		 background-color: white;  padding: 30px 30px 30px 30px; border: 1px solid rgb(210, 210, 210);">
			<c:forEach var="review" items="${ reviewList }" varStatus="status">
				<div style="text-align: left;">
					<div style="float:left;">
						<img style="height: 80px; width: 80px;"src="${ pageContext.request.contextPath }/img/test3.png"/>
					</div>
					<div style="float:left; margin-left: 5%;" >
						<span style="font-size: 10pt; color:rgb(70, 70, 70); font-weight: bold;">${review.writer }</span>
						<span style="font-size: 10pt; color:rgb(70, 70, 70); font-weight: bold;">${review.content}</span><br/>
						<span style="font-size: 8pt;  font-weight: bold;">${review.regDate }</span>
					</div>
					<div style="float:right;">
						<br/><br/><br/>
						<span style="color:rgb(240, 210, 0);">★★★★★</span>
					</div>
					<div style="clear:both;"></div>
				</div>
				<c:if test="${ status.count ne reviewList.size() }"><hr/></c:if>
			</c:forEach>
			<c:if test="${ empty reviewList }">
				<div><img src="${ pageContext.request.contextPath }/img/noreview.png" /></div>
			</c:if>
		</div>
	</div>
	
	<div align="center" style="margin-bottom: 50px;">
		<c:if test="${ expert.approval eq 'N' and loginUser.memberGrade eq 'teneg'}">
			<button class="btn" onclick="onClickApproval()">등록승인</button>
		</c:if>
		<c:if test="${ expert.approval eq 'Y' and loginUser.memberGrade ne 'teneg'}">
			<button class="btn" onclick="#">전문가에게 의뢰하기</button>
		</c:if>
	</div>
	
			<div style="position:fixed; top:300px; left:70%; width:1000px;">
			<div class="col-md-4 col-sm-6 hero-feature">
				<div class="thumbnail">
					<!-- 	<img src="http://placehold.it/800x500" alt="">  이거있던자리 ㅎ;-->
					<div class="gig-price">
						<div class="caption">
							<h3>전문가 프로필</h3>

							<!-- ------------------------------------------------------  -->
							<!-- 프로필  -->
							<div class="container">
								<div class="row">
									<div class="col-lg-3 col-sm-6">

										<div class="card hovercard">
											<div class="cardheader"></div>
											<div class="avatar">
												<a href="#"><img
													style="height: 300px; width: 250px;"
													src="${ pageContext.request.contextPath }/img/test3.png"
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
	<div id="topbar">
		<nav>
			<div class="container-fluid">
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="#section1">서비스 설명</a></li>
						<li><a href="#section2">가격정보 </a></li>
						<li><a href="#section3">A/S및 환불</a></li>
						<li><a href="#section4">서비스평가</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>