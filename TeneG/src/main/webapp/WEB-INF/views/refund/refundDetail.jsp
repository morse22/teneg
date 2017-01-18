<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환불</title>
<script src="${ pageContext.request.contextPath }/js/ckeditorSimple/ckeditor.js"></script>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${ pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<script>
	function onClickCancel(){
		window.close();
	}
	
	function ok(){
		if(confirm("정말 승인하시겠습니까?")){
	        $.ajax({
	            type : "post",
	            url : "${ pageContext.request.contextPath}/refund/refundOK.do",
	            data : {
	                "requestNo" : "${refund.requestNo}"
	             },
	            success : function(data) {
	            	alert("환불승인 처리를 정상적으로 완료했습니다.");
	            },
	         });
		}
		
	    window.close();
	    opener.reload();
	}
	
	function noRefund(no, id, expertId){
		location="${pageContext.request.contextPath}/refund/noRefund.do/" + no + "/" + id + "/" + expertId
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
	<div align="center">
		<table border="1" class="table">
			<tr>
				<th style="text-align: center;">작성자</th>
				<th style="text-align: center;">의뢰번호</th>
				<th style="text-align: center;">담당전문가</th>
			</tr>
			<tr>
				<td style="text-align: center;">${ refund.writer }</td>
				<td style="text-align: center;">${ refund.requestNo }</td>
				<td style="text-align: center;">${ refund.expertId }</td>
			</tr>
			<tr>
				<th colspan="3" style="text-align: center;">환불사유</th>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;">${ refund.title }</td>
			</tr>
			
			<tr>
				<th colspan="3" style="text-align: center;">내용</th>
			</tr>
			<tr>
				<td colspan="3">${ refund.content }</td>
			</tr>
		</table>
		<input class="btn" type="button" value="환불승인" onclick="ok()"/>
		<input class="btn" type="button" value="환불불가" onclick="noRefund('${refund.requestNo}', '${refund.writer}', '${refund.expertId}')"/>
		<input class="btn" type="button" value="취소" onClick="onClickCancel()"/>
	</div>
</body>
</html>