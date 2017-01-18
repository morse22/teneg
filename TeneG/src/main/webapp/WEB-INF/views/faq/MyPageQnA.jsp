<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<link href="${pageContext.request.contextPath }/css/layout-teneg.css" rel="stylesheet"/>
<head>
<style type="text/css">
a:link {
	color: red;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.line {
	border-bottom: 1px solid black;
}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
	$(function() { // 페이지 로딩시 실행
		$(".question").css("cursor", "pointer"); // question의 마우스 포인터 설정
		$(".answer").hide(); // answer 모두 hide
		$(".question").each(function(index) { // question안에 수만큼 반복
			$(this).click(function() { // 클릭 이벤트
				$(".edit").not(index).hide();
				$(".answer").not(index).hide();
				$(".answer").eq(index).show();// 해당 answer show
			});
			$(this).dblclick(function() { // 더블클릭 이벤트
				$(".answer").eq(index).hide(); // 해당 answer hide
				$(".edit").eq(index).hide();
			});
		});
	});

	$(document).ready(function() {
		$('.edit').hide();
		$(".edit_Pro_button").each(function(index) {
			$(this).click(function() {
				$(".edit").not(index).hide();
				$(".edit").eq(index).show();
			});
			$(this).dblclick(function() {
				$(".edit").eq(index).hide();
			});
		});
	});
	$(document).ready(function() {
		$('.answer_re').hide();
		$(".answer_rq").each(function(index) {
			$(this).click(function() {
				$(".answer_re").not(index).hide();
				$(".answer_re").eq(index).show();
			});
			$(this).dblclick(function() {
				$(".answer_re").eq(index).hide();
			});
		});
	});
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
	<div>
	<table style="width: 900px; height: 100px; margin-top: 150px; margin-bottom: 50px;" class="line">
		<tr class="line">
			<th>No</th>
			<th>TYPE</th>
			<th>SUBJECT</th>
			<th>WRITER</th>
			<th>DATE</th>
		</tr>
		<c:forEach var="vo" items="${vo}">
			<tr class="line" style="line-height: 50px">
				<td>${vo.no }</td>
				<td>${vo.type }</td>
				<td><a class="question">${vo.title }</a></td>
				<td>${vo.writer }</td>
				<td>${vo.regDate }</td>
			</tr>
			<tr>
			<c:choose>
				<c:when test="${ vo.answer == null  }">
				<td colspan="5" class="answer">${vo.content }<br /> <input
					class="edit_Pro_button" type="button" value="답변달기"></td>
				</c:when>
				<c:otherwise>
						<td colspan="5" class="answer">${vo.content }<br /><input class="answer_rq" type="button" value="답변보기"></td>
						<tr>
							<td colspan="5" class="answer_re">${vo.answer }</td>
						</tr>
				</c:otherwise>
			</c:choose>		
			</tr>	
			<tr>
				<td colspan="5" class="edit">
					<form action="${pageContext.request.contextPath }/qna/qnaRef.do">
						<table border="1" style="width: 930px; height:auto;">
							<tr>
								<th id="t">제목</th>
								<td colspan="4"><input type="hidden" name="title" value="${vo.title }">${vo.title }</td>
							</tr>
							<tr>
								<th id="t">답변자</th>
								<td colspan="4"><input type="text" name="answerer"></td>
							</tr>
							<tr>
								<th>질문유형</th>
								<td  colspan="4"><input type="hidden" name="type" value="${vo.type }">${vo.type }</td>
							</tr>
					
							<tr>
								<th id="t">답변내용</th>
								<td colspan="4"><textarea name="answer" id="comment_content" cols="60"
										rows="5"></textarea></td>
							</tr>			
							<tr>
								<td colspan="5">
								<input type="hidden" name="writer" value="${vo.writer }">
								<input type="hidden" name="no" value="${vo.no }">
								<input type="hidden" name="content" value="${vo.content }">
								<input type="submit" value="저장"></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</c:forEach>

	</table>
	</div>
	</section>

	<footer>
			<jsp:include page="/include/footer.jsp" />
		</footer>

</body>
</html>