<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.theme.min.css" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
* {
	margin-left: auto;
	margin-right: auto;
}

section {
	margin-top: 150px;
	/* 	margin-left: 20%; */
}

.chargeList {
	width: 700px;
	height: 600px;
}
.eggMain{
	width: 700px;
	height: 200px;
}
.rightAlign{
	text-align: right;
	padding-right: 15px;
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
	<section>
		<div class="eggMain">
			
		</div>
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
	</section>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>