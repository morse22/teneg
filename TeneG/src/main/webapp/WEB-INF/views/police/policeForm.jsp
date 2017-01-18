<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고</title>
<script>
	function onClickCancel(){
		window.close();
	}
	
	function onClickNotift(){
		alert("접수 되었습니다.");
		window.close();
	}
</script>
</head>
<body>
	<div style="margin-right: 5%; margin-left: 5%; margin-top: 2%;">
		<h3>신고하기<img src="${ pageContext.request.contextPath }/img/notify2.png"/></h3>
		<hr/>
		<span style="font-size:9pt; font-weight: bold;">신고는 반대 의견을 표시하는 기능이 아닙니다.</span><br/>
		<span style="font-size:8pt;">다른 의견에 대한 경청과 예의를 갖춘 토론하는 문화를 만듭시다.</span><br/>
		<div align="right">
			<a href="#" style="text-decoration: underline; font-size:8pt; color:rgb(128, 160, 249);">운영원칙 보기</a>
		</div>
	</div>
	<div style="border: 1px solid rgb(128, 160, 249); margin-right: 5%; margin-left: 5%; margin-top: 2%;">
		<ul style="font-size: 10pt;">
			<li>신고사유</li>
		</ul>
		<div style="margin-right: 5%; margin-left: 5%; margin-top: 2%;">
			<input type="radio" value="" name="replyPolice"/><span style="font-size:9pt;">영리목적/홍보성</span>
			<input type="radio" value="" name="replyPolice"/><span style="font-size:9pt;">불법정보</span><br/>	
			<input type="radio" value="" name="replyPolice"/><span style="font-size:9pt;">음란성/선정성</span>&nbsp;&nbsp;
			<input type="radio" value="" name="replyPolice"/><span style="font-size:9pt;">욕설/인신공격</span><br/>
			<input type="radio" value="" name="replyPolice"/><span style="font-size:9pt;">개인정보노툴</span>&nbsp;&nbsp;
			<input type="radio" value="" name="replyPolice"/><span style="font-size:9pt;">같은 내용의 반복 게시(도배)</span><br/>
			<input type="radio" value="" name="replyPolice"/><span style="font-size:9pt;">기타</span><br/>
			<textarea rows="3" cols="54" style="resize:none; margin-top: 2%; font-size:9pt;" 
			placeholder="기타 항목 선택후 입력해주세요(최대 300자)"></textarea>
			<hr style="color:rgb(255,0,0)"/>
			<img src="${ pageContext.request.contextPath }/img/policecheck.png"/>
			<span style="font-size:9pt; color:rgb(128, 160, 249);">주의사항</span><br/>
			<br/>
			<span style="font-size:8pt;">허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니, 유의하시어 신중하게 신고해 주세요.</span><br/>
			<span style="font-size:8pt;">명예훼손, 저작권 등 신고자의 권리가 침해된 경우에는 권리침해 신고센터로 문의해주세요.</span><br/><br/>
		</div>
	</div><br/>
		<div align="center">
			<button onclick="onClickNotift()">신고</button>
			<button onclick="onClickCancel()">취소</button>
		</div>
</body>
</html>