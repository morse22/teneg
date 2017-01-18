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
	function onClickComplete(requestNo){
 		var popUrl = "${pageContext.request.contextPath}/popup/doDComplete.do?requestNo=" + requestNo;
		var popOption = "width=470, height=190, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
		window.open(popUrl, "", popOption);
	}
	
	function updateProgress(requestNo){
 		var popUrl = "${pageContext.request.contextPath}/popup/updateProgress.do?requestNo=" + requestNo;
		var popOption = "width=470, height=200, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
		window.open(popUrl, "", popOption);
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
	<div align="center" style="min-height: 600px; margin-top: 100px;">
		<div style="width:50%;">
		<div align="left">
			<span style="color:red; font-size:8pt; font-weight:bold;">*상태가 'U'일 때 완료 버튼을 누른 후 최종파일을 점부하게 되면 완료상태 'S'로 전환됩니다.</span>
		</div><br/>
		<table class="table" id="listTable" border="1">
			<tr>
				<th width="10%" style="text-align: center; color:black;">요청번호</th>
				<th width="15%" style="text-align: center; color:black; ">담당전문가</th>
				<th width="8%" style="text-align: center; color:black; ">상태</th>
				<th width="8%" style="text-align: center; color:black; ">등록일</th>
				<th width="8%" style="text-align: center; color:black; ">진행률</th>
				<th width="8%" style="text-align: center; color:black; ">완료일</th>
			</tr>				
			<!-- 일반게시물 출력 -->
			<c:forEach var="response" items="${ response }" varStatus="cnum">
				<tr>							
					<td style="text-align: center;">
						<a href="${ pageContext.request.contextPath }/request/detail.do?no=${response.requestNo}&id=${loginUser.id}">
							<c:out value="${ response.requestNo }"/>
						</a>
					</td>
					<td style="text-align: center;"><c:out value="${ response.expertId}"/></td>
					<td style="text-align: center;">
						<c:if test="${ response.status eq 'U'}">
							<span style="color:red; font-weight: bold;">
								<c:out value="${ response.status}"/>
							</span>	
							<button onclick="onClickComplete(${response.requestNo})">완료</button>
						</c:if>
						<c:if test="${ response.status eq 'S'}">
							<span style="color:blue; font-weight: bold;">
								<c:out value="${ response.status}"/>
							</span>	
						</c:if>
					</td>
					<td style="text-align: center;"><c:out value="${ response.regDate}"/></td>						
					<td style="text-align: center;">
						<c:if test="${ response.status eq 'U'}">
							<span style="color:red; font-weight: bold;">
								<c:out value="${ response.progress }%"/>
							</span><button onclick="updateProgress(${response.requestNo})">수정</button>
						</c:if>
						<c:if test="${ response.status eq 'S'}">
							<span style="color:blue; font-weight: bold;">
								<c:out value="${ response.progress }%"/>
							</span>
						</c:if>
					</td>
					<td style="text-align: center;">
						<c:if test="${ response.status eq 'S'}">
							${ response.completeDate }
						</c:if>
						<c:if test="${ response.status eq 'U'}">
							<span style="color:red; font-weight: bold;">미완료</span>
						</c:if>
					</td>						
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




