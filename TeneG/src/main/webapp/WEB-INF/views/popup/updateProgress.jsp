<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<title>진행률 입력</title>
<script>
	function onclickOk(){
		var widthVar = $("#progressSelect option:selected").val();
		$.ajax({
	           type : "post",
	           url : "${ pageContext.request.contextPath}/request/changeProgress.do",
	           data : {
	              "progress" : widthVar,
	              "requestNo" : "${requestNo}"
	           },
	           success : function() {
					alert("진행률이 변경되었습니다.");
					window.close();
					opener.location = "${ pageContext.request.contextPath }/expert/workList.do/${loginUser.id}";
	           },
	        });
	}
	
	function onchangeProgress(){
		var widthVar = $("#progressSelect option:selected").val();
		$("#progress").width(410 * widthVar / 100);
		$("#progressText").text("진행률 " + widthVar + "%");
	}
</script>
</head>
<body>
	<div style="background-color: rgb(240, 240, 240); padding: 30px; height: 200px; width: 470px;">
		<div align="left">
			<span style="font-weight: bold">진행률 선택(%)</span>
			<select onchange="onchangeProgress()" id="progressSelect">
				<option value="0">0</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="40">40</option>
				<option value="50">50</option>
				<option value="60">60</option>
				<option value="70">70</option>
				<option value="80">80</option>
				<option value="90">90</option>
				<option value="100">100</option>
			</select>
				<div class="progress" style="margin-top: 30px;">
				   <div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" id="progress" style="width:0%;">
				   </div>
				</div>
				<span id="progressText" style="color:black; font-weight: bold;">진행률 0%</span>
		<div align="center">
			<button onclick="onclickOk()">확인</button>
			<button onclick="javascript:window.close();">취소</button>
		</div>
	</div>
	</div>
</body>
</html>