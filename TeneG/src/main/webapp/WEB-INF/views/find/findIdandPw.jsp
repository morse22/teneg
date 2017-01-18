<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<title>아이디 비밀번호 찾기</title>
<script>
	function onClickCancel(){
		window.close();
	}
	
	function onClickSearchId(){
        var name = $('#name').val();
        var email = $("#email").val();
/*         if(id.trim() == ""){
               $('#id_eq').html('아이디를 입력하세요')
               $('#id_eq').css("color", "red");
        	return;
        } */
        $.ajax({
           type : "post",
           url : "${ pageContext.request.contextPath}/member/findId.do",
           data : {
              "name" : name,
              "email" : email
           }, //아이디 체크
           success : function(data) {
              if (data == "") {
                 $('#searchIdSpan').html('일치하는 정보가 없습니다.');
                 $('#searchIdSpan').css("color", "red");
              } else {
                 $('#searchIdSpan').html("ID : " + data);
                 $('#searchIdSpan').css("color", "green");
              }
           },
        });
	}
	
	function onClickSearchPw(){
        var id = $('#id').val();
        var phone = $("#phone").val();
/*         if(id.trim() == ""){
               $('#id_eq').html('아이디를 입력하세요')
               $('#id_eq').css("color", "red");
        	return;
        } */
        $.ajax({
           type : "post",
           url : "${ pageContext.request.contextPath}/member/findPw.do",
           data : {
              "id" : id,
              "phone" : phone
           }, //아이디 체크
           success : function(data) {
              if (data == "") {
                 $('#searchPwSpan').html('일치하는 정보가 없습니다.');
                 $('#searchPwSpan').css("color", "red");
              } else {
				location="${ pageContext.request.contextPath}/popup/certification.do/" + id;
              }
           },
        });
	}
</script>
</head>
<body style="background-repeat: no-repeat; background-position:115px 205px; background-image: url('${pageContext.request.contextPath}/img/footerlogo3.png'); background-size: 250px 200px;">
	<div style="margin-top:20px; margin-left:20px; border: 1px solid rgb(210, 210, 210); border-bottom: 1px none red;
	padding:5px 20px 5px 20px; height: 280px; width: 425px; background-color: rgba(240, 240, 240, 0.85);">
		<h4>아이디 찾기</h4>
		<div class="form-group">
			<label class="col-sm-1 control-label" for="name">이름</label>
			<div class="col-sm-3">
				<input type="text" id="name" name="name" class="form-control" 
				placeholder="이름을 입력하세요" maxlength="10" autofocus required/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label" for="name">이메일</label>
			<div class="col-sm-3">
				<input type="text" id="email" name="email" class="form-control" 
				placeholder="이메일을 입력하세요" required/>
			</div>
		</div>
		<span id="searchIdSpan"></span>
		<div align="center">
			<button class="btn" onclick="onClickSearchId()">확인</button>
			<button class="btn" onclick="onClickCancel()">취소</button>
		</div>
	</div>
	<div style="margin-left:20px; border: 1px solid rgb(210, 210, 210); border-top: 1px solid rgb(220, 220, 220);
	padding:5px 20px 5px 20px; height: 280px; width: 425px; background-color: rgba(240, 240, 240, 0.85);">
		<h4>비밀번호 찾기</h4>
		<div class="form-group">
			<label class="col-sm-1 control-label" for="id">아이디</label>
			<div class="col-sm-3">
				<input type="text" id="id" name="id" class="form-control" 
				placeholder="아이디를 입력하세요" maxlength="10" autofocus required/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 control-label" for="phone">전화번호</label>
			<div class="col-sm-3">
				<input type="text" id="phone" name="phone" class="form-control" 
				placeholder="전화번호를 입력하세요" required/>
			</div>
		</div>
		<span id="searchPwSpan"></span>
		<div align="center">
			<button class="btn" onclick="onClickSearchPw()">확인</button>
			<button class="btn" onclick="onClickCancel()">취소</button>
		</div>
	</div>
</body>
</html>