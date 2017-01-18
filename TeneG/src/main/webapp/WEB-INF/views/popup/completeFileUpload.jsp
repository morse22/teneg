<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<title>최종파일 업로드</title>
<script>
	function check(){
	 	if($("#fileTag").val().trim().length == 0){
	 		alert("파일을 선택하세요");
	 		return false;
	 	}
	 	
		if(confirm("최종완료 하시겠습니까?")){
			var formData = new FormData();
			formData.append("finalFile", $("input[name=finalFile]")[0].files[0]);	
	        $.ajax({
	            type : "post",
	            url : "${pageContext.request.contextPath}/request/doDComplete.do/${requestNo}",
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
		
	}
</script>
</head>
<body>
	<div>
		<span style="font-weight: bold; font-size: 12pt;">의뢰자에게 보낼 최종완성본을 업로드 하세요.</span><br/>
		<span style="color:red; font-weight: bold; font-size: 8pt;">*결과물을 업로드 해야 의뢰에 대한 완료처리가 가능합니다. 
		의뢰자가 결과물 확인 후 egg금액이 전달 될 예정입니다. 전체거래 과정을 보시려면 <a href="#">여기</a>를 클릭하세요</span>
		<div style="margin-top: 30px;" align="center">
			<form id="eForm" action="${pageContext.request.contextPath}/request/doDComplete.do/${requestNo}" method="post" enctype="multipart/form-data">
				<input type="file" name="finalFile" id="fileTag"/><br/><br/>
				<input type=button value="완료" onclick="check()"/>
				<input type=button value="취소" onclick="javascript:window.close();"/>
			</form>
		</div>
	</div>
</body>
</html>