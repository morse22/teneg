<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/css/layout-teneg.css" rel="stylesheet"/>

<title>TeneG</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> 
<script>
/* function check_key(){
	var char_ASCII = event.keyCode;
	//숫자
	  //숫자
	 if (char_ASCII >= 48 && char_ASCII <= 57 )
	   return 1;
	 //영어
	 else if ((char_ASCII>=65 && char_ASCII<=90) || (char_ASCII>=97 && char_ASCII<=122))
	    return 2;
	 //특수기호
	 else if ((char_ASCII>=33 && char_ASCII<=47) || (char_ASCII>=58 && char_ASCII<=64) 
	   || (char_ASCII>=91 && char_ASCII<=96) || (char_ASCII>=123 && char_ASCII<=126))
	    return 4;
	 //한글
	 else if ((char_ASCII >= 12592) || (char_ASCII <= 12687))
	    return 3;
	 else 
	    return 0;
	}

function nonHangulSpecialKey(){
	if(check_key() == 4){
		event.returnValue = false;
		$('#key').html("특수기호는 사용할 수 없습니다.");
		return false;
	}else{
		$('#key').html('');
		return;
	}
} */
function insert(){
	if(confirm('작성하시겠습니까?')){
		document.form1.submit();
	}
}
function back(){
		location.href="${pageContext.request.contextPath}/qna/QnAList.do";
}

$(function(){ // 페이지 로딩시 실행
    $(".question").css("cursor","pointer"); // question의 마우스 포인터 설정
    $(".answer").hide(); // answer 모두 hide
    $(".question").each(function(index){ // question안에 수만큼 반복
        $(this).click(function(){ // 클릭 이벤트
        	  $(".answer").not(index).hide();
        	$(".answer").eq(index).show();// 해당 answer show
        });
        $(this).dblclick(function(){ // 더블클릭 이벤트
            $(".answer").eq(index).hide(); // 해당 answer hide
        });
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
	<div id="all">
   <div id="qna_start">
        <h3 style="color:black; font-weight: bold;">1:1 Q&A</h3>
        <p>
            -아래 양식을 작성해 주시면 <strong style="color: #000;">1:1문의</strong>가 가능합니다.</p>
            <br/>
            -<strong style="color:black;">1:1문의</strong>처리 내역은 <strong style="color:black;">마이페이지 > 1:1문의</strong>를 통해 확인하실 수 있습니다.
        
        </div>     
        	<form action="${pageContext.request.contextPath }/qna/insertQna.do">
			<table border="1" id="mainbar">
				<tr>
					<th><a
						href="${pageContext.request.contextPath }/qna/insertQna.do?search_option_date=allNEW&search_option=all&search_keyword=">전체</a></th>
					<th><a
						href="${pageContext.request.contextPath }/qna/insertQna.do?search_option_date=allNEW&search_option=all&search_keyword=회원">회원</a></th>
					<th><a
						href="${pageContext.request.contextPath }/qna/insertQna.do?search_option_date=allNEW&search_option=all&search_keyword=주문+결제">주문/결제</a></th>
					<th><a
						href="${pageContext.request.contextPath }/qna/insertQna.do?search_option_date=allNEW&search_option=all&search_keyword=적립금+쿠폰">적립금/쿠폰</a></th>
				</tr>
			</table>
			</form>
            <br/>	          
          		 <div id="array"> 
                            <div id="left_table_div" >
                    <p><strong>상품취소는 마이페이지에서 직접 신청하실 수 있습니다.</strong></p>    
                 </div>
          
            <form  name="form1" id="form1" action="${pageContext.request.contextPath }/qna/insertQna.do" method="post">
            <table id="left_table" >
                <tr>
                    <th>상품명</th>
                    <td><input class="input_normal" type="text" name="productName"></td>
                </tr>
                <tr>
                    <th>질문유형</th>
                    <td>
                        &nbsp;<input type="radio" name="type" value="환불" checked="checked">환불
                         &nbsp;<input type="radio" name="type" value="취소">취소
                         &nbsp;<input type="radio" name="type" value="교환">교환
                         &nbsp;<input type="radio" name="type" value="결제">결제
                         &nbsp;<input type="radio" name="type" value="회원">회원
                         &nbsp;<input type="radio" name="type" value="기타">기타
                    </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><input class="input_normal" type="hidden" name="writer" value="${loginUser.id }">${loginUser.id }</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${loginUser.email }</td>
                </tr>
                <tr>
                    <th>제목</th>
                    <!-- onkeypress="nonHangulSpecialKey()" -->
                    <td><input class="input_normal" type="text" name="title" placeholder="최대 10글자" required="required" maxlength="10">
                    <span id="key"></span></td>
                </tr>
                <tr>
                    <th>질문내용</th>
                    <td><textarea name="content" cols="48" rows="7" id="input_textarea" ></textarea></td>
                </tr>
            </table>
            </form>
            </div>
       
            
                <div id="ul_list" style="width: 450px;height:300px ;margin-left: 510px; margin-top: 30px;">  
                <div id="ul_top"><p style="font-size:20px; color:black;"><strong>FAQ자주묻는 질문</strong></p>
                 <p style="font-size:13px;">질문전 <strong>FAQ</strong>를 확인해 주세요</p>    </div>
                    <br/>							
                 <form>   
                <ul>
                	<c:forEach var="list" items="${items }">
                    <il>
                        <%-- <dl>${list.no }</dl> --%>
                        <dd class="question">${list.no }&nbsp; ${list.title }</dd>                        
                    </il>
                    <il>
                    	<dd class="answer" style="overflow-y: scroll; height: 80px;">${list.content }</dd>
                    </il>
                    </c:forEach>
                </ul> 
                </form> 
              </div>	
                 
                 <div style="margin-top: 10px"   id="red_bar"><p>개인 부주의에 의한 결제는 책임지지 않습니다</p></div>
                 <div style="margin-top: 68px" id="red_bar2"><p><span style="font-size:13px">TEL.</span><strong><sub  style="font-size:20px">1544-7199</sub></strong></p>
                 					<p>1번 : 결제 관련 / 2번 : 회원 관련<p>
					</div>				
				
				
                
            <br/><br/>
            		
		      <div id="qna_button_b">
                        <a onclick="insert()" href="#"><p><strong style="font-size:25px">WRITE</strong>작성</p></a>
                   	 </div>
                   	 
                     <div id="qna_button_w">
                        <a onclick="back()" href="#"><p><strong style="font-size:25px">CANCEL</strong>취소</p></a>                 
               		 </div>
               			</div>
       <div style="margin-top: 100px">     
 	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
	</div>
</body>
</html>
