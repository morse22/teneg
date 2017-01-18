<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요청리스트</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
	function onChangeType(){
		location="${ pageContext.request.contextPath }/request/list.do/" + $("#selectField option:selected").val() + "/" + $("#selectStatus option:selected").val();
	}
	
	$(document).ready(function(){
		$("#selectField").val("${field}");
		$("#selectStatus").val("${status}");	
	});
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
		<div style="width: 50%;">
			<div align="left">
				종류
				<select id="selectField" onchange="onChangeType()">
					<option value="all">전체</option>
					<option value="c">C</option>
					<option value="cpp">C++</option>
					<option value="java">JAVA</option>
					<option value="php">PHP</option>
					<option value="python">PYTHON</option>
				</select> 진행상태
				<select id="selectStatus" onchange="onChangeType()">
					<option value="all">전체</option>
					<option value="D">대기중</option>
					<option value="P">진행중</option>
					<option value="DC">완료대기</option>
					<option value="C">완료</option>
				</select>
			</div>
		</div>
		<div style="width:50%; min-height: 600px;">
			<c:if test="${ request.size() eq 0 }">
				<div style="margin-top: 100px;">
					<img src="${ pageContext.request.contextPath }/img/물음표.PNG"/><br/>
					<span style="color:red; font-weight:bold; font-size:8pt">조건에 해당하는 의뢰정보가 존재하지 않습니다.</span>
				</div>
			</c:if>
			<c:if test="${ request.size() ne 0 }">
			<table class="table" id="listTable">
				<tr>
					<th width="3%" style="text-align: center; color:black;">타입</th>
					<th width="3%" style="text-align: center; color:black;">의뢰번호</th>
					<th width="5%" style="text-align: center; color:black;">의뢰자</th>
					<th width="20%" style="text-align: center; color:black;">제목</th>
					<th width="3%" style="text-align: center; color:black;">진행상태</th>
					<th width="3%" style="text-align: center; color:black;">등록일</th>
				</tr>				
				<!-- 일반게시물 출력 -->
				<c:forEach var="request" items="${ request }" varStatus="cnum">
					<tr>
						<td style="text-align: center;" >
							<c:if test="${ request.field eq 'c' }">
								<img src="${ pageContext.request.contextPath }/img/c.png" style="height: 30px; width: 30px;" class="img1" />
							</c:if>
							<c:if test="${ request.field eq 'java' }">
								<img src="${ pageContext.request.contextPath }/img/java.png" style="height: 30px; width: 30px;"class="img1" />
							</c:if>
							<c:if test="${ request.field eq 'python' }">
								<img src="${ pageContext.request.contextPath }/img/python.png" style="height: 30px; width: 30px;" class="img1" />
							</c:if>
							<c:if test="${ request.field eq 'cpp' }">
								<img src="${ pageContext.request.contextPath }/img/cplusplus.png" style="height: 30px; width: 30px;" class="img1" />
							</c:if>
							<c:if test="${ request.field eq 'php' }">
								<img src="${ pageContext.request.contextPath }/img/php.png" style="height: 30px; width: 30px;" class="img1" />
							</c:if>	
						</td>
						<td style="text-align: center; color:black;" ><c:out value="${ request.no }"/></td>
						<td style="text-align: center; color:black;" ><c:out value="${ request.id }"/></td>
						<td style="text-align: center;">
							<a href="${ pageContext.request.contextPath }/request/detail.do?no=${request.no}&id=${loginUser.id}">
								<c:out value="${ request.title }"/>
							</a>
						</td>
						<td style="text-align: center;">
							<c:choose>
								<c:when test="${ request.status eq 'D'}">
									<span style="color:green; font-weight: bold;">대기중</span>
								</c:when>
								<c:when test="${ request.status eq 'P'}">
									<span style="color:red; font-weight: bold;">진행중</span>
								</c:when>
								<c:when test="${ request.status eq 'DC'}">
									<span style="color:pink; font-weight: bold;">완료대기</span>
								</c:when>
								<c:when test="${ request.status eq 'C'}">
									<span style="color:blue; font-weight: bold;">완료</span>
								</c:when>
								<c:when test="${ request.status eq 'RR'}">
									<span style="color:red; font-weight: bold;">환불불가</span>
								</c:when>
								<c:when test="${ request.status eq 'RP'}">
									<span style="color:rgb(255, 127, 40); font-weight: bold;">환불진행</span>
								</c:when>
								<c:when test="${ request.status eq 'RC'}">
									<span style="color:blue; font-weight: bold;">환불완료</span>
								</c:when>
								<c:when test="${ request.status eq 'AUC'}">
									<span style="color:rgb(163, 60, 170); font-weight: bold;">경매중</span>
								</c:when>
							</c:choose>
						</td>
						<td style="text-align: center; color:black;"><c:out value="${ request.regDate}"/></td>
					</tr>
				</c:forEach>	
			</table>
			</c:if>
		</div>
		</div>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</head>
</html>




