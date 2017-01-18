<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환불대기</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
	function refundDetail(requestNo){
 		var popUrl = "${ pageContext.request.contextPath }/refund/detail.do/" + requestNo;
		var popOption = "width=480, height=480, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
		
		window.open(popUrl, "", popOption);
		return false;
	}
</script>
<body>
	<header>
		<div align="center">
			<div style="width:85%; margin-top: 1%;">	
				<jsp:include page="/include/header.jsp" />
			</div>
		</div>
	</header>
		<div align="center" style="margin-top: 100px;">
			<div style="width: 50%; min-height: 600px;">
				<table class="table">
					<tr>
						<th style="text-align: center;">의뢰번호</th>
						<th style="text-align: center;">사유</th>
						<th style="text-align: center;">의뢰인</th>
						<th style="text-align: center;">담당전문가</th>
						<th style="text-align: center;">등록일</th>
						<th style="text-align: center;">결과파일</th>
					</tr>
					<c:forEach var="refund" items="${ list }">
						<tr>
							<td style="text-align: center;"><a href="${ pageContext.request.contextPath }/request/detail.do?no=${ refund.requestNo }&id=${loginUser.id}">${ refund.requestNo }</a></td>
							<td style="text-align: center;"><a href="#" onclick="refundDetail('${refund.requestNo}')">${ refund.title }</a></td>
							<td style="text-align: center;">${ refund.writer }</td>
							<td style="text-align: center;">${ refund.expertId }</td>
							<td style="text-align: center;">${ refund.regDate }</td>
							<td style="text-align: center; color:red">미첨부</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</head>
</html>




