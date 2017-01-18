<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전문가 등록</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script>
	function doWrite(){
		var w = document.wForm;
		
		if($("#field").val() == ""){
			alert("분야를 선택 하세요.");
			$("#field").focus();
			return false;
		}
		
		if(w.title.value == ''){
			alert('제목을 입력 하세요');
			w.title.focus();
			return false;
		}
		if(w.content.value == ''){
			alert('내용을 입력 하세요');
			w.content.focus();
			return false;
		}
				
		if(checkExt(w.titleImage)){
			alert("업로드 할 수 없는 파일입니다.");
			return false;
		}
		if(checkExt(w.mainImage)){
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
	
	<section>
		<div align="center" style="margin-top: 90px;">
		<div style="margin-bottom: 25px;">
			<span style="color:red; font-size: 8pt;">*전문가 최종 등록은 전문가 검증과정 후 결정 됩니다(1~3일 소요)</span><br/>
			<span style="color:red; font-size: 8pt;">전문가에 대한 신뢰를 위해 본인의 자격증이나 실력증명이 가능한 사진을 '메인사진'에 올려주세요</span>
		</div>
 			<form class="form-horizontal" name="wForm" action="${ pageContext.request.contextPath }/expert/write.do" method="post" onsubmit="return doWrite()" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${ loginUser.id }" />
					<div class="form-group">
						<label for="field" class="col-sm-4 control-label">분야</label>
						<div class="col-sm-1">
							<select name="field" id="field">
								<option value="">선택</option>
								<option value="java">JAVA</option>
								<option value="c">C</option>
								<option value="cplusplus">C++</option>
								<option value="php">PHP</option>
								<option value="physon">Physon</option>
							</select>
						</div>		
					</div>
					<div class="form-group">
						<label for="title" class="col-sm-4 control-label">제목</label>
						<div class="col-sm-4">
						<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요"/>
						</div>		
					</div>
					<div class="form-group">
						<label for="writer" class="col-sm-4 control-label">신청자</label>
						<div class="col-sm-4">
						<input type="text" class="form-control" id="id" value="${ loginUser.id }" readonly/>
						</div>		
					</div>
					<div class="form-group">
						<label for="content" class="col-sm-4 control-label">서비스 내용</label>
						<div class="col-sm-4">
						<textarea class="form-control" name="content"></textarea>
 						<script>
                     		CKEDITOR.replace("content");
                  		</script>
						</div>		
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Title 이미지</label>
						<div class="col-sm-2">
						<input class="form-control" type="file" name="atfile1"/>
						</div>		
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">메인 이미지</label>
						<div class="col-sm-2">
						<input class="form-control" type="file" name="atfile2"/>
						</div>		
					</div><br/>																							
				<button type="submit" class="btn">
					<span class="glyphicon glyphicon-ok-sign">확인</span>
				</button>&nbsp;&nbsp;
				<button type="button" class="btn">
					<span class="glyphicon glyphicon-ok-sign">미리보기</span>
				</button>&nbsp;&nbsp;
				<button type="button" class="btn" onclick="location='<%= request.getContextPath() %>/board/list.do?pc=11&page=1'">
					<span class="glyphicon glyphicon-circle-arrow-left">취소</span>
				</button>
			</form>
		</div>
	</section><br/>
	
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>