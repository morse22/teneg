<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/ckeditor/ckeditor.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.theme.min.css" />
<script>
	function cancel(){
		history.back();
	}
	
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
		
		if(w.content.value == ""){
			alert('내용을 입력 하세요');
			w.content.focus();
			return false;
		}
		return true;
	}
	
	
	// type : member, all, noti, info
	// category : free, reply, develop
	
	$(document).ready(function(){
		$("#category").val("${board.category}");
		$("input:radio[value='${board.type}']").prop("checked", true);
	});
	
</script>
<body>
	<header>
		<div align="center">
			<div style="width:85%; margin-top: 1%;">
				<jsp:include page="/include/header.jsp" />
			</div>
		</div>
	</header>
	
	<div align="center" style="margin-top: 50px;">
		<div>
			<a href="${ pageContext.request.contextPath }/board/list.do?pc=11&page=1"><img src="${ pageContext.request.contextPath }/img/banner.png"/></a>
		</div>
	</div>
	
	<section style="margin-top: 2%;">
		<div align="center">
			<form name="wForm" action="${ pageContext.request.contextPath }/board/update.do" method="post" onsubmit="return doWrite()" class="form-horizontal">
				<input type="hidden" name="no" value="${ no }" />
				<input type="hidden" name="page" value="${ page }" />
				<input type="hidden" name="pc" value="${ pc }" />
					<div class="form-group">
						<label for="title" class="col-sm-4 control-label">카테고리</label>
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
					<label for="title" class="col-sm-4 control-label">제목</label>
					<div class="col-sm-4">
					<input type="text" class="form-control" name="title"  value="${ board.title }" placeholder="제목" id="title"/>
					</div>		
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">글쓴이</label>
					<div class="col-sm-4">
					<input type="text" class="form-control"  value="${ board.writer }" readonly/>		
					</div>		
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">내용</label>
					<div class="col-sm-4">
					<textarea style="resize:none;" class="form-control" rows="20" name="content" placeholder="내용을 입력하세요">${ board.content }</textarea>
					<script>
                     	CKEDITOR.replace('content');
                  	</script> 
					</div>		
				</div>
				<div class="form-group">
					<input type="radio" name="type" value="all">전체공개 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="type" value="member">맴버공개 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="type" value="noti">공지 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="type" value="info">안내 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>				
				<input type="submit" class="btn" value="수정완료" />&nbsp;&nbsp;
				<input type="button" class="btn" onclick="cancel()" value="취소"/>
			</form>
		</div>
	</section><br/>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</head>
</html>