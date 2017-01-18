<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전문가 등록</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<!-- 이거있어야 메뉴됨 -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
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
	
	<div align="center" style="min-height: 700px;">
		<section style="margin-top: 180px; margin-bottom: 110px; width: 60%;" >
		<p style="font-size: 13pt; text-align: left;">등록된 전문가</p><br/>
			<table class="table" border="1">
				<tr>
					<th width="5%"></th>
					<th width="5%" style="text-align: center;">분야</th>
					<th width="10%" style="text-align: center;">ID</th>
					<th width="20%" style="text-align: center;">제목</th>
					<th width="10%" style="text-align: center;">등록일</th>
				</tr>
				<c:forEach var="expert" items="${ list }">
					<tr>
						<td><img style="height: 70px; width: 140px;"src="${ pageContext.request.contextPath }/expertFile/${expert.titleImage}"/></td>
						<td style="text-align: center; vertical-align: middle;">${ expert.field }</td>
						<td style="text-align: center; vertical-align: middle;">${ expert.id }</td>
						<td style="text-align: center; vertical-align: middle;"><a href="${ pageContext.request.contextPath }/expert/detail.do/${ expert.id }">${ expert.title }</a></td>
						<td style="text-align: center; vertical-align: middle;">${ expert.regDate }</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${ list.size() eq 0 }" >
				<h2 style="color:rgb(150, 150, 150);">등록된 전문가가 존재하지 않습니다.</h2>
			</c:if>
		</section><br/>
	</div>
	
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>