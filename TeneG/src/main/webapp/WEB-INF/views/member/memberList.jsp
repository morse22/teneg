 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
	function doAction(memberId) {
		location.href = "${ pageContext.request.contextPath }/member/memberDetail.do?id=" + memberId;
	}
	
	function psChange(obj){
		location = "${pageContext.request.contextPath}/member/memberList.do?pc=" + obj.value + "&page=1&sort=${param.sort}";
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
		var id = $(".id");
		var queryText = "";
		table.each(function(index, element){
			if($(element).is(":checked")){
				queryText += id.eq(index).text() + ",";
			}
		});
		if(queryText == ""){
			alert("추방 할 회원을 선택하세요!");
			return;
		}else{
			if(confirm("추방 하시겠습니까?")){
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
		
 		location = "${ pageContext.request.contextPath }/member/memberList.do?pc=${param.pc}&page=1&sort=" + "${sort}" + 
				"&period=" + period + "&searchType=" + searchType + "&searchText=" + searchText;
		
		// 검색기간 : all, today, week, month
		// 검색타입 : writer, content, title
	}
	
	function onChangeSortType(data){
		location = "${ pageContext.request.contextPath }/member/memberList.do?pc=${param.pc}&page=1&sort=" + data.value;
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
	<div align="center" style="margin-top: 50px;">
		<div>
			<a href="${ pageContext.request.contextPath }/member/memberList.do?pc=11&page=1"><img src="${ pageContext.request.contextPath }/img/banner.png"/></a>
		</div>
	</div>
	
	<section>
		<hr width="100%"/>  <h2>회원 목록</h2>  <hr width="100%"/><br/>
		<div align="center">
			<div style="width:70%" align="right">
				<span style="font-weight: bold; text-align:left;">새로운 회원 : <span style="color:rgb(255,90,20);">${ newBoardCount }</span>/${ totalCount }명</span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				정렬 
				<select id="pSort" onchange="onChangeSortType(this)">
					<option value="regDate" selected>최신순</option>
					<option value="egg">egg순</option>
					<option value="birth">생일순</option>
				</select>&nbsp;&nbsp;&nbsp;
				회원 수 
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
						<th><input type="checkbox" id="mainCheckBox" onchange="mainCheckBoxChange(this)"/></th>
						<th>ID</th>
						<th>이름</th>
						<th>PW</th>
						<th>가입일자</th>
						<th>핸드폰</th>
						<th>주소</th>
						<th>E-mail</th>
						<th>회원등급</th>
						<th>egg</th>
						<th>회원점수</th>
						<th>생일</th>
						<th>성별</th>
						<th>자기소개</th>
						<th>핸드폰알람</th>
						<th>전문가</th>
					</tr>
					
					<c:forEach var="member" items="${ list }" varStatus="cnum">
						<tr>
							<td>
								<input type="checkbox" class="select"/>
							</td>
							<td class="id">${ member.id }</td>
							<td>${member.name}</td>
							<td>${member.password}</td>
							<td>${member.regDate}</td>
							<td>${member.phone}</td>
							<td>${member.addr}</td>
							<td>${member.email}</td>
							<td>${member.memberGrade}</td>
							<td>${member.egg}</td>
							<td>${member.memberScore}</td>
							<td>${member.birth}</td>
							<td>${member.sex}</td>
							<td>${member.introduce}</td>
							<td>${member.phoneAlarm}</td>
							<td>${member.expert}</td>					
						</tr>
					</c:forEach>	
				</table>
			</div>
			<ul class="pagination">
				<c:if test="${cpage ne 1}" >			<!-- 현재페이지가 1이 아니면 -->	<!-- 첫 페이지로 이동 -->
					<li><a href="${ pageContext.request.contextPath }/member/memberList.do?page=${cpage -1}&pc=${pCount}&sort=${sort}">&laquo;</a></li>	
				</c:if>
				<c:forEach var="i" begin="1" end="${ pageSize }">
					<li><a href="${ pageContext.request.contextPath }/member/memberList.do?page=${i}&pc=${pCount}&sort=${sort}">${i}</a></li>
				</c:forEach>
				<c:if test="${cpage ne pageSize}" >		<!-- 현재페이지가 마지막페이지가 아니면 -->	<!-- 마지막 페이지로 이동 -->
					<li><a href="${ pageContext.request.contextPath }/member/memberList.do?page=${cpage +1}&pc=${pCount}&sort=${sort}">&raquo;</a></li>
				</c:if>
			</ul>
			
			<div align="center">
			 	<select name="period" id="period">
			 		<option value="all">전체기간</option>
			 		<option value="today">오늘</option>
			 		<option value="week">최근1주</option>
			 		<option value="month">최근1달</option>
			 	</select>
			 	<select name="searchType" id="searchType">
			 		<option value="id">id</option>
			 		<option value="egg">egg</option>
			 		<option value="expert">전문가</option>
			 		<option value="name">이름</option>
			 	</select>
			 	
			 	<input type="text" size=30 id="txtSearch"/>
			 	<button onclick="onClickSearch()">
			 		<span class="glyphicons">검색</span>
			 	</button><br/><br/>
			 	<button onclick="onClickDelete()" class="btn">
					<span class="glyphicon glyphicon-trash">삭제</span>
				</button>
			</div>
		</div>
	</section><br/>
	<form style="display: hidden" action="${ pageContext.request.contextPath }/member/deleteList.do" method="POST" id="deleteForm">
 		<input type="hidden" id="query" name="query" value="" />
 	</form>
	
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>