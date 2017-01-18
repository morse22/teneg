<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환불 불가</title>
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
  		if(CKEDITOR.instances["content"].getData() == ""){
			alert("사유를 입력하세요");
			return false;
		} 
  		
		var formData = new FormData();
		formData.append("replyFile", $("input[name=replyFile]")[0].files[0]);
		formData.append("replyContent", CKEDITOR.instances["content"].getData());
		formData.append("requestNo", "${requestNo}");
        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/refund/doRR.do",
            data : formData,
            processData : false,
            contentType : false,
            success : function(data) {
				alert("정상적으로 완료처리 되었습니다.");
				window.close();
				opener.reload();
            },
        });
	}
</script>
</head>
<body>
	<div>
		<span style="color:red; font-size: 8pt">입력하신 환불사유는 의뢰자에게 전달됩니다.</span><br/>
	</div>
	<div align="center">
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
				<th colspan="3"  style="text-align: center;">환불 불가사유</th>
			</tr>
			<tr>
				<td colspan="3"><input type="file" name="replyFile"/></td>
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
			<input class="btn" type="button" value="처리완료" onclick="ok()"/>
			<input class="btn" type="button" value="취소" onClick="onClickCancel()"/>
	</div>
</body>
</html>