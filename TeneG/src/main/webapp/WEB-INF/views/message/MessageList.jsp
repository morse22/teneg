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
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
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
	            location.reload();
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
	 $(document).ready(function(){
		 $(".question").each(function(index){
			$(this).click(function(){
				var no = $('.no').eq(index).val();
		 		$.ajax({
					type : "put",
					url : "${pageContext.request.contextPath}/msg/update/"+no,
					headers:{
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
					
					}),
					dataType: "text",
					success : function(result){
						
					}
				}); 
			});	
		 });
	 });
	$(document).ready(function() {
		$(".question").each(function(index) {
			$(this).click(function() {
				var id = $('#id').val();
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/msg/count.do",
					success : function(data) {
						$('#msgcount').html(data);
						

					}
				});
			});
		});
	});
	
	$(document).ready(function() {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/msg/count.do",
			success : function(data) {
				$('#msgcount').html(data);

			}
		});
	});
	$(document).ready(function() {
		$(".question").each(function(index) {
			$(this).click(function() {
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/msg/count2.do",
					success : function(data) {
						$('#msgcount2').html(data);

					}
				});
			});
		});
	});
	
	$(document).ready(function() {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/msg/count2.do",
			success : function(data) {
				$('#msgcount2').html(data);

			}
		});
	});

	$(document).ready(function() {
	 	$("#th_checkAll").click(function(){ 
			if($("#th_checkAll").prop("checked")) {		
					$("input[type=checkbox]").prop("checked",true); 			
			}else { 
				$("input[type=checkbox]").prop("checked",false);
			}	
		}); 		
	});	
		function checkboxArr(){
			var list=[];
			$("input[class='test_check']:checked").each(function(i){
				list.push($(this).val());
			});	
			
			var date = {
				"list" : list
			};
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/msg/deletemsg.do",
				data : {
					lists : list
				},
				dataType : "text",
				success : function(result) {
					window.location.reload();		
				}
			});
		}	
	

	 
	function popup_win4() {  		 
	window.open("${pageContext.request.contextPath}/message/insert.do", "", "width=500, height=500,top=180 ,left=100, location=1");
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
			<form action="${pageContext.request.contextPath }/message/list.do">
		<table border="1" id="mainbar" style="margin-top: 100px">
			<tr>
				<th><a
					href="${pageContext.request.contextPath }/message/list.do?search_option_date=allNEW&search_option=all&search_keyword=">전체</a></th>
				<th><a
					href="${pageContext.request.contextPath }/message/list.do?search_option_date=allNEW&search_option=recipient&search_keyword=${sessionScope.id}">받은메시지</a></th>
				<th><a
					href="${pageContext.request.contextPath }/message/list.do?search_option_date=allNEW&search_option=sender&search_keyword=${sessionScope.id}">보낸메시지</a></th>
				<th><a
					href="${pageContext.request.contextPath }/message/list.do?search_option_date=allNEW&search_option=all&search_keyword=적립금+쿠폰">보관함</a></th>
			</tr>
		</table>
			<table  id="mainTable" style="margin-top:20px;">
				<tr>
					<td colspan="7">&nbsp;<select name="search_option_date">
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
							<option value="sender"
								<c:if test="${search_option == 'sender' }">selected</c:if>>보낸사람</option>
							<option value="recipient"
								<c:if test="${search_option == 'recipient' }">selected</c:if>>보낸사람</option>	
							
					</select> 
					<input type="search" name="search_keyword"
						value="${ search_keyword}"> <input type="submit"
						value="SEARCH">
						<input type="button" onclick="popup_win4()" id="edit" value="등록"> 
						<input type="button" onclick="checkboxArr()" value="삭제">
						<span style="color: red" id="msgcount"></span>/<span id="msgcount2"></span>
							</td>
				</tr>
				<tr>
					<th style="width: 150px; text-align: center;">No</th>
					<th style="text-align: center; width: 45%;" >제목</th>
					<th style="text-align: center">보낸사람</th>
					<th style="text-align: center">받는사람</th>
					<th style="text-align: center">보낸시간</th>
					<th style="text-align: center">삭제하기<input  type="checkbox" id="th_checkAll"></th>
					<th style="text-align: center">수신여부</th>
				</tr>
				<c:forEach var="list" items="${items }">
					<tr>
						<td style="text-align: center; width: 7%;" ><input type="hidden" class="no" value="${list.no }">${list.no }</td>
						<td class="question"><input name="title" type="hidden" value="${list.title }">${list.title }</td>
						<td style="text-align:center">${list.sender }</td>
						<td style="text-align:center">${list.recipient }</td>
						<td style="text-align:center">${list.regDate}</td>
						<td style="text-align:center" ><input type="checkbox" value="${list.no }" class="test_check" name="test_check"></td>
						<td style="text-align:center">
							<c:choose>
								<c:when test="${list.mgLevel == '1'  }">
									<span>전송완료</span>
								</c:when>
								<c:when test="${ list.readCheck  == 'Y' }">
									<span>읽음</span>
								</c:when>
								<c:when test="${ list.readCheck  == 'N' }">
									<span style="color: red">안읽음</span>
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr class="answer">
						<td colspan="7"  style="height:300px">${list.content}
						<input type="button" class="contein" value="저장"></td>
					</tr>
					
				</c:forEach>
			</table>
		</form><br/>		
	
			<div align="center">

			<c:if test="${page.curPage > 1 }">
				<a
					href="${ pageContext.request.contextPath }/message/list.do?curPage=1&search_option=${search_option}&search_keyword=${search_keyword}">[처음]</a>&nbsp;
			</c:if>
			<c:if test="${page.curBlock > 1 }">
				<a
					href="${ pageContext.request.contextPath }/message/list.do?curPage=${page.prevPage}&search_option=${search_option}&search_keyword=${search_keyword}">[이전]</a>&nbsp;
				</c:if>
			<c:forEach var="pageNum" begin="${page.startBlock }"
				end="${page.endBlock }">
				<c:choose>
					<c:when test="${pageNum == page.curPage }">
						<span style="color: black">[${pageNum}]</span>
					</c:when>
					<c:otherwise>
						<a
							href="${ pageContext.request.contextPath }/message/list.do?curPage=${pageNum}&search_option=${search_option}&search_keyword=${search_keyword}">[${pageNum}]</a>&nbsp;
			</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.curBlock <= page.totBlock }">
				<a
					href="${ pageContext.request.contextPath }/message/list.do?curPage=${page.nextPage}&search_option=${search_option}&search_keyword=${search_keyword}">[다음]</a>&nbsp;
			</c:if>
			<c:if test="${page.curPage < page.totPage }">
				<a
					href="${ pageContext.request.contextPath }/message/list.do?curPage=${page.totPage}&search_option=${search_option}&search_keyword=${search_keyword}">[끝]</a>&nbsp;
			</c:if>
		</div>		
	</section>
	<div style="margin-top: 100px">
		<footer>
			<jsp:include page="/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>