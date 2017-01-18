<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 작성</title>
<script src="${ pageContext.request.contextPath }/js/ckeditorSimple/ckeditor.js"></script>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${ pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<script>
	function onClickCancel(){
		window.close();
	}
	
	function checkForm(){
		var grade = $(':radio[name="grade"]:checked').val();
		if(typeof grade == "undefined"){
			alert("평점을 선택 하세요");
			return false;
		}
		
		if(window.wForm.content.value.trim() == ""){
			alert("내용을 입력하세요");
			return false;
		}
		
		writeReview("${no}", "${expertId}", "${id}", "${price}");
		window.close();
		opener.reload();
	}
	
	// 후기 쓰기
	var httpRequest = null;
	function writeReview(no, expertId, writer, price){
		// 1. XMLHttpRequest Object 생성
		if(window.XMLHttpRequest) httpRequest = new XMLHttpRequest();
		else if(window.ActiveObject) httpRequest = new ActiveObject("Microsoft.XMLHTTP");
		else return;
	
		httpRequest.open("POST", "${pageContext.request.contextPath}/review/write.do", true);
		//httpRequest.send("id=" + id + "&no=" + no + "&writer=" + writer);
		var data = new FormData();
		data.append("expertId", expertId);
		data.append("writer", writer);
		data.append("requestNo", no);
		data.append("price", price)
		data.append("content", window.wForm.content.value);
		data.append("grade", $(':radio[name="grade"]:checked').val());
		httpRequest.send(data);
	}
	
</script>
</head>
<body>
	<div align="center">
		<form name="wForm" onsubmit="return checkForm();">
		<table border="1" class="table">
			<tr>
				<th style="text-align: center;">작성자</th>
				<th style="text-align: center;">의뢰번호</th>
				<th style="text-align: center;">전문가</th>
			</tr>
			<tr>
				<td style="text-align: center;">${ id }</td>
				<td style="text-align: center;">${ no }</td>
				<td style="text-align: center;">${ expertId }</td>
			</tr>
			<tr>
				<th colspan="3"  style="text-align: center;">내용</th>
			</tr>
			<tr>
				<td colspan="3">
					<textarea name="content"></textarea>
					 <script>
                     		CKEDITOR.replace("content");
                  	</script>
				</td>
			</tr>
		</table>
			<span>평점 : </span>
			<span style="font-size: 15pt; color:blue;">★</span><input type="radio" name="grade" value="1"/>
			<span style="font-size: 15pt; color:blue;">★★</span><input type="radio" name="grade" value="2"/>
			<span style="font-size: 15pt; color:blue;">★★★</span><input type="radio" name="grade" value="3"/>
			<span style="font-size: 15pt; color:blue;">★★★★</span><input type="radio" name="grade" value="4"/>
			<span style="font-size: 15pt; color:blue;">★★★★★</span><input type="radio" name="grade" value="5"/><br/>
			
			<input class="btn" type="submit" value="등록"/>
			<input class="btn" type="button" value="취소" onClick="onClickCancel()"/>
		</form>
	</div>
</body>
</html>