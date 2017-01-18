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
</script>
</head>
<body>
	<div align="center">
		<table border="1" class="table">
			<tr>
				<th colspan="3" style="text-align: center;">환불사유</th>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;">${ refund.replyContent }</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;"><a href="${ pageContext.request.contextPath }/upload/${refund.saveFileName}" download>사유 설명 파일 다운로드</a></td>
			</tr>
		</table>
		<input class="btn" type="button" value="닫기" onClick="onClickCancel()"/>
	</div>
</body>
</html>