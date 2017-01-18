<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
	function psChange(obj){
		location = "${pageContext.request.contextPath}/board/list.do?pc=" + obj.value + "&page=1&sort=${param.sort}";
	}
	
	$(document).ready(function(){
		$("#pCount").val("${ pCount }").prop("selected", true);
		$("#pSort").val("${ sort }").prop("selected", true);
		$("#period").val("${ period }").prop("selected", true);
		$("#searchType").val("${ searchType }").prop("selected", true);
		$("#txtSearch").val("${param.searchText}");
	});
	
	function mainCheckBoxChange(obj){
		var table = $(".select");
		table.each(function(index, element){
			$(element).prop("checked", ($(obj).is(":checked")) ? true : false);
		});
	}
	
	function onClickDelete(){
		var table = $(".select");
		var number = $(".number");
		var queryText = "";
		table.each(function(index, element){
			if($(element).is(":checked")){
				queryText += number.eq(index).text() + ",";
			}
		});
		if(queryText == ""){
			alert("삭제 할 게시물을 선택하세요!");
			return;
		}else{
			if(confirm("삭제 하시겠습니까?")){
				queryText = queryText.substr(0, queryText.length-1);
				$("#query").val(queryText);
				$("#deleteForm").submit()
			}
		}
	}
	
	
	function onClickSearch(){
			
		var searchText = $("#txtSearch").val();
		var period = $("#period").val();
		var searchType = $("#searchType").val();
		
 		location = "${ pageContext.request.contextPath }/board/list.do?pc=${param.pc}&page=1&sort=" + "${sort}" + 
				"&period=" + period + "&searchType=" + searchType + "&searchText=" + searchText;
		
		// 검색기간 : all, today, week, month
		// 검색타입 : writer, content, title
	}
	
	function onChangeSortType(data){
		location = "${ pageContext.request.contextPath }/board/list.do?pc=${param.pc}&page=1&sort=" + data.value;
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
	<div align="center" style="margin-top: 50px;">
		<div>
			<a href="${ pageContext.request.contextPath }/board/list.do?pc=11&page=1"><img src="${ pageContext.request.contextPath }/img/banner.png"/></a>
		</div>
	</div>
	
	<div style="position:fixed; top:300px; left:30px;">
		<a href="http://store.musinsa.com/app/" target="_blank"><img src="${ pageContext.request.contextPath }/img/ad3.png"/></a><br/>
		<a href="#"  style="text-decoration: none;">광고문의</a>
	</div>
	<div style="position:fixed; top:300px; left:87%;">
		<a href="http://www.bitacademy.com/" target="_blank"><img src="${ pageContext.request.contextPath }/img/ad2.png"/></a><br/>
		<a href="#" style="text-decoration: none;">광고문의</a>
	</div>
	
	<section>
		<div align="center">
			<div style="width:70%; margin-top: 40px; margin-bottom: 10px;" align="left">
				<span style="font-size: 13pt; color:black; font-weight: bold;">자유게시판</span>
				<span style="font-size: 9pt; color:black;">TeneG 사용자 분들을 위한 자유로운 커뮤니티 공간입니다.</span>
			</div>
			<div style="width:70%" align="right">
				<span style="font-weight: bold; text-align:left;">새글 : <span style="color:rgb(255,90,20);">${ newBoardCount }</span>/${ totalCount }개</span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				정렬 
				<select id="pSort" onchange="onChangeSortType(this)">
					<option value="no" selected>최신순</option>
					<option value="hit">조회순</option>
					<option value="good">추천순</option>
				</select>&nbsp;&nbsp;&nbsp;
				게시물 수 
				<select onchange="psChange(this)" id="pCount">
					<option value="3">3</option>
					<option value="5" selected>5</option>
					<option value="7">7</option>
					<option value="9">9</option>
					<option value="11">11</option>
				</select>
			</div>
			<br/>
			<div style="width:70%;">
			<table class="table" id="listTable">
				<tr>
					<th width="5%" style="text-align: center;"><input type="checkbox" id="mainCheckBox" onchange="mainCheckBoxChange(this)"/></th>
					<th width="7%" style="text-align: center; color:rgb(34, 34, 34);">글번호</th>
					<th width="50%" style="text-align: center; color:rgb(34, 34, 34);">제목</th>
					<th width="10%" style="text-align: center; color:rgb(34, 34, 34);">글쓴이</th>
					<th width="7%" style="text-align: center; color:rgb(34, 34, 34);">등록일</th>
					<th width="5%" style="text-align: center; color:rgb(34, 34, 34);">조회</th>
					<th width="5%" style="text-align: center; color:rgb(34, 34, 34);">추천</th>
				</tr>
				
				<!-- 공지, 안내 게시물 출력 -->
				<c:forEach var="notiInfo" items="${notiInfoList }">						
					<tr>
						<td></td>
 						<c:choose>
							<c:when test="${ notiInfo.type eq 'noti'}">
								<td style="text-align: center;"><img src="${ pageContext.request.contextPath }/img/noti.png"/></td>
							</c:when>
							<c:when test="${ notiInfo.type eq 'info'}">
								<td style="text-align: center;"><img src="${ pageContext.request.contextPath }/img/info.png"/></td>
							</c:when>
						</c:choose>										
						<td>
						<a 
							<c:choose>
								<c:when test="${ notiInfo.type eq 'noti'}">
									style="font-size:12pt; font-weight:bold; color:rgb(220, 0, 0);"
								</c:when>
								<c:when test="${ notiInfo.type eq 'info'}">
									style="font-size:12pt; font-weight:bold; color:rgb(255, 120, 200);"
								</c:when>
							</c:choose>
						href="${ pageContext.request.contextPath }/board/${param.page}/${ param.pc }/detail.do/${ notiInfo.no }">
						<img src="${ pageContext.request.contextPath }/img/imageMobileLoaded.png"/>
						<c:out value="${ notiInfo.title }"/></a>
						<span style="font-weight: bold; color:rgb(255, 130, 20);">[${ notiInfo.replyCount }]</span>
						<img src="${ pageContext.request.contextPath }/img/imageFileLoaded.png"/>
						<img src="${ pageContext.request.contextPath }/img/imageloaded.png"/>
						<c:if test="${ board.isNew eq 'Y' }">
							<img src="${ pageContext.request.contextPath }/img/newImage.png"/>
						</c:if></td>
						
<%-- 					<c:if test="${ empty member }">
						<td><a href="<%= request.getContextPath() %>/login/login.do"><c:out value="${ list.get(i).getTitle() }"/></a></td>
						</c:if> --%>
						
						<td style="text-align: center;">
							<c:choose>
								<c:when test="${ notiInfo.type eq 'noti'}">
									<img src="${ pageContext.request.contextPath }/img/cat.png"/> ${ notiInfo.writer }
								</c:when>
								<c:when test="${ notiInfo.type eq 'info'}">
									<img src="${ pageContext.request.contextPath }/img/master.png"/> ${ notiInfo.writer }
								</c:when>
							</c:choose>
						</td>
						<td style="text-align: center;"><c:out value="${ notiInfo.regDate }"/></td>
						<td style="text-align: center;"><c:out value="${ notiInfo.hit }"/></td>
						<td style="text-align: center;"><c:out value="${ notiInfo.goodCount }"/></td>
					</tr>
				</c:forEach>		
				
				<!-- 일반게시물 출력 -->
				<c:forEach var="board" items="${ list }" varStatus="cnum">
					<tr>
						<td style="text-align: center;">
							<c:if test="${ board.type ne 'noti' and board.type ne 'info'}">
								<input type="checkbox" class="select"/>
							</c:if>
						</td>
 						<c:choose>
							<c:when test="${ board.type eq 'noti'}">
								<td style="text-align: center;"><img src="${ pageContext.request.contextPath }/img/noti.png"/></td>
							</c:when>
							<c:when test="${ board.type eq 'info'}">
								<td style="text-align: center;"><img src="${ pageContext.request.contextPath }/img/info.png"/></td>
							</c:when>
							<c:otherwise>
								<td style="text-align: center;" class="number"><c:out value="${ board.no }"/></td>
							</c:otherwise>
						</c:choose>										
						<td>
						<a 
							<c:choose>
								<c:when test="${ board.type eq 'noti'}">
									style="font-size:12pt; font-weight:bold; color:rgb(220, 0, 0);"
								</c:when>
								<c:when test="${ board.type eq 'info'}">
									style="font-size:12pt; font-weight:bold; color:rgb(255, 120, 200);"
								</c:when>
								<c:otherwise>
									style="color:black;"
								</c:otherwise>
							</c:choose>
						href="${ pageContext.request.contextPath }/board/${param.page}/${ param.pc }/detail.do/${ board.no }">
						<img src="${ pageContext.request.contextPath }/img/imageMobileLoaded.png"/>
						<c:out value="${ board.title }"/></a>
						<span style="font-weight: bold; color:rgb(255, 130, 20);">[${ board.replyCount }]</span>
						<img src="${ pageContext.request.contextPath }/img/imageFileLoaded.png"/>
						<img src="${ pageContext.request.contextPath }/img/imageloaded.png"/>
						<c:if test="${ board.isNew eq 'Y' }">
							<img src="${ pageContext.request.contextPath }/img/newImage.png"/>
						</c:if></td>
						
<%-- 					<c:if test="${ empty member }">
						<td><a href="<%= request.getContextPath() %>/login/login.do"><c:out value="${ list.get(i).getTitle() }"/></a></td>
						</c:if> --%>
						
						<td style="text-align: center;">
							<c:choose>
								<c:when test="${ board.type eq 'noti'}">
									<img src="${ pageContext.request.contextPath }/img/cat.png"/> ${ board.writer }
								</c:when>
								<c:when test="${ board.type eq 'info'}">
									<img src="${ pageContext.request.contextPath }/img/master.png"/> ${ board.writer }
								</c:when>
								<c:otherwise>
									<img src="${ pageContext.request.contextPath }/img/mouse.png"/> ${ board.writer }
								</c:otherwise>
							</c:choose>
						</td>
						<td style="text-align: center;"><c:out value="${ board.regDate }"/></td>
						<td style="text-align: center;"><c:out value="${ board.hit }"/></td>
						<td style="text-align: center;"><c:out value="${ board.goodCount }"/></td>
					</tr>
				</c:forEach>	
			</table>
			</div>
			<ul class="pagination">
				<c:if test="${cpage ne 1}" >
					<li><a href="${ pageContext.request.contextPath }/board/list.do?page=${cpage -1}&pc=${pCount}&sort=${sort}">&laquo;</a></li>
				</c:if>
				<c:forEach var="i" begin="1" end="${ pageSize }">
					<li><a href="${ pageContext.request.contextPath }/board/list.do?page=${i}&pc=${pCount}&sort=${sort}">${i}</a></li>
				</c:forEach>
				<c:if test="${cpage ne pageSize}" >
					<li><a href="${ pageContext.request.contextPath }/board/list.do?page=${cpage +1}&pc=${pCount}&sort=${sort}">&raquo;</a></li>
				</c:if>
			</ul>
			
			<div align="center">
				 <c:if test="${ not empty member }">
				 </c:if>
				 	<select name="period" id="period">
				 		<option value="all">전체기간</option>
				 		<option value="today">오늘</option>
				 		<option value="week">최근1주</option>
				 		<option value="month">최근1달</option>
				 	</select>
				 	<select name="searchType" id="searchType">
				 		<option value="content">내용</option>
				 		<option value="title">글제목</option>
				 		<option value="writer">글쓴이</option>
				 		<option value="no">글번호</option>
				 	</select>
				 	
				 	
				 	<input type="text" size=30 id="txtSearch"/><button onclick="onClickSearch()">
				 	<span class="glyphicons">검색</span></button><br/><br/>
					<button onclick="location='<%= request.getContextPath() %>/board/write.do'" class="btn">
						<span class="glyphicons glyphicon-pencil">글쓰기</span>
					</button>
					<button onclick="onClickDelete()" class="btn">
						<span class="glyphicon glyphicon-trash">삭제</span>
					</button>
			</div>
		</div>
	</section><br/>
 	<form style="display: hidden" action="${ pageContext.request.contextPath }/board/deleteList.do" method="POST" id="deleteForm">
 		<input type="hidden" id="query" name="query" value="" />
 	</form>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</head>
</html>




