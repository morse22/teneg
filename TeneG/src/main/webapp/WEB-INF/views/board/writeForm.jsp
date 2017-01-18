<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Form</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.theme.min.css" />
<style>
	.imhover:hover{
		opacity: 0.5;
	} 
</style>
<script>
	function doWrite(){
		var w = document.wForm;
		
		if($("#category").val() == ""){
			alert("카테고리를 선택 하세요.");
			$("#category").focus();
			return false;
		}
		
		if(w.title.value == ""){
			alert('제목을 입력 하세요');
			w.title.focus();
			return false;
		}
		
		if(CKEDITOR.instances["content"].getData() == ""){
			alert('내용을 입력 하세요');
			w.content.focus();
			return false;
		}
				
		if(checkExt(w.attachfile1)){
			alert("업로드 할 수 없는 파일입니다.");
			return false;
		}
		if(checkExt(w.attachfile2)){
			alert("업로드 할 수 없는 파일입니다.");
			return false;
		}
		if(checkExt(w.attachfile3)){
			alert("업로드 할 수 없는 파일입니다.");
			return false;
		}
		if(checkExt(w.attachfile4)){
			alert("업로드 할 수 없는 파일입니다.");
			return false;
		}
			
		return true;
	}
	
	function checkExt(obj){
		var forbidName = ['exe', 'jsp', 'java', 'class', 'js'];
		var fileName = obj.value;
		var ext = fileName.substring(fileName.lastIndexOf('.')+1);
		for(var i=0; i<forbidName.length;i++) if(forbidName[i] == ext) return true;
		return false;
	}
	
	$(document).ready(function(){
		CKEDITOR.replace("content",	
   			{
   		      height : "500px",
   		      startupFocus : false 
   		    }
   				
   		).on("change", function(e){
 				text = e.editor.getData();
 				var total = 0;
     			for(var i=0;i<text.length;i++){
     				oneChar = text.charAt(i);
     				if(escape(oneChar).length > 4) total += 3;
     				else total++;
     			}
     			$("#t2").text(total);
   		});
	});
	
	function onClickFileUp(){
		return false;
	}
	
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
		}
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
	        $("#at1").attr('src', blobURL);	 
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
	        $("#at2").attr('src', blobURL);	 
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
	        $("#at3").attr('src', blobURL);	 
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
	        $("#at4").attr('src', blobURL);	 
			break;
		}           
	 }
	
</script>
<body>

	<header>
		<div align="center">
			<div style="width:85%; margin-top: 1%;">
				<jsp:include page="/include/header.jsp" />
			</div>
		</div>
	</header>
	
	<div align="center" style="margin-top: 50px; ">
		<div>
			<a href="${ pageContext.request.contextPath }/board/list.do?pc=11&page=1"><img style="width:100%; height: 280px;" src="${ pageContext.request.contextPath }/img/banner.png"/></a>
		</div>
	</div>
	
	<section>
		<div align="center" style="margin-top: 90px;">
		
		<div style="margin-bottom: 25px;">
			<span style="color:red; font-size: 8pt;">*TeneG 자유게시판은 우리가 함께 만들어가는 소중한 공간 입니다 게시글 작성 시 타인에 대한 배려와 책임을 담아 주세요.</span>
		</div>
 			<form class="form-horizontal" name="wForm" action="${ pageContext.request.contextPath }/board/write.do" method="post" onsubmit="return doWrite()" enctype="multipart/form-data">
 			<div style=" width:60%; padding: 50px;background-color: #e9fafc;">
				<input type="hidden" name="writer" value="${ loginUser.id }" />
					<div class="form-group">
						<div class="col-sm-1">
							<select name="category" id="category">
								<option value="">카테고리선택</option>
								<option value="">---------------</option>
								<option value="free">자유개시판</option>
								<option value="reply">후기게시판</option>
								<option value="develop">개발게시판</option>
							</select>
						</div>		
					</div>
					<div class="form-group">
						<div class="col-sm-12">
						<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요"/>
						</div>		
					</div>
					<div class="form-group">
						<div class="col-sm-12">
						<textarea class="form-control" name="content" style="height: 500px;" id="content"></textarea>
						</div>		
					</div>
					<div align="right">
                  		<span id="t2" style="color:rgb(70, 70, 70); font-weight: bold;">0</span><span style="color:red; font-weight: bold;">/4000자</span>
					</div>
					<div class="form-group">
						<input type="radio" name="type" value="all" checked>전체공개 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="type" value="member">맴버공개 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="type" value="noti">공지 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="type" value="info">안내 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					
					<div align="left">
						<span style="color:rgb(70, 70, 70); font-weight: bold;">이미지 등록</span><br/>
						<span style="color:red; font-size: 8pt">*본 이미지는 게시물 상단에 위치하게 됩니다.</span>
					</div>
					<div align="left">
					<div  style="height: 180px; width: 700px; background-color:rgb(248, 248, 248); padding-top: 20px; padding-left: 20px;">
						<a href="#" onclick="return false" style="margin-right: 20px;">
						<img id="at1" class="imhover" src="${ pageContext.request.contextPath }/img/uploadImage.png" alt="등록할 이미지를 선택하세요" style="height: 110px; width: 110px;" onclick="onClickChange(1)"/></a>
						<a href="#" onclick="return false" style="margin-right: 20px;">
						<img id="at2" class="imhover" src="#" alt="등록할 이미지를 선택하세요" style="height: 140px; width: 140px;" onclick="onClickChange(2)"/></a>
						<a href="#" onclick="return false" style="margin-right: 20px;">
						<img id="at3" class="imhover" src="#" alt="등록할 이미지를 선택하세요" style="height: 140px; width: 140px;" onclick="onClickChange(3)"/></a>
						<a href="#" onclick="return false">
						<img id="at4" class="imhover" src="#" alt="등록할 이미지를 선택하세요" style="height: 140px; width: 140px;" onclick="onClickChange(4)"/></a>
					</div>
					</div>
					
					<input type="file" name="attachfile1" style='display: none;' id="file1" onchange="onChangeImage(1)"/> 
					<input type="file" name="attachfile2" style='display: none;' id="file2" onchange="onChangeImage(2)"/> 
					<input type="file" name="attachfile3" style='display: none;' id="file3" onchange="onChangeImage(3)"/> 
					<input type="file" name="attachfile4" style='display: none;' id="file4" onchange="onChangeImage(4)"/> 			
					
					</div><br/>																								
				<button type="submit" class="btn">
					<span class="glyphicon glyphicon-ok-sign"> 확인</span>
				</button>&nbsp;&nbsp;
				<button type="button" class="btn" onclick="onclickTest111()">
					<span class="glyphicon glyphicon-ok-sign"> 미리보기</span>
				</button>&nbsp;&nbsp;
				<button type="button" class="btn" onclick="location='<%= request.getContextPath() %>/board/list.do?pc=11&page=1'">
					<span class="glyphicon glyphicon-circle-arrow-left"> 취소</span>
				</button>
			</form>
		</div>
	</section><br/>
	
	<footer style="margin-top: 100px;">
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</head>
</html>