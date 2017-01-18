<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<title>비밀번호 변경</title>
<script>
	function cancel(){
		window.close();
	}
	
	function ok(){
		$.ajax({
           type : "post",
           url : "${ pageContext.request.contextPath}/member/changePw.do",
           data : {
              "password" : $("#password").val(),
              "id" : "${id}"
           },
           success : function(data) {
				alert("비밀번호가 정상적으로 변경 되었습니다.");
				window.close();
           },
        });
	}
	
	function pwCheck(){
		if($("#password").val() != $("#passwordConfirm").val())
			$("#passwordCheck").html("*비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		else $("#passwordCheck").html("");
	}
</script>
</head>
<body>
	<div style="border: 1px solid rgb(200, 200, 200); margin-top:20px; margin-left:20px;
	padding:5px 20px 5px 20px; height: 280px; width: 425px; background-color: rgb(240, 240, 240);">
		<h4>비밀번호 변경</h4>
		<div class="form-group">
			<label class="col-sm-1 control-label" for="password">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" id="password" name="password" class="form-control" 
				placeholder="비밀번호를 입력하세요" maxlength="10" autofocus required/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label" for="passwordConfirm">비밀번호 확인</label>
			<div class="col-sm-3">
				<input type="password" id="passwordConfirm" name="passwordConfirm" class="form-control" 
				placeholder="비밀번호를 다시 입력하세요" required onkeyup="pwCheck()"/>
			</div>
		</div>
		<span style="color:red;" id="passwordCheck"></span>
		<div align="center" style="margin-top: 15px;">
			<button class="btn" onclick="ok()">확인</button>
			<button class="btn" onclick="cancel()">취소</button>
		</div>
	</div>
</body>
</html>