<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대기리스트</title>
<!-- 이거있어야 메뉴됨 -->
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

.list {
	position: relative;
}

.list .overImg {
	position: absolute;
	display: none;
	top: 0;
}

.list p {
	position: absolute;
	top: 5px;
	left: 20px;
	color: #fff;
	background-color: hsla(360, 100%, 0%, 0.5);
	font-size: 14pt;
}

.list p.premium {
	position: absolute;
	top: 5px;
	left: 210px;
	color: #fff;
	background-color: rgb(255, 0, 0);
	font-size: 10pt;
}

.list p.isRequested {
	position: absolute;
	top: 35px;
	left: 200px;
	color: #fff;
	background-color: rgb(255, 200, 14);
	font-size: 10pt;
}

.img1:hover{
	opacity:0.4;
}

.clickIamge:hover{
	opacity:0.7;
}

</style>
</head>
<script>

	function onChangeField(){
			location="${pageContext.request.contextPath}/request/dlist.do?field=" + $("#fieldSelect option:selected").val();
	}
	
	$(document).ready(function(){
		$("#fieldSelect").val("${param.field}");
	});
	
	var moreCount = 0;
	var pageCount = 12;
	var field = "";
	function onClickMoreResult(){
		moreCount++;
		start = moreCount * pageCount + 1;
		end = start + 11;
		field = $("#fieldSelect option:selected").val();
		
        $.ajax({
            type : "post",
            url : "${ pageContext.request.contextPath }/test.do",
            data : {
                "start" : start,
                "end" : end,
                "field" : field,
                "id": "${loginUser.id}"
             }, 
            success : function(data) {
				for(var i in data){
					var filePath = "";
					switch(data[i].field){
					case "c" :
						filePath = '<img src="${ pageContext.request.contextPath }/img/c.png" style="height: 180px; width: 250px;" class="img1" />'
						break;
					case "java" :
						filePath = '<img src="${ pageContext.request.contextPath }/img/java.png" style="height: 180px; width: 250px;" class="img1" />'
						break;
					case "python" :
						filePath = '<img src="${ pageContext.request.contextPath }/img/python.png" style="height: 180px; width: 250px;" class="img1" />'
						break;
					case "cpp" :
						filePath = '<img src="${ pageContext.request.contextPath }/img/cplusplus.png" style="height: 180px; width: 250px;" class="img1" />'
						break;
					case "php" :
						filePath = '<img src="${ pageContext.request.contextPath }/img/php.png" style="height: 180px; width: 250px;" class="img1" />'
						break;
					}
					var text1 = '<div class="col-md-3 col-sm-6 hero-feature" class="itemObj">' + 
					'<div class="thumbnail">' + 
					'<div class="gig-price">' + 
						'<div class="list">' + 
							'<a href="${ pageContext.request.contextPath }/request/detail.do?no=' +  data[i].no +'&id=' + '${loginUser.id}' + '">' + 
							filePath + 	'</a>' + 
							'<img style="position:absolute; top:135px; left:180px; border-radius: 50px; height: 60px; width: 60px;" src="${ pageContext.request.contextPath }/img/test3.png"/>' + 	
							'<p class="money">&nbsp;<i class="fa fa-krw"></i>&nbsp;' +data[i].price + '&nbsp;</p>';
							
							if(data[i].isNew == 'Y') text1 = text1 + '<p class="premium">&nbsp;New&nbsp;</p>';
							if(data[i].isRequested != 'N')	text1 = text1 + '<p class="isRequested">&nbsp;수락함&nbsp;</p>';
							
							var text2 = '</div>' + 
							'</div>' + 
							'<div class="caption">' + 
								'<p style="color:blue;">[' + data[i].no + ']</p>' + 
								'<h5 style="font-weight: bold;">' + data[i].title + '</h5>' + 
								'<p>' + data[i].id + '</p>' + 
								'<div class="rating">' + 
									'<span>' + data[i].regDate + '</span>' + 
								'</div>' + 
							'</div>' + 
						'</div>' + 
					'</div>';
					
					text1 = text1 + text2;
					$("#listdiv").append(text1);
				}
            },
         }); 
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
	<div align="center" style="margin-top: 100px; margin-bottom: 80px;">
	<div style="width:60%; min-height: 600px;">
		<div align="left">
			<span style="font-size: 15pt;">의뢰목록</span>
			<select id="fieldSelect" onchange="onChangeField()">
				<option value="all" selected>전체</option>
				<option value="c">C</option>
				<option value="cpp">C++</option>
				<option value="java">JAVA</option>
				<option value="php">PHP</option>
				<option value="python">PYTHON</option>
			</select>
		</div>
		<div class="row text-center" id="listdiv">
			<c:forEach var="request" varStatus="status" items="${ list }">
				<div class="col-md-3 col-sm-6 hero-feature" class="itemObj">
					<div class="thumbnail">
						<div class="gig-price">
							<div class="list">
								<a href="${ pageContext.request.contextPath }/request/detail.do?no=${request.no}&id=${loginUser.id}">
									<c:if test="${ request.field eq 'c' }">
										<img src="${ pageContext.request.contextPath }/img/c.png" style="height: 180px; width: 250px;" class="img1" />
									</c:if>
									<c:if test="${ request.field eq 'java' }">
										<img src="${ pageContext.request.contextPath }/img/java.png" style="height: 180px; width: 250px;" class="img1" />
									</c:if>
									<c:if test="${ request.field eq 'python' }">
										<img src="${ pageContext.request.contextPath }/img/python.png" style="height: 180px; width: 250px;" class="img1" />
									</c:if>
									<c:if test="${ request.field eq 'cpp' }">
										<img src="${ pageContext.request.contextPath }/img/cplusplus.png" style="height: 180px; width: 250px;" class="img1" />
									</c:if>
									<c:if test="${ request.field eq 'php' }">
										<img src="${ pageContext.request.contextPath }/img/php.png" style="height: 180px; width: 250px;" class="img1" />
									</c:if>				
								</a>
								<img style="position:absolute; top:135px; left:180px; border-radius: 50px; height: 60px; width: 60px;" src="${ pageContext.request.contextPath }/img/test3.png"/>		
								<p class="money">&nbsp;<i class="fa fa-krw"></i>&nbsp;${request.price}&nbsp;</p>
								<c:if test="${ request.isNew eq 'Y' }">
									<p class="premium">&nbsp;New&nbsp;</p>
								</c:if>
								<c:if test="${ request.isRequested ne 'N'}">
									<p class="isRequested">&nbsp;수락함&nbsp;</p>
								</c:if>		
							</div>
						</div>
						<div class="caption">
							<p style="color:blue;">[${request.no}]</p>
							<h5 style="font-weight: bold;">${request.title}</h5>
							<p>${request.id}</p>
							<div class="rating">
								<span>${ request.regDate }</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="margin-top: 30px;">
			<button style="height: 30px; width: 500px; color:black;" onclick="onClickMoreResult()">결과 더보기</button>
		</div>
	</div>
	</div>
	
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>




