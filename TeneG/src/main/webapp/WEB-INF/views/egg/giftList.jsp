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
	margin-left: 25%;
	min-height: 700px;
}

li {
	font-size: 12px;
}

table * { text-align: center; }
</style>
<script >
		$(document).ready(function(){
			$("#sort").val("${sort}");
		});
		
		function sort(data){
			
			location="${ pageContext.request.contextPath }/egg/giftList.do/${loginUser.id}/"+data.value ;
		}
</script>
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
		<div style="width: 930px; height: 300px; border: 1px solid black;">
			<div>
				<select id="sort" onchange="sort(this)">
					<option value="all" selected >전체보기</option>
					<option value="send" >보낸 선물</option>
					<option value="receive">받은 선물</option>
				</select>
			</div>
			<br/>
			<table style=" width: 80%; margin-top: 10px;">
				<tr>
					<th style="width:15%; text-align: center; color:rgb(34, 34, 34); background :rgb(240, 240, 240); "> send/receive </th>
					<th style="width:15%; text-align: center; color:rgb(34, 34, 34); background :rgb(240, 240, 240); "> Egg </th>
					<th style="width:25%; text-align: center; color:rgb(34, 34, 34); background :rgb(240, 240, 240); "> 도착 시간 </th>
					<th style="width:45%; text-align: center; color:rgb(34, 34, 34); background :rgb(240, 240, 240); "> 메세지 </th>
				</tr>	
				<c:forEach var="gift" items="${list }">
					<tr>
						<c:choose>
							<c:when test="${ gift.sender eq loginUser.id  }">
								<td id="send"> ${gift.receiver } </td>
							</c:when>
							<c:otherwise>
								<td>${gift.sender }</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${ gift.sender eq loginUser.id  }">
								<td style="color: red; "> - ${gift.egg }</td>
							</c:when>
							<c:otherwise>
								<td style="color: blue;"> + ${gift.egg }</td>
							</c:otherwise>
						</c:choose>
						<td>${gift.regDate }</td>
						<td>${gift.title }</td>
						
					</tr>
				</c:forEach>
									
			</table>
		</div>
	</section>
	<footer style="clear: left">
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>