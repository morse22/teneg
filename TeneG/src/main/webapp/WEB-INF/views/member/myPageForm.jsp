<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Sign Up</title>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath }/css/SignUp/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/SignUp/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/SignUp/style.css" media="screen" title="no title" charset="utf-8">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Sign-Up</title>
<script>
//http://webskills.kr/archives/310		-> 인풋 필드에 숫자만 입력받기.
	// http://webskills.kr/archives/310		-> 인풋 필드에 숫자만 입력받기.
// http://sewoni31.tistory.com/5		-> keyCode 목록
// http://htglss.tistory.com/41			-> ime-mode
// 8 : back space
// 9 : tab
// 18 : alt
// 32 : space bar
// 37 : ←
// 39 : →
// 46 : delete
// 188 : <
// 189 : -
// 229 : 한글 입력

// 정규 표현식
// ^0-9 : 숫자를 제외한 모든 문자.
// g : 문자열 내의 모든 패턴을 찾음.
// i : 문자열의 대소문자를 구분하지 않음.

	function onlyNumber(event){	// 숫자만 입력가능.
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) 
				|| keyID == 8 || keyID == 9 ||  keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	
	function removeChar(event) { // 숫자만 받음, 숫자가 아니면 다 지움.
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}

// 	ID 정규표현식
	function idExp(event){	// 숫자, 영어만 입력 가능.
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 65 && keyID <= 90) || (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) 
				|| keyID == 8 || keyID == 9 ||  keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	
// 	E-mail 정규 표현식
	function emailExp(event){	// 숫자, 영어, . 입력 가능.
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 65 && keyID <= 90) || (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) 
				|| keyID == 8 || keyID == 9 ||  keyID == 46 || keyID == 37 || keyID == 39 || keyID == 190 ) 
			return;
		else
			return false;
	}
	
