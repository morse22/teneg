<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.theme.min.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
* {
	margin-left: auto;
	margin-right: auto;
}

section {
	margin-top: 150px;
	/* 	margin-left: 25%; */
}

.auction {
	width: 800px;
	min-height: 700px;
	/* background-color: #c1c1c1; */
}

li {
	font-size: 12px;
}
</style>
<script type="text/javascript">

	function getPrice(no) {
		var price = $(":input:text[name=price]").val();
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/auction/auctionCheck.do/"+no,
			success : function(data) {
							
				if(price < data){
					$("#aForm").submit();	
					alert("경매에 참여하였습니다.");
				}
				else{
					alert("현재 낙찰가보다 높습니다. 다시 참여해주세요.");
				}
			}
		});

	}
	
	$(document).ready(function(){
		$("#auctionTable").hide();
	});
	
	var flag = "out";
	function sideTab(){
		if(flag == "out"){
			flag = "in";
			$("#auctionTab").animate({
				left: "300px"
			});
			$("#auctionTable").animate({
				width : "300px"
			});
			$("#auctionTable").show();
		}else{
			flag = "out";
			$("#auctionTab").animate({
				left: "0px"
			});
			$("#auctionTable").animate({
				width : "0px"
			});
			$("#auctionTable").hide(300);
		}
	}
	
/* 	function addData(){
		var row = 			
		'<tr>' +
		'<td style="text-align: center;">331</td>' +
		'<td style="text-align: center;">jsh007</td>' +
		'<td style="text-align: center;">12000</td>' +
		'<td style="text-align: center;"><button>수락</button></td>' +
		'</tr>';
		$("#auctionTable > tbody:last").append(row);
	} */
	
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
	
	<div style="height: 100px; width: 30px; background-color: rgb(200, 200, 200); position:fixed; top:360px; left: 0px; 
			text-align: center; vertical-align: middle;" id="auctionTab" onclick="sideTab()">
	</div>
	
	<div style="height: 650px; width: 0px; background-color: rgb(230, 230, 230); position:fixed; top:110px; left: 0px; 
			text-align: center; vertical-align: middle;" id="auctionTable">
			
<!-- 		<table class="table" id="auctionTable">
			<tr>
				<th style="text-align: center;">의뢰번호</th>
				<th style="text-align: center;">신청자</th>
				<th style="text-align: center;">경매가</th>
				<th style="text-align: center;">낙찰</th>
			</tr>
			<tr>
				<td style="text-align: center;">331</td>
				<td style="text-align: center;">jsh007</td>
				<td style="text-align: center;">12000</td>
				<td style="text-align: center;"><button>수락</button></td>
			</tr>
			<tbody></tbody>
		</table> -->
	</div>

	<section>
		<form name="aForm" id="aForm" method="post"
			action="${ pageContext.request.contextPath }/auction/auction.do">
			<input type="hidden" name="id" value="${loginUser.id }" /> <input
				type="hidden" name="requestNo" value="${request.no }" />
			<div class="auction">
				<div style="height: 180px; width: 250px;">
				<button type="button" onclick="addData()">btn</button>
					<img src="${ pageContext.request.contextPath}/img/c.png">
				</div>
				<span style="font-size: 15pt;"> 제목 </span><span style="font-size: 13pt; margin-left: 10px;"> ${request.title }</span>
				<br /> <br />
				<div align="left" style="margin: 0px; width: 400px; border: double 5px green;">
					<span style="font-size: 15pt;"> 현재 낙찰자</span><span style="font-size: 13pt; margin-left: 10px;"> id :
						${selected.id }</span> <span style="font-size: 13pt; margin-left: 10px;">
						가격 : ${selected.price } 원</span> <br />
				</div>
				<br /> <span style="font-size: 15pt;"> 가 격 </span> <input
					type="text" name="price" /> <input type="button" class="btn" onclick="getPrice(${request.no})"
					value="경매 참여" style="width: 100px; background-color: #595959;">
				<input type="button" class="btn" value="경매현황"
					onclick="location.href='${ pageContext.request.contextPath}/auction/joinList.do/${request.no}'">
			</div>
		</form>
	</section>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>