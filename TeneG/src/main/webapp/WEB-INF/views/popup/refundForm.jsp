<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환불 신청</title>
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
  		if(CKEDITOR.instances["content"].getData() == ""){
			alert("내용을 입력하세요");
			return false;
		} 
		writeRefund("${requestNo}", "${expertId}", "${id}");
		window.close();
		opener.reload();
	}
	
	// 후기 쓰기
	var httpRequest = null;
	function writeRefund(requestNo, expertId, writer){
		// 1. XMLHttpRequest Object 생성
		if(window.XMLHttpRequest) httpRequest = new XMLHttpRequest();
		else if(window.ActiveObject) httpRequest = new ActiveObject("Microsoft.XMLHTTP");
		else return;
	
		httpRequest.open("POST", "${pageContext.request.contextPath}/refund/write.do", true);
		var data = new FormData();
		data.append("expertId", expertId);
		data.append("writer", writer);
		data.append("requestNo", requestNo);
		data.append("content", CKEDITOR.instances["content"].getData());
		data.append("title", $("#selectTitle option:selected").text());
		httpRequest.send(data);
	}
</script>
</head>
<body>
	<div>
		<span style="color:red; font-size: 8pt">환불결과는 의뢰인의 의뢰내용과 전문가의 결과물 간의 비교 후 1~2일내로 공지됩니다.</span><br/>
	</div>
	<div align="center">
		<form name="wForm" onsubmit="return checkForm();">
		<table border="1" class="table">
			<tr>
				<th style="text-align: center;">작성자</th>
				<th style="text-align: center;">의뢰번호</th>
				<th style="text-align: center;">담당전문가</th>
			</tr>
			<tr>
				<td style="text-align: center;">${ id }</td>
				<td style="text-align: center;">${ requestNo }</td>
				<td style="text-align: center;">${ expertId }</td>
			</tr>
			<tr>
				<th colspan="3"  style="text-align: center;">환불사유</th>
			</tr>
			<tr>
				<td colspan="3">
					<select style="width: 100%;" id="selectTitle">
						<option>결과물이 제가 의뢰했던 내용과 많이 다릅니다.</option>
						<option>결과물이 예정된 기간내에 도착하지 않습니다.</option>
						<option>갑자기 마음이 바껴서 환불하고싶엉!!</option>
						<option>기타</option>
					</select>
				</td>
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
		<input class="btn" type="submit" value="등록"/>
		<input class="btn" type="button" value="취소" onClick="onClickCancel()"/>
		</form>
	</div>
</body>
</html>