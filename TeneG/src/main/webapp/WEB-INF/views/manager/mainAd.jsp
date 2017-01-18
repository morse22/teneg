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
	.mainAd:hover{
		opacity: 0.5;
	}
</style>
<script>

	$(document).ready(function(){
		var times = new Date().getTime();
		$("#mainAd1").attr("src", "${ pageContext.request.contextPath }/upload/ad-mainAd1.png?timestamp=" + times);
		$("#mainAd2").attr("src", "${ pageContext.request.contextPath }/upload/ad-mainAd2.png?timestamp=" + times);
		$("#mainAd3").attr("src", "${ pageContext.request.contextPath }/upload/ad-mainAd3.png?timestamp=" + times);
		$("#mainAd4").attr("src", "${ pageContext.request.contextPath }/upload/ad-mainAd4.png?timestamp=" + times);
		$("#mainAd5").attr("src", "${ pageContext.request.contextPath }/upload/ad-mainAd5.png?timestamp=" + times);
	});	


	var leftFile, rightFile;
	function onClickChange(data){
		switch(data){
		case 1 :
			document.all.file1.click(); 
			break;
		case 2 :
			document.all.file2.click(); 
			break;
		case 3 :
			document.all.file3.click(); 
			break;
		case 4 :
			document.all.file4.click(); 
			break;
		case 5 :
			document.all.file5.click(); 
			break;
		}
	}
	
	function doChange(){
		$("#imageForm").submit();
	}
	
	function onChangeImage(data){
		var agent = navigator.userAgent.toLowerCase(); 
		switch(data){
		case 1 :
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
	        $("#mainAd1").attr('src', blobURL);	 
			break;
		case 2 :
	       	if($("#file2").val() == "") return;
	      	var ext = $("#file2").val().split(".").pop().toLowerCase();
	        if($.inArray(ext, ['png']) == -1) {
	        	if (agent.indexOf("msie") != -1)  $("#file2").replaceWith( $("#file2").clone(true) );
	        	else $("#file2").val("");	
	            window.alert('지원하는 파일 형식이 아닙니다! (png 파일만 업로드 가능)');
	            return;
	        }
	        file = $('#file2').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	        $("#mainAd2").attr('src', blobURL);	 
			break;
		case 3 :
	       	if($("#file3").val() == "") return;
	      	var ext = $("#file3").val().split(".").pop().toLowerCase();
	        if($.inArray(ext, ['png']) == -1) {
	        	if (agent.indexOf("msie") != -1)  $("#file3").replaceWith( $("#file3").clone(true) );
	        	else $("#file3").val("");	
	            window.alert('지원하는 파일 형식이 아닙니다! (png 파일만 업로드 가능)');
	            return;
	        }
	        file = $('#file3').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	        $("#mainAd3").attr('src', blobURL);	 
			break;
		case 4 :
	       	if($("#file4").val() == "") return;
	      	var ext = $("#file4").val().split(".").pop().toLowerCase();
	        if($.inArray(ext, ['png']) == -1) {
	        	if (agent.indexOf("msie") != -1)  $("#file4").replaceWith( $("#file4").clone(true) );
	        	else $("#file4").val("");	
	            window.alert('지원하는 파일 형식이 아닙니다! (png 파일만 업로드 가능)');
	            return;
	        }
	        file = $('#file4').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	        $("#mainAd4").attr('src', blobURL);	 
			break;
		case 5 :
	       	if($("#file5").val() == "") return;
	      	var ext = $("#file5").val().split(".").pop().toLowerCase();
	        if($.inArray(ext, ['png']) == -1) {
	        	if (agent.indexOf("msie") != -1)  $("#file5").replaceWith( $("#file5").clone(true) );
	        	else $("#file5").val("");	
	            window.alert('지원하는 파일 형식이 아닙니다! (png 파일만 업로드 가능)');
	            return;
	        }
	        file = $('#file5').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	        $("#mainAd5").attr('src', blobURL);	 
			break;
		}           
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
				<p style="color:rgb(160, 160, 160); font-weight: bold; font-size: 15pt;">메인 광고등록(미리보기)</p>
				<p style="color:red; font-weight: bold; font-size: 8pt;">광고 사진을 변경하고 싶으시면 원하시는 위치의 사진을 클릭하십시오</p>
				<p style="color:red; font-weight: bold; font-size: 8pt;">광고 사진은 .png형식만 지원합니다.</p>
			</div>
			
			<div style="height: 800px; width: 800px; background-color: rgb(240, 240, 240); border: 1px solid rgb(200, 200, 200);">
				<div align="left" style="margin-top: 20px;">
					<span style="color:rgb(70, 70, 70); font-weight: bold;">메인 광고1</span>
					<div style="height: 100px; width: 788px; border: 2px solid red;">
						<a href="#" onclick="return false">
							<img alt="광고 이미지를 등록해 주세요" class="mainAd" style="height: 96px; width: 788px;" id="mainAd1"
							onclick="onClickChange(1)"/>
						</a>
					</div>
				</div>
				<div align="left" style="margin-top: 20px;">
					<span style="color:rgb(70, 70, 70); font-weight: bold;">메인 광고2</span>
					<div style="height: 100px; width: 788px; border: 2px solid red;">
						<a href="#" onclick="return false">
							<img alt="광고 이미지를 등록해 주세요" class="mainAd" style="height: 96px; width: 788px;" id="mainAd2"
							onclick="onClickChange(2)"/>
						</a>
					</div>
				</div>
				<div align="left" style="margin-top: 20px;">
					<span style="color:rgb(70, 70, 70); font-weight: bold;">메인 광고3</span>
					<div style="height: 100px; width: 788px; border: 2px solid red;">
						<a href="#" onclick="return false">
							<img alt="광고 이미지를 등록해 주세요" class="mainAd" style="height: 96px; width: 788px;" id="mainAd3"
							onclick="onClickChange(3)"/>
						</a>
					</div>
				</div>
				<div align="left" style="margin-top: 20px;">
					<span style="color:rgb(70, 70, 70); font-weight: bold;">메인 광고4</span>
					<div style="height: 100px; width: 788px; border: 2px solid red;">
						<a href="#" onclick="return false">
							<img alt="광고 이미지를 등록해 주세요" class="mainAd" style="height: 96px; width: 788px;" id="mainAd4"
							onclick="onClickChange(4)"/>
						</a>
					</div>
				</div>
				<div align="left" style="margin-top: 20px;">
					<span style="color:rgb(70, 70, 70); font-weight: bold;">메인 광고5</span>
					<div style="height: 100px; width: 788px; border: 2px solid red;">
						<a href="#" onclick="return false">
							<img alt="광고 이미지를 등록해 주세요" class="mainAd" style="height: 96px; width: 788px;" id="mainAd5"
							onclick="onClickChange(5)"/>
						</a>
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
		<input type="file" name="mainAd1" style='display: none;' id="file1" onchange="onChangeImage(1)"/> 
		<input type="file" name="mainAd2" style='display: none;' id="file2" onchange="onChangeImage(2)"/> 
		<input type="file" name="mainAd3" style='display: none;' id="file3" onchange="onChangeImage(3)"/> 
		<input type="file" name="mainAd4" style='display: none;' id="file4" onchange="onChangeImage(4)"/> 
		<input type="file" name="mainAd5" style='display: none;' id="file5" onchange="onChangeImage(5)"/> 
	</form>	
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>