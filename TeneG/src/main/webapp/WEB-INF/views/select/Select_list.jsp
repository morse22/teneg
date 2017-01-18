<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/css/layout-teneg.css" rel="stylesheet"/>
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<style type="text/css">	
img:hover{
	opacity:0.4;
}
</style>
<script>
 function selectpop(id){
	 window.open("${ pageContext.request.contextPath }/select/selectForm.do?id=" + id, "", "width=500, height=500,top=180 ,left=100, location=1");
 }
 $(document).ready(function(){
	$.ajax({
		type:"post",
		url:"${ pageContext.request.contextPath }/select/select_count.do",
		success:function(data){
			$('#select_count').html(data);
		}
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

<fieldset style="margin-top : 100px; margin-left: auto; margin-right: auto; border: 1px solid #bbb; width: 1200px; height: auto;">	
<form>	
<div style="width: 1200px; height: 45px; border-bottom: 1px solid #bbb;">
		<table  style="margin-top:10px; margin-right: auto; margin-left: 10px;">
				<tr>
					<td colspan="7">&nbsp;<select name="search_option">
							<option value="all"
								<c:if test="${search_option == 'all' }">selected</c:if>>전체</option>
							<option value="expertid"
								<c:if test="${search_option == 'expertid' }">selected</c:if>>아이디</option>
							<option value="field"
								<c:if test="${search_option == 'field' }">selected</c:if>>분야</option>
					</select> 
					<input  type="search" name="search_keyword" value="${ search_keyword}"> 
					<button type="submit" class="btn btn-primary btn-xs" style="height: 26px; margin-bottom:5px;">SEARCH</button>
					<span style="font-size: 12px; margin-left: 720px;">내가찜한전문가
						(<b id="select_count" style="color:#75a5ff;"></b>)</span>
					</td>
				</tr>
			</table>	
		</div>	
</form>
	<div style="margin-top: 15px;">
	<div class="container">
<div class="row text-center">
		<c:forEach var="list" items="${item}">
			<div class="col-md-3 col-sm-6 hero-feature" class="itemObj">
					<div class="thumbnail">
						<div class="gig-price">
							<a href="#" onclick="selectpop('${ list.expertid }')">							
							<img src="${ pageContext.request.contextPath }/expertFile/${list.titleImage}" style="height: 180px; width: 250px;" class="img1" />
							</a>
						</div>
						<div class="caption">
							<h5 style="font-weight: bold;">${list.expertid}</h5>
							<p>${list.field}</p>
						</div>
					</div>
				</div>
		</c:forEach>
</div>
</div>
</div>
</fieldset>
</section>		
<div style="margin-top: 100px">
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</div>
</body>
</html>