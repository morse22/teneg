<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/layout-teneg.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/layout-teneg2.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>	
<script>
	function insert() {
		if (confirm('등록하시겠습니까?')== true) {
			document.form1.submit();
		}else {
			return;
		}

	}
	function cancle(){	
			location.href="${pageContext.request.contextPath}/qna/QnAList.do"
	}
</script>
</head>
<body>
	<header>
		<div align="center">
			<div style="width: 85%; margin-top: 1%;">
				<jsp:include page="/include/header.jsp" />
			</div>
		</div>
	</header>
	<section>
		<div style="margin-left: auto; margin-right: auto; margin-bottom:20px; margin-top:60px; border: 1px solid #bbb;width: 1000px; height: 800px;">
			<h4>FAQ등록</h4>
			<fieldset>
				<form name="form1" id="form1"
					action="${pageContext.request.contextPath }/qna/boardFAO.do"
					method="post" enctype="multipart/form-data">
					<table border="1" style="margin-top: 50px;">
						<tr>
							<th>Title</th>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<th>File</th>
							<td><input type="file" name="file1" accept=".jpg"></td>
						</tr>
						<tr>
							<th>Content</th>
							<td> <textarea name="content" cols="80" rows="20" style="overflow-y: scroll;"></textarea></td>
						</tr>
					</table>	
						<input type="button" class="btn" onclick="insert()" value="작성">
						<input type="button" class="btn" onclick="cancle()" value="취소">
				</form>
			</fieldset>
		</div>
	</section>
	
		<footer>
			<jsp:include page="/include/footer.jsp" />
		</footer>
</body>
</html>


<!-- <div style="border: 1px solid gray; width: 600px;">
  <input type="text" name="title" class="question" id="nme">
  <label for="nme"><span>&nbsp;TITLE</span></label>
   <input type="file" name="file1" accept=".jpg"   class="question" id="nme">
  <label for="nme"><span>&nbsp;FILE</span></label>				
    <fieldset>
  	<legend style="margin-bottom: 0px;"><label for="nme"><span>CONTENT</span></label></legend>
    <textarea name="content" cols="82" rows="10" style="overflow-y: scroll;"></textarea>
  </fieldset>
 </div>
 		<div id="qna_button_b">
						<a onclick="insert()" href="#"><p>
								<strong style="font-size: 25px">WRITE</strong>작성
							</p></a>
					</div>

					<div id="qna_button_w">
						<a onclick="back()" href="#"><p>
								<strong style="font-size: 25px">CANCEL</strong>취소
							</p></a>
					</div>
 
	 -->