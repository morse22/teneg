<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="cache-control" content="no-cache, must-revalidate">
<meta http-equiv="pragma" content="no-cache">
<title>광고 변경</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
	.boardBanner:hover{
		opacity: 0.5;
	}
</style>
<script>
	$(document).ready(function(){
		$("#boardBanner").attr("src", "${ pageContext.request.contextPath }/upload/ad-boardBannerImage.png?timestamp=" + new Date().getTime());
	});
</script>
<script>
	var leftFile, rightFile;
	function onClickChange(){
		document.all.file1.click(); 
	}
	
	function doChange(){
		$("#imageForm").submit();
	}
	
	 function onChangeImage(){
		var agent = navigator.userAgent.toLowerCase(); 
		
       	if($("#file1").val() == "") return;
       	
      	var ext = $("#file1").val().split(".").pop().toLowerCase();
      		
        if($.inArray(ext, ['png']) == -1) {
        	if (agent.indexOf("msie") != -1)  $("#file1").replaceWith( $("#file1").clone(true) );
        	else $("#file1").val("");	
            window.alert('지원하는 파일 형식이 아닙니다! (png 파일만 업로드 가능)');
            return;
        }
        
        file = $('#file1').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);
        $("#boardBanner").attr('src', blobURL);	            
	 }
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
	
	<jsp:include page="/include/side.jsp" />
	
	<div align="center" style="margin-top: 80px; margin-bottom: 170px;">
		<div style="height: 800px; width: 800px;">
			<div align="left">
				<p style="color:rgb(160, 160, 160); font-weight: bold; font-size: 15pt;">게시판 베너등록(미리보기)</p>
				<p style="color:red; font-weight: bold; font-size: 8pt;">광고 사진을 변경하고 싶으시면 원하시는 위치의 사진을 클릭하십시오</p>
				<p style="color:red; font-weight: bold; font-size: 8pt;">광고 사진은 .png형식만 지원합니다.</p>
			</div>
			
			<div style="height: 800px; width: 800px; background-color: rgb(240, 240, 240); border: 1px solid rgb(200, 200, 200);">
				<div align="center">
					<div style="height: 140px; width: 788px; margin-top: 50px; border: 2px solid red;">
						<a href="#" onclick="return false">
							<img class="boardBanner" style="height: 136px; width: 788px;" id="boardBanner" alt="광고 이미지를 등록해 주세요" onclick="onClickChange()"/>
						</a>
					</div>
		
					<div style="height: 550px; width: 568px; border: 1px solid green;">
						<img style="height: 500px; width: 568px;" src="${ pageContext.request.contextPath }/img/contentImage2.png"/>
					</div>
				</div>
			</div>
			
			<div style="margin-top: 18px;">
				<button class="btn" style="border: 1px solid rgb(160, 160, 160);" onclick="doChange()">적용</button>
				<button class="btn" style="border: 1px solid rgb(160, 160, 160);" onclick="javascript:history.back()">취소</button>
			</div>
			
		</div>
	</div>
	
	<form method="POST" action="${ pageContext.request.contextPath }/managerImage/update.do" style="display: none;" id="imageForm" enctype="multipart/form-data"> 
		<input type="file" name="boardBanner" style='display: none;' id="file1" onchange="onChangeImage()"/> 
	</form>	
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>