<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요청리스트</title>

<!-- 이거있어야 메뉴됨 -->
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.theme.min.css" />
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script>
function btnClick(){
	alert("거절");
}

function onClickOk(requestNo, expertId){
	if(confirm("수락하시면 다른 전무가와 매칭할 수 없습니다. 정말로 수락 하시겠습니까?")) 
		location ="${ pageContext.request.contextPath}/requestwaiting/accept.do?requestNo=" + requestNo + "&expertId=" + expertId + "&id=${loginUser.id}";		
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
	<div align="center" style="min-height: 700px; margin-top: 100px;">
	<div style="width:50%;">
		<c:if test="${ empty requestwaiting}">
			<img src="${ pageContext.request.contextPath }/img/물음표.PNG" class="img1" /><br/>
			<span style="color:red; font-weight: bold; font-size: 11pt;">요청한 전문가가 없습니다.</span>
		</c:if>
		<c:if test="${ not empty requestwaiting}">
			<table class="table" id="listTable" border="1">
				<tr>
					<th width="3%" style="text-align: center; ">번호</th>
					<th width="5%" style="text-align: center; ">전문가</th>
					<th width="5%" style="text-align: center; ">마감율</th>
					<th width="5%" style="text-align: center; ">평점</th>
					<th width="10%" style="text-align: center; ">요청일</th>
					<th width="5%" style="text-align: center; ">선택</th>
				</tr>				
				<c:forEach var="requestwaiting" items="${ requestwaiting }" varStatus="cnum">
					<c:if test="${ not empty requestwaiting.expertId }">
						<tr>	
							<td style="text-align: center;"><c:out value="${ requestwaiting.requestNo }"/></td>
							<td style="text-align: center;"><a href="${ pageContext.request.contextPath }/expert/detail.do/${ requestwaiting.expertId }"><c:out value="${ requestwaiting.expertId }"/></a></td>
							<td style="text-align: center;"><c:out value="10%"/></td>
							<td style="text-align: center;"><span>★★★★★</span></td>
							<td style="text-align: center;"><c:out value="${ requestwaiting.regDate}"/></td>
							<td style="text-align: center;">
							<button onclick="onClickOk('${requestwaiting.requestNo}', '${ requestwaiting.expertId}')">수락</button>
							<button onclick="btnClick()">거절</button>						
							</td>
						</tr>
					</c:if>
				</c:forEach>	
			</table>
		</c:if>
		</div>
		<div>
	</div>
	</div>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</head>
</html>