// 	PW 예외처리
	function pwException(event) { // 숫자, 영어(대소문자) 아니면 다 지움.
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		event.target.value = event.target.value.replace(/[^0-9a-z`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi, "");
	}

// 	ID 예외처리
	function removeSpecial(event) { // 숫자, 영어(대소문자) 아니면 다 지움.
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9a-z]/gi, "");
	}
	
// 	addr 정규표현식
	function idAddr(event){	// addr 관련된 특수문자까지 모두 가능.
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 65 && keyID <= 90) || (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) 
				|| keyID == 8 || keyID == 9 || keyID == 18 || keyID == 32 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 188 || keyID == 189 || keyID == 229 ) 
			return;
		else
			return false;
	}
	
	function onlyChar(event){	// 영어, 한글만 입력 받음.
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 65 && keyID <= 90) 
				|| keyID == 8 || keyID == 9 ||  keyID == 46 || keyID == 37 || keyID == 39 || keyID == 229 ) 
			return;
		else
			return false;
	}
	
	function goCheck() {
		var m = document.mForm;
		if (m.id.value == '') {
			alert('ID를 입력하세요');
			m.id.focus();
			return false;
		}
// 		if (check == false) {
// 			alert('ID 중복체크를 확인하세요');
// 			m.id.focus();
// 			return false;
// 		}
		if (m.password.value != m.password_check.value) {
			alert('PW를 확인하세요.');
			m.password.focus();
			return false;
		}
		return true;
	}
	
	function doAction(type) {
		switch(type) {
			case "W" :
				if(confirm("정말 탈퇴하시겠습니까?")) {
					location.href = "memberWithdraw.do?id=${loginUser.id}";
					break;
				}
		}
	}
	
	$(document).ready(function() {
		$('#password_check').keyup(function() { // 2번 PW에서 키를 떼었을때...
			var password = $('#password').val();		// 1번 PW
			var checkword = $('#password_check').val(); // 2번 PW

			if (checkword != password.substr(0, checkword.length)) {
				addDontMiss();
			} else {
				removeDontMiss();
			}
		});

		$('#password').keyup(function() { // 1번 PW에서 키를 떼었을때...
			var password = $('#password').val();
			var checkword = $('#password_check').val();

			if (checkword.length != 0) {
				if (checkword != password) {
					$('#password').addClass('not_valid');
					addDontMiss();
				} else {
					removeDontMiss();
				}
			}
		});

		function addDontMiss() {
			$('#password_check').addClass('not_valid');
			$('#password_eq').html('비밀번호가 일치하지 않습니다.');
			$('#password_check').val('');
		}
		function removeDontMiss() {
			$('#password').removeClass('not_valid');
			$('#password_check').removeClass('not_valid');
			$('#password_eq').html('');
		}
		
// 		인풋폼 색 변경
	    $("input").focus(function(){
	        $(this).css("background-color", "#ADD8E6");
	    });
	    $("input").blur(function(){
	        $(this).css("background-color", "#ffffff");
	    });
	});
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
	<article class="container">
		<div class="page-header">
			<h1>정보수정 <small>10개의 알! Form</small></h1>
		</div>
		<div class="col-md-6 col-md-offset-3">
		<form role="form" class="form-horizontal" name=mForm method="post" action="${ pageContext.request.contextPath }/member/myPage.do" onsubmit="return goCheck()">
			<div align="center">
				* : 필수 입력 항목입니다.<br/>
				숫자 : "숫자" 이내로 입력하세요.
			</div><hr/>
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="id">ID</label>
				<div class="col-sm-6">
					<input type="text" id="id" name="id" class="form-control" onkeydown='return idExp(event)' onkeyup='removeSpecial(event)' 
					style='ime-mode:disabled;' placeholder="ID를 입력하세요" maxlength="10" style="width: 200px;" value="${loginUser.id}" disabled="disabled"/>
					<span id="id_eq" ></span>
					<p class="help-block">* / 10 / 영어&숫자</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="password">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" id="password" class="form-control" name="password" onkeyup='pwException(event)'
					placeholder="PW를 입력하세요" maxlength="10" style="width: 200px;" value="${loginUser.password}" required />
					<p class="help-block">* / 10 / 문자&숫자&특수문자</p>
				</div>
			</div>
    
			<div class="form-group">
				<label class="col-sm-3 control-label" for="password_check">비밀번호 확인</label>
				<div class="col-sm-6">
					<input type="password" id="password_check" class="form-control" name="passwordcheck" 
					placeholder="PW를 입력하세요" maxlength="10" style="width: 200px;" value="${loginUser.password}" required />
					<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
					<p id="password_eq" ></p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="name">이름</label>
				<div class="col-sm-6">
					<input type="text" name="name" id="name" class="form-control" maxlength="20" onkeydown='return onlyChar(event)'
					style="ime-mode:active;" placeholder="이름을 입력하세요" value="${loginUser.name}" required />
					<p class="help-block">* / 20 / 영어&한글</p>
				</div>
			</div>
 
			<div class="form-group">
				<label class="col-sm-3 control-label" for="phone">핸드폰 번호</label>
				<div class="col-sm-6">
					<input type="tel" name="phone" id="phone" class="form-control" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' 
					style='ime-mode:disabled;' placeholder="핸드폰번호를 입력하세요" value="${loginUser.phone}" required />
					<p class="help-block">* / 20 / 숫자</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="addr">주소</label>
				<div class="col-sm-6">
					<input type="text" name="addr" id="addr" class="form-control"  onkeydown='return idAddr(event)' 
					style="ime-mode:active; width: 600px;" placeholder="주소" maxlength="200"  value="${loginUser.addr}" required />
					<input type="button" onclick="addr_search()" value="주소 검색"><br>
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
					<p class="help-block">* / 200</p>
				</div>
			</div>
  
			<div class="form-group">
				<label class="col-sm-3 control-label" for="email">E-mail</label>
				<div class="col-sm-6">
					<input type="email" name="email" id="email" class="form-control" maxlength="50" onkeydown='return emailExp(event)'
					placeholder="E-mail을 입력하세요" style='ime-mode:disabled;' value="${loginUser.email}" required />
					<p class="help-block">* / 50 / E-mail 형식에 맞게 입력하세요. / 영어&숫자</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">성별</label>
				<div class="col-sm-6">
					<label for="M">남자</label>
					<input type="radio" name="sex" id="M" value="M" <c:if test="${ loginUser.sex eq 'M'}">checked="checked"</c:if> />
					<label for="W">여자</label>
					<input type="radio" name="sex" id="W" value="W" <c:if test="${ loginUser.sex eq 'W'}">checked="checked"</c:if> />
					<p class="help-block">*</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">핸드폰 알람</label>
				<div class="col-sm-6">
					<label for="Y">수신</label>
					<input type="radio" name="phoneAlarm" id="Y" value="Y" <c:if test="${ loginUser.phoneAlarm eq 'Y'}">checked="checked"</c:if> />
					<label for="N">거절</label>
					<input type="radio" name="phoneAlarm" id="N" value="N" <c:if test="${ loginUser.phoneAlarm eq 'N'}">checked="checked"</c:if> />
					<p class="help-block">*</p>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="submit">수정하기<i class="fa fa-check spaceLeft"></i></button>
					<button class="btn btn-danger" onclick="doAction('W')">탈퇴<i class="fa fa-times spaceLeft"></i></button>
					<button class="btn btn-danger" onclick="javascript:history.go(-1)">뒤로가기<i class="fa fa-repeat spaceLeft"></i></button>
				</div>
			</div>
			
			</form><hr>
  		</div>
   	</article>
	</section>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/css/SignUp/js/bootstrap.min.js"></script>
    
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//apis.daum.net/maps/maps3.js?apikey=e063b5ded5f9bdc5122fa18197cc799b&libraries=services"></script>
	<script>
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	    function addr_search() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = data.address; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수
	
	                // 기본 주소가 도로명 타입일때 조합한다.
	                if(data.addressType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("addr").value = fullAddr;
	                // 주소로 좌표를 검색
	                geocoder.addr2coord(data.address, function(status, result) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	</script>
</body>
</html>