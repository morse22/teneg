<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<title>인증번호</title>
<script>
	var min = 2;
	var sec = 0;
	function onClickCancel(){
		window.close();
	}
	
	function ok(){
		location="${pageContext.request.contextPath}/popup/changePw.do/${id}";
	}
	
	$("document").ready(function(){
		setInterval(() => {
			if(min == 0 && sec == 0) window.close();
			if(--sec < 0){
				--min;
				sec = 59;
			}
			$("#timer").html("0" + min + " : " + ((sec/10 < 1) ? ("0" + sec) : sec));
			//$("#timer").html("0" + min + " : ");
		}, 1000);
	});
</script>
</head>
<body>
	<div style="border: 1px solid rgb(200, 200, 200); margin-top:20px; margin-left:20px;
	padding:5px 20px 5px 20px; height: 290px; width: 425px; background-color: rgb(240, 240, 240);">
		<div align="center">
			<h1 style="color:red;">인증번호</h1>
			<h1 id="timer">02 : 00	</h1>
			<input type="text" maxlength="4" style="height: 50px; width:100px; font-size: 30pt; "/><br/><br/>
			<button class="btn" onclick="ok()">확인</button>
			<button class="btn" onclick="onClickCancel()">취소</button><br/><br/>
			<span style="color:red; font-size: 8pt;">*시간안에 인증번호를 입력하지 않으면 자동취소 됩니다.</span>
		</div>
	</div>
</body>
</html>