<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<script>
	function heloPopup(){
		var popUrl = "${pageContext.request.contextPath}/popup/findIdandPw.do";
		var popOption = "width=470, height=600, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 	
		window.open(popUrl, "", popOption);
	}
	
	$(document).ready(function(){
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var userInputId = getCookie("userInputId");
	    $("input[name='id']").val(userInputId);  

	    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	        $("#password").focus();
	    }else $("#id").focus();

	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });

	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	    
		// 인풋폼 색 변경
	    $("input").focus(function(){
	        $(this).css("background-color", "#ADD8E6");
	    });
	    $("input").blur(function(){
	        $(this).css("background-color", "#ffffff");
	    });
	});
	
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}

	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	function check(){
        var id = $('#id').val();
        var password = $("#password").val();
        
        $.ajax({
           type : "post",
           url : "${ pageContext.request.contextPath}/member/checkLogin.do",
           data : {
              "id" : id,
              "password" : password
           },
           
           success : function(data){
              if (data == "") {
            	 $('#id').val(""); $("#password").val("");
                 $('#errorSpan').html('*일치하는 정보가 없습니다.');
                 $('#errorSpan2').html(' 정보를 찾을 수 없을 시 관리자에게 문의하세요');
                 $("#faq").html("문의하기");
              } else {
            	 $("#lForm").submit();
              }
           },
        });
	}
	
</script>
<style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    #login-form > div {
        margin: 15px 0;
    }
</style>
</head>
<body>
	<header>
		<div align="center">
			<div style="width:85%; margin-top: 1%;">	
				<jsp:include page="/include/header.jsp" />
			</div>
		</div>
	</header>
	
	<section style="min-height: 500px; margin-top: 100px;">
	<div class="container">
	    <div class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2">
	        <div class="panel panel-success">
				<div class="panel-heading" style="background-color: white;">
		            <div class="panel-title">
		            	<img src="${ pageContext.request.contextPath }/img/footerlogo3.png"/>
		            </div>
		        </div>
				<div class="panel-body">
					<form name="login-form" method="post" id="lForm" action="${pageContext.request.contextPath }/member/login.do">
						<div>
			                <input type="text" class="form-control" id="id" name="id" placeholder="ID"/>
			            </div>
			            <div style="margin-top: 10px;">
			                <input type="password" class="form-control" id="password" name="password" placeholder="Password"/>
			            </div>
			            <div style="float:right;">
				           <input type="checkbox" id="idSaveCheck"/> 아이디 저장
				        </div>
			            <div style="margin-top: 30px;">
				            <div style="float:left;">
				           	 	<a href="javascript:heloPopup();">아이디/비밀번호 찾기</a>
				            </div>
				            <div style="float:right;">
				            	<a href="${pageContext.request.contextPath}/member/singinAgree.do">무료회원가입</a>
				            </div>
			            </div><div style="clear:both;"></div><br/>
			            <div>
			           		<span id="errorSpan" style="color:red;"></span><br/>
			           		<span id="errorSpan2" style="color:red; font-size: 8pt;"></span>
			           		<a href="${ pageContext.request.contextPath }/qna/QnAList.do" style="font-size: 8pt;" id="faq"></a>
			           		<br/>
			            </div>
			            <div style="margin-top: 30px;">
			                <button type="button" class="form-control btn btn-primary" onclick="check()">로그인</button>
			            </div>
					</form>
				</div>
			</div>
		</div>
    </div>
	</section>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>
