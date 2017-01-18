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

#arrowImg:hover{
	opacity: 0.5;
}
</style>
<script type="text/javascript">
	
	var requestNo = sessionStorage.getItem("auctionNo");
	var expertId;
	var finalPrice;
	
	var timerId;
	var checkUpdateId
	
	$(document).ready(function(){
	    if(requestNo == null){
	    	$("#tenderBtn").hide();
	    	$("#bidderSpan").text("의뢰관리->경매중->실시간보기를 선택하세요");
	    }else{    	
	    	$("#tenderBtn").show();
			initBidder(requestNo);
			$.ajax({
	            type : "post",
	            url : "${ pageContext.request.contextPath }/auction/listByNo.do",
	            data : {
					"requestNo" : requestNo,
	             }, 
	            success : updateAuctionTable,
	         }); 
			$("#arrowImg").attr("src","${pageContext.request.contextPath}/img/rightArrow.png");
			$("#auctionTable").hide();
			
			
			// timer
			var time = 5;
			timerId = setInterval(function(){
				$("#timer").text(time + "초");
				if(--time < 0) time = 5;
			}, 1000);
			
			checkUpdateId = setInterval(function(){
				$.ajax({
		            type : "post",
		            url : "${ pageContext.request.contextPath }/auction/listByNo.do",
		            data : {
						"requestNo" : requestNo,
		             }, 
		            success : updateAuctionTable,
		         });
			}, 6000);
	    }
	});
	
	function initBidder(requestNo){
		$.ajax({
            type : "post",
            url : "${ pageContext.request.contextPath }/auction/getSelectedByNo.do",
            data : {
				"requestNo" : requestNo
             }, 
            success : function(data){
            	expertId = data.id;
            	finalPrice = data.price;
            	if(expertId == "start") $("#bidderSpan").text("현재낙찰자 없음 시작가" + "(" + data.price + ")");
            	else $("#bidderSpan").text("현재낙찰자 : " + data.id + "(" + data.price + ")");
            },
         }); 
	}
	
	function updateAuctionTable(list){
		$("#auctionTable tr:not(:first)").remove();
		for(var i in list){
			var row = 			
				'<tr>' +
				'<td style="text-align: center; color:rgb(70, 70, 70); font-weight: bold;">'+ list[i].id +'</td>' +
				'<td style="text-align: center; color:blue; font-weight: bold;"><img style="width:20px; height:25px;" src="${ pageContext.request.contextPath }/img/egg2.png"/>'+ list[i].price +'</td>' +
				'<td style="text-align: center; color:rgb(70, 70, 70); font-weight: bold;">'+ list[i].auctionDate +'</td>' +
				'<td style="text-align: center;"><button style="color:rgb(70, 70, 70); font-weight: bold;" class="btn btn-warning" onclick="onclickAccept(' + list[i].no + ', '+ list[i].requestNo +')">수락</button></td>' +
				'</tr>';
			$("#auctionTable > tbody:last").append(row);
		}	
	}
	
	function onclickAccept(no, requestNo){
		if(confirm("정말로 수락하시겠습니까?")){
			$.ajax({
	            type : "post",
	            url : "${ pageContext.request.contextPath }/auction/setSelected.do",
	            data : {
					"no" : no,
					"requestNo" : requestNo
	             }, 
	            success : function(data){
	            	initBidder(requestNo);
	    			$.ajax({
	    	            type : "post",
	    	            url : "${ pageContext.request.contextPath }/auction/listByNo.do",
	    	            data : {
	    					"requestNo" : requestNo,
	    	             }, 
	    	            success : updateAuctionTable,
	    	         }); 
	            },
	         }); 
		}
	}
	
	var flag = "out";
	function sideTab(){
		if(flag == "out"){
			flag = "in";
			$("#arrowImg").attr("src","${pageContext.request.contextPath}/img/leftArrow.png");
			$("#auctionTab").animate({
				left: "350px"
			},20);
			$("#auctionTable").animate({
				width : "350px"
			},20);
			$("#auctionTable").show();
		}else{
			flag = "out";
			$("#arrowImg").attr("src","${pageContext.request.contextPath}/img/rightArrow.png");
			$("#auctionTab").animate({
				left: "0px"
			},20);
			$("#auctionTable").animate({
				width : "0px"
			},20);
			$("#auctionTable").hide(300);
		}
	}
	
	// 입찰 시 t_response에 등록, t_request에 status='P'로 변경 or price 갱신, t_auction 삭제, session에서 제거
	function finish(){
		if(expertId == "start"){
			alert("현재 낙찰자가 없습니다!");
			return;
		}
		
		if(confirm("현재 낙찰자로 최종 확정하시겠습니까?")){			
			$.ajax({
	            type : "post",
	            url : "${ pageContext.request.contextPath }/auction/finish.do",
	            data : {
					"requestNo" : requestNo,
					"expertId" : expertId,
					"finalPrice" : finalPrice,
	             }, 
	            success : function(data){
	            	sessionStorage.removeItem("auctionNo");
	            	clearAuctionBoard();
					alert("최종입찰 처리가 정상적으로 완료 되었습니다.");
	            },
	         }); 
		}
		
	}
	
	function clearAuctionBoard(){
		clearInterval(checkUpdateId);
		clearInterval(timerId);
		$("#auctionTable tr:not(:first)").remove();
    	$("#tenderBtn").hide();
    	$("#bidderSpan").text("의뢰관리->경매중->실시간보기를 선택하세요");
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
	
	<div style="height: 100px; width: 30px; position:fixed; top:400px; left: 0px; 
			text-align: center; vertical-align: middle;" id="auctionTab" onclick="sideTab()">
			<img id="arrowImg" src="${ pageContext.request.contextPath }/img/rightArrow.png"/>
	</div>
	
	<div style="overflow:scroll; height: 650px; width: 0px; background-color: rgb(230, 230, 230); position:fixed; top:110px; left: 0px; 
			text-align: center; vertical-align: middle;" id="auctionTable">
		<div>
			<span id="bidderSpan" style="color:red; font-weight: bold; font-size: 12pt;"></span>&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="timer" style="color:rgb(70, 70, 70); font-weight: bold;"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn btn-danger" id="tenderBtn" onclick="finish()">입찰</button>
		</div>
		<table class="table" id="auctionTable">
			<tr>
				<th style="text-align: center; color:rgb(70, 70, 70);">신청자</th>
				<th style="text-align: center; color:rgb(70, 70, 70);">가격</th>
				<th style="text-align: center; color:rgb(70, 70, 70);">등록일</th>
				<th style="text-align: center; color:rgb(70, 70, 70);">낙찰</th>
			</tr>
			<tbody></tbody>
		</table>
		
	</div>
	
	<div style="min-height: 800px;">
	
	</div>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>