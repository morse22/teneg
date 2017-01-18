<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/css/layout-teneg.css" rel="stylesheet"/>
<title>Insert title here</title>
<style>

</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
	function insert(){
			location.href="${pageContext.request.contextPath}/qna/boardFAO.do";	
	}
	
	$(function(){ // 페이지 로딩시 실행
	    $(".question").css("cursor","pointer"); 
	    $(".answer").hide(); // answer 모두 hide	
	    $(".question").each(function(index){ 
	        $(this).click(function(){ 
	         	$(".answer").not(index).hide(); 
	        	$(".answer").eq(index).show();
	        });
	        $(this).dblclick(function(){ 
	            $(".answer").eq(index).hide(); 
	        });
	    });
	});
	
	 $(document).ready(function(){
			$('.edit').hide();   
			$(".edit_Pro_button").each(function(index){ 
		      $(this).click(function(){ 
		         	$(".edit").not(index).hide(); 
		        	$(".edit").eq(index).show();
		        });
		        $(this).dblclick(function(){ 
		            $(".edit").eq(index).hide(); 
		        });
		    });
	 });

	
	 	 function popup_win4(no) {  		 
	 window.open("${ pageContext.request.contextPath }/faq/update.do?no=" + no, "", "width=500, height=500,top=180 ,left=100, location=1");
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
	<div style="margin-top:130px">
	 <div id="cs_center">
        <div id="cs_float">
            <p ><strong  style="font-size:18px">TEL.</strong><span><sub style="font-size:35px"><strong>1544-7199</strong></sub></span></p>
          <br/>
           <p style="font-size:12px" >&nbsp;&nbsp;- 평일 09:00~18:00 (점심 12:00~13:00)<br/>&nbsp;&nbsp;- 토, 일, 공휴일 휴무 </p>
        </div>      
        <div id="sc_menu">
        <ul>
            <li><span style="font-size:18px"><strong>1:1Q&A</strong></span>&nbsp;<a href="${pageContext.request.contextPath }/qna/insertQna.do">1:1문의하기</a></li>
            <li><span style="font-size:18px"><strong>FAQ</strong></span>&nbsp;자주 묻는 질문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
             <li><span style="font-size:18px"><strong>NOTICE</strong></span>&nbsp;공지사항&nbsp;&nbsp;&nbsp;</li>
            <li><span style="font-size:18px"><strong>&nbsp;MY QUESTION</strong></span>&nbsp;내질문</li>
             <li><span style="font-size:18px"><strong>FIND ID</strong></span>&nbsp;아이디찾기</li>
             <li><span style="font-size:18px"><strong>&nbsp;FIND PW</strong></span>&nbsp;비밀번호찾기&nbsp;&nbsp;</li>
        </ul>
       </div>
    </div>
    <br/>
		<form action="${pageContext.request.contextPath }/qna/QnAList.do">
			<table border="1" id="mainbar">
				<tr>
					<th><a
						href="${pageContext.request.contextPath }/qna/QnAList.do?search_option_date=allNEW&search_option=all&search_keyword=">전체</a></th>
					<th><a
						href="${pageContext.request.contextPath }/qna/QnAList.do?search_option_date=allNEW&search_option=all&search_keyword=회원">회원</a></th>
					<th><a
						href="${pageContext.request.contextPath }/qna/QnAList.do?search_option_date=allNEW&search_option=all&search_keyword=주문+결제">상품/결제</a></th>
					<th><a
						href="${pageContext.request.contextPath }/qna/QnAList.do?search_option_date=allNEW&search_option=all&search_keyword=적립금+쿠폰">적립금/쿠폰</a></th>
				</tr>
			</table>
			<table  id="mainTable" style="margin-top:20px;">
				<tr>
					<td colspan="3">&nbsp;<select name="search_option_date">
							<option value="allNEW"
								<c:if test="${search_option_date == 'allNEW' }">selected</c:if>>최신순</option>
							<option value="allOLD"
								<c:if test="${search_option_date == 'allOLD' }">selected</c:if>>오래된순</option>
					</select> <select name="search_option">
							<option value="all"
								<c:if test="${search_option == 'all' }">selected</c:if>>전체</option>
							<option value="title"
								<c:if test="${search_option == 'title' }">selected</c:if>>제목</option>
							<option value="content"
								<c:if test="${search_option == 'content' }">selected</c:if>>내용</option>
							<option value="no"
								<c:if test="${search_option == 'no' }">selected</c:if>>글번호</option>
					</select> <input type="search" name="search_keyword"
						value="${ search_keyword}"> <input type="submit"
						value="SEARCH">
						<input type="button" onclick="insert()" id="edit" value="등록"> 
							</td>
				</tr>
				<tr>
					<th style="width: 150px; text-align: center;">No</th>
					<th style="text-align: center">content</th>
				</tr>
				<c:forEach var="list" items="${items }">
					<tr>
						<td style="text-align: center" >${list.no }</td>
						<td class="question">${list.title }</td>
					</tr>
					<tr>
						<td colspan="2" class="answer" style="height:300px">${list.content}<br/>
						<input onclick="popup_win4('${list.no}')" type="button" value="편집"></td>
					</tr>
					<tr>
						<td colspan="2" class="edit" ><textarea name="content" cols="70" rows="10"></textarea></td>
					</tr>
				</c:forEach>
			</table>
		</form><br/>
	</div>
	</section>
	<div style="margin-top: 100px">
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
	</div>
</body>
</html>