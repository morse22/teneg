<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function doAction(type) {
		switch(type) {
		case "D" : 
			if(confirm("삭제하시겠습니까?")) { location.href="memberDelete.do?id=${loginUser.id}"; }
			break;
		}
	}
</script>
</head>
<body>
	<header>
		<div align="center">
			<div style="width:85%; margin-top: 1%;">	
				<jsp:include page="/include/header.jsp" />
			</div>
		</div>
	</header>
	<div align="center" style="margin-top: 50px;">
		<div>
			<img src="${ pageContext.request.contextPath }/img/banner.png"/>
		</div>
	</div>
	<section>
	<hr width="100%">  <h2>회원 상세</h2>  <hr width="100%" /><br/>
	<table width="80%" border="1">
		<tr>
			<th>ID</th>					<td>${ loginUser.id }</td>
		</tr><tr>
			<th>이름</th>		<td><c:out value="${ loginUser.name }" /></td>
		</tr><tr>
			<th>가입일자</th>		<td><c:out value="${ loginUser.regDate }" /></td>
		</tr><tr>
			<th>핸드폰</th>	<td>${ loginUser.phone }</td>
		</tr><tr>
			<th>주소</th>	<td>${ loginUser.addr }</td>
		</tr><tr>
			<th>E-mail</th>	<td>${ loginUser.email }</td>
		</tr><tr>
			<th>회원등급</th>	<td>${ loginUser.memberGrade }</td>
		</tr><tr>
			<th>egg</th>	<td>${ loginUser.egg }</td>
		</tr><tr>
			<th>회원점수</th>	<td>${ loginUser.memberScore }</td>
		</tr><tr>
			<th>생일</th>	<td>${ loginUser.birth }</td>
		</tr><tr>
			<th>성별</th>	<td>${ loginUser.sex }</td>
		</tr><tr>
			<th>자기소개</th>	<td>${ loginUser.introduce }</td>
		</tr><tr>
			<th>핸드폰수신</th>	<td>${ loginUser.phoneAlarm }</td>
		</tr><tr>
			<th>전문가</th>	<td>${ loginUser.expert }</td>
		</tr>
	</table><br/><br/>
	<input type="button" value="회원 추방" onclick="doAction('D')" />
	<input type="button" value="뒤로가기" onclick="javascript:history.go(-1)" >
	</section>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>