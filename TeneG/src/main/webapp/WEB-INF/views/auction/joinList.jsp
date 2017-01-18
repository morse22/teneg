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
<script type="text/javascript">
	function choice(data){
		
		location.href="${ pageContext.request.contextPath }/auction/"+${join.no} +"/joinList.do/"+${join.requestNo};
		
	}
</script>
<style>
* {
	margin-left: auto;
	margin-right: auto;
}

section {
	margin-top: 150px;
	/* 	margin-left: 25%; */
}

.auction {
	width: 800px;
	min-height: 700px;
	/* background-color: #c1c1c1; */
}

li {
	font-size: 12px;
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
		<div class="auction">
			<table style="width: 70%" >
				<tr>
					<th width="25%" style="text-align: center;">경매참여자</th>
					<th width="20%" style="text-align: center;">가격</th>
					<th width="25%" style="text-align: center;">참여한 시간</th>
					<th width="20%" style="text-align: center;">선택여부</th>
					<th width="10%"></th>
				</tr>
				<c:forEach var="join" items="${joinList}" varStatus="loop" >
					<tr>
						<td style="text-align: center;">${join.id }</td>
						<td style="text-align: center;">${join.price }</td>
						<td style="text-align: center;">${join.auctionDate }</td>
						<c:if test="${join.type eq 'stanby'}">
							<td style="color: red; text-align: center;">N</td>
						</c:if>
						<c:if test="${join.type eq 'selected' }">
							<td style="color: blue; text-align: center;">Y</td>
						</c:if>
						<c:if test="${join.type eq 'stanby'}">
						<td><input type="button" value="선택" class="btn" onclick="location.href='${ pageContext.request.contextPath }/auction/${join.no}/${join.auctionDate}/joinList.do/${join.requestNo}'" ></td>
						</c:if>						
						<c:if test="${join.type eq 'selected'}">
						<td><input type="button" value="확정" class="btn" onclick="location.href='${ pageContext.request.contextPath }/auction/${join.no}/${join.auctionDate}/joinList.do/${join.requestNo}'" ></td>
						</c:if>						
						
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