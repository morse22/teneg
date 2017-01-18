<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<form method="post" action="${pageContext.request.contextPath}/member/findId">
		ID찾기 페이지입니다.<br/>
		핸드폰 번호를 입력하세요. <input type="text" name="phone" id="phone" > <br/>
		이메일을 입력하세요. <input type="email" name="email" id="email" > <br/>
		<input type="submit" value="제출">
	</form>
	</section>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>