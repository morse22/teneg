<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/style.css?version=20161219_5" rel="stylesheet" type="text/css">
<script>
	function servicePopup(data){
		var popUrl;
		switch(data){
		case 'service' :
			popUrl = "${pageContext.request.contextPath}/popup/service.do";	//팝업창에 출력될 페이지 URL
			break;
		case 'protect' :
			popUrl = "${pageContext.request.contextPath}/popup/protect.do";	//팝업창에 출력될 페이지 URL
			break;
		case 'help' :
			popUrl = "${pageContext.request.contextPath}/popup/help.do";	//팝업창에 출력될 페이지 URL
			break;
		}
		var popOption = "width=470, height=600, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
		if(data == 'help') popOption = "width=600, height=700, resizable=no, scrollbars=no, status=no, top=170, left=650;"; 
		
		window.open(popUrl, "", popOption);
	}
</script>

<footer class="footer">
    <div class="container">
         <div class="footer-logo"><a href="${ pageContext.request.contextPath }">
        <img src="${ pageContext.request.contextPath }/img/footerlogo3.png"></a>
        </div>
       		<span class="copyright">
       			<span><a href="javascript:servicePopup('service');">서비스 약관 
       			</a>| <a href="javascript:servicePopup('protect');">개인정보 보호</a> | <a href="javascript:servicePopup('help');">도움말</a>
       			 | <a href="${ pageContext.request.contextPath }/qna/QnAList.do">FAQ</a> |<a href="mailto:hoon93eee@naver.com">광고문의</a></span><br/>
				<span>사업자 등록번호: 210-41-44983-33</span><br/>
				<span>대표자명: (주)TeneG</span><br/>
				<span>주소 : 서울특별시 서초구 서초동 비트빌4층 R43강의실 1라인 3번</span><br/>
				<span>전화번호 : 02-514-2202~2205</span>
			</span>
        <div class="credits">
            <a href="#">Product</a> by <a href="#">TeneG</a>
        </div>
        <div align="center">
	        <span style="font-size: 8pt; color:rgb(182, 198, 161);">(주)TeneG의 사전 서면 동의 없이 TeneG사이트의 일체의 정보, 
	        콘텐츠 및 UI 등을 상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</span><br/>
	        <span style="font-size: 8pt; color:rgb(182, 198, 161);">TeneG는 통신판매중개자이며 통신판매 당사자가 아닙니다. 
	        따라서 TeneG는 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다. 2016 All Rights Reserved. </span><br/>
        </div>
        <div style="margin-top: 2%; margin-bottom: 1%;" align="center">
            <img src="${ pageContext.request.contextPath }/img/footerad.png">
        </div>
    </div>
</footer>