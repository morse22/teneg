<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 상세</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootbox.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>

	function replyPolicePopup(){
		var popUrl = "${pageContext.request.contextPath}/police/replyPolice.do";	//팝업창에 출력될 페이지 URL
		var popOption = "width=470, height=600, resizable=no, scrollbars=no, status=no, top=220, left=700;";    //팝업창 옵션(optoin)
			window.open(popUrl, "", popOption);
	}
	
	function onDownLoad(){
		showModalDialog("folderDialog.html","","width:400px;height:400px;resizeable:yes;");
	}
	
	function onClickWirteReply(){
		var replyArea = $("#replyArea");
 		if(replyArea.val().trim() == ""){
 			alert("내용을 입력하세요");
 			replyArea.focus();
 			return;
 		}
		
		$("#no").val("${ board.no }");
		$("#writer").val("${loginUser.id}");
		$("#replyContent").val(replyArea.val());
		$("#replyWrite").submit();
	}
	function onClickReply(){
		$("#reply_div").toggle();
		return false;
	}
	
	function onClickDelete(){
		if(confirm("삭제 하시겠습니까?")) location="${pageContext.request.contextPath}/board/${ board.no }/delete.do";
	}
	
	function onClickGoodBtn(){
		requestMsg("${board.no}", "${loginUser.id}");
	}
	
	function onClickReplyDelete(){
		return confirm("삭제 하시겠습니까?");
	}
	
	///////////////////////////////////////////////////// ajax 중복추천 check ////////////////////////////////////////////
	var httpRequest = null;
	// ajax 통신용으로 사용
	function requestMsg(boardNo, id){
		// 1. XMLHttpRequest Object 생성
		if(window.XMLHttpRequest) httpRequest = new XMLHttpRequest();
		else if(window.ActiveObject) httpRequest = new ActiveObject("Microsoft.XMLHTTP");
		else return;
			
		// 2. callback function 정의
		httpRequest.onreadystatechange = responseMsg;
		// 3. 서버에게 비동기 요청
		// 서버에게 hello.jsp라는 파일을 비동기로 요청
		httpRequest.open("GET", "${pageContext.request.contextPath}/good/goodCheck.do/" + boardNo + "/" + id, true);
		httpRequest.send(null);
	}
	
	function responseMsg(){
		// 4. 서버에서 응답 완료
		if(httpRequest.readyState == 4 && httpRequest.status == 200){
			var results = httpRequest.responseText.trim().split(",");
 			if(results[0] == "yes"){ // 이미 추천한 상태
				alert("이미 추천 했습니다!\n" + "추천한 날짜 : " + results[1]);
			}else{ // 추천안한 상태
				recommend("${board.no}", "${loginUser.id}");
				alert("추천 하였습니다!");
			}
		}
	}
	
	// 좋아요 증가
	function recommend(boardNo, id){
		// 1. XMLHttpRequest Object 생성
		if(window.XMLHttpRequest) httpRequest = new XMLHttpRequest();
		else if(window.ActiveObject) httpRequest = new ActiveObject("Microsoft.XMLHTTP");
		else return;

		httpRequest.open("GET", "${pageContext.request.contextPath}/good/recommend.do/" + boardNo + "/" + id, true);
		httpRequest.send(null);
	}
	
	function onClickReplyReply(id){
		$("#"+id ).toggle();
		return false;
	}
	
	function replyCancel(id){
		$("#"+id ).toggle();
		$("#ta" + id).val("");
	}
	
	function replyreplyWrite(parent, group, no){
		var area = $("#ta" + no);
		if(area.val().trim() == ""){
			alert("내용을 입력하세요");
			area.focus();
			return;
		}
		$("#rno").val("${ board.no }");
		$("#rwriter").val("${ loginUser.id }");
		$("#rreplyContent").val(area.val());
 		$("#groupNo").val(group);
		$("#parentId").val(parent);
		$("#replyreplyWrite").submit();
	}
	
	
/* 	var filter = "win16|win32|win64|mac|macintel";

	if ( navigator.platform ) {
		if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
			//mobile
			alert('mobile 접속');
		} else {
			//pc
			alert('pc 접속');
		}
	} */
	
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
		<a href="#">광고문의</a>
	</div>
	
	<section>
		<div align="center" style="margin-top: 10px;">
		
		<div style="width:70%; margin-bottom: 10px;" align="left">
			<button class="btn-xs" type="button" onclick="location='${ pageContext.request.contextPath }/board/write.do'">
				<span class="glyphicon glyphicon-pencil">글쓰기</span>
			</button>
			<button class="btn-xs" type="button">답글</button>
			<a href="${ pageContext.request.contextPath }/board/list.do?pc=11&page=1" style="font-size: 8pt; color: rgb(70, 70, 70); margin-left: 70%;">최신목록&nbsp;&nbsp;</a>
			<a href="${ pageContext.request.contextPath }/board/list.do?pc=${ pc }&page=${page}" style="font-size: 8pt; color: rgb(70, 70, 70);">목록&nbsp;&nbsp;</a>
			<a href="${ pageContext.request.contextPath }/board/${page}/${pc}/detail.do/${board.preNo}" 
				<c:if test="${ board.preTitle ne null }">
		 			style="font-size: 8pt; color: rgb(70, 70, 70); margin-top: 20px;" 
		 		</c:if>
		 		<c:if test="${ board.preTitle eq null}">
		 			style="font-size: 8pt; color: rgb(70, 70, 70); margin-top: 20px; pointer-events: none; color:rgb(180, 180, 180);"
		 		</c:if>
			>▲윗글&nbsp;&nbsp;</a>
			<a href="${ pageContext.request.contextPath }/board/${page}/${pc}/detail.do/${board.nextNo}" 
				<c:if test="${ board.nextTitle ne null }">
		 			style="font-size: 8pt; color: rgb(70, 70, 70); margin-top: 20px;" 
		 		</c:if>
		 		<c:if test="${ board.nextTitle eq null}">
		 			style="font-size: 8pt; color: rgb(70, 70, 70); margin-top: 20px; pointer-events: none; color:rgb(180, 180, 180);"
		 		</c:if>
			>▼아랫글</a>
		</div>
			
		<div style="width:70%;">
		<input type="hidden" name="writer" value="${ member.id }"/>
		<table class="table">
			<!-- 제목출력 -->
			<tr style="font-size: 9pt;">
				<td colspan="2">
					<span>no. ${ board.no }</span>&nbsp;
					<img src="${ pageContext.request.contextPath }/img/imageMobileLoaded.png"/>
					<span style="color:black; font-weight: bold;"><c:out value="${ board.title }"/></span>
					<img src="${ pageContext.request.contextPath }/img/imageFileLoaded.png"/>
					<img src="${ pageContext.request.contextPath }/img/imageloaded.png"/><img src="${ pageContext.request.contextPath }/img/newImage.png"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">자유게시판</span>
				</td>
			</tr>
			<!-- 글 데이터 출력 -->
			<tr style="font-size: 8pt;">
				<td colspan="2">
					<span style="color:red;">${ board.writer }</span>&nbsp;&nbsp;&nbsp;
					<span>조회 ${ board.hit }</span>&nbsp;&nbsp;&nbsp;
					<span>추천 ${ recommendCount }</span>&nbsp;&nbsp;&nbsp;
					<span>${ board.regDate }</span>&nbsp;&nbsp;&nbsp;
					<a href="${ pageContext.request.contextPath }/board/${page}/${pc}/detail.do/${board.no}">
						${ pageContext.request.contextPath }/board/${ page }/${pc}/detail.do/${board.no}
					</a>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
<%-- 			<tr>
				<th style="text-align: center;">첨부파일</th>
				<td>
					<c:forEach var="file" items="${ fileList }">
						<a href="${file.filePath}" download>
							<c:out value="${ file.fileOriName }"/> 
						</a>
						(${ file.fileSize } byte) <br/>
					</c:forEach>
				</td>
			</tr> --%>
		</table>
		<div align="center"><img src="${ pageContext.request.contextPath }/img/boardtitle.gif"/></div>	
		
		<!-- 이미지 출력 -->
		<c:forEach var="file" items="${ fileList }" >
			<div>
				<img src="${ pageContext.request.contextPath }/upload/${file.saveFileName}" />
			</div>
		</c:forEach>
		
		<div align="justify" style="margin-top: 50px;">${ board.content }</div>
		<div style="text-align: left; margin-top: 50px;">
			<a href="#" onclick="return onClickReply();" style="color:orange; text-decoration: underline;">댓글 ${ rcount }</a>
			<button class="btn-xs" type="button" style="text-align: right;" onclick="onClickGoodBtn()">
				<span class="glyphicon glyphicon-thumbs-up">추천</span>
			</button>
			<img src="${ pageContext.request.contextPath }/img/notify.png" style="margin-left: 80%;"/>
			<a href="javascript:replyPolicePopup();" style="font-size: 8pt; text-decoration: underline; color: rgb(70, 70, 70);">신고</a>
		</div><br/>
		
		<!-- 리플달기 -->
		<div style="background-color: rgb(247, 247, 247);" id="reply_div">
			<c:if test="${ rcount ne 0 }">
				<div style="widtd:80%;" align="center">
					<table class="table">
					<c:forEach var="i" begin="0" end="${ rcount-1 }">
						<tr style="margin-left: 20px;">
							<td>
							<c:if test="${ replylist.get(i).getParentId() eq null}">
								<c:set var="pid" value="${ replylist.get(i).getWriter() }" />
							</c:if>
							<c:if test="${ replylist.get(i).getParentId() ne null}">
								<img src="${ pageContext.request.contextPath }/img/replyreply.png"/>
							</c:if>
							<img src="${ pageContext.request.contextPath }/img/duck.png"/>
							<span style="font-weight: bold; color: rgb(70, 70, 70); font-size: 11pt;">${replylist.get(i).getWriter()}</span>
							&nbsp;<span style="font-size: 8pt;">${replylist.get(i).getRegDate()}
							<img src="${ pageContext.request.contextPath }/img/replynew.png"/>
							</span><img src="${ pageContext.request.contextPath }/img/notify.png" style="margin-left: 70%;"/>
							<a href="javascript:replyPolicePopup();" style="font-size: 8pt; text-decoration: underline; color: rgb(70, 70, 70);">신고</a>
							
							<c:if test="${ loginUser.id eq replylist.get(i).getWriter()}">
								<a href="${pageContext.request.contextPath }/reply/${ replylist.get(i).getNo() }/${ page }/${ pc }/delete.do/${board.no}" onclick="return onClickReplyDelete()"
								style="font-size: 8pt; text-decoration: underline; color: rgb(70, 70, 70); margin-left: 10px;">삭제</a>
							</c:if>
							
							<c:if test="${ loginUser.id ne replylist.get(i).getWriter() }">
								<a href="#" onclick="return onClickReplyReply(${replylist.get(i).getNo()})" style="font-size: 8pt; 
									text-decoration: underline; color: rgb(70, 70, 70); margin-left: 10px;">답글</a>
							</c:if>  
							
							<br/>
							
							<c:if test="${ replylist.get(i).getParentId() ne null and replylist.get(i).getParentId() ne pid }">
								<span style="color: rgb(255, 120, 14); font-size: 11pt; 
								font-weight: bold; margin-left: 30px;">${replylist.get(i).getParentId()}</span>
							</c:if>
							
							<span style="color: rgb(70, 70, 70); font-size: 9pt;
								<c:if test="${ replylist.get(i).getParentId() eq null or replylist.get(i).getParentId() eq pid}">
									margin-left:24px;
								</c:if>
							">${replylist.get(i).getContent()}</span>			
							<div align="justify" style="margin-left: 10%; display:none;" id="${replylist.get(i).getNo()}">
								<span style="font-weight: bold; color:rgb(70, 70, 70);">@${replylist.get(i).getWriter()}</span>
								<textarea class="form-control" rows="2" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간 입니다.
댓글 작성 시 타인에 대한 배려와 책임을 담아 주세요."
								style="resize:none; width:80%; font-size: 10pt" id="ta${replylist.get(i).getNo()}"></textarea>
								<button class="btn-xs" type="button" style="text-align: right;" 
								onclick="replyreplyWrite('${ replylist.get(i).getWriter() }', ${ replylist.get(i).getGroupNo()}, ${replylist.get(i).getNo()})">
									<span class="glyphicon glyphicon-ok-sign">등록</span>
								</button>
								<button class="btn-xs" type="button" style="text-align: right;" onclick="replyCancel(${ replylist.get(i).getNo()})">
									<span class="glyphicon glyphicon-ok-sign">취소</span>
								</button>
							</div></td>
						</tr>
					</c:forEach>
					</table>
				</div>
			</c:if>
			
			<div align="justify" style="margin-left: 10%;">
								<textarea class="form-control" rows="2" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간 입니다.
댓글 작성 시 타인에 대한 배려와 책임을 담아 주세요."
								style="resize:none; width:80%; font-size: 10pt" id="replyArea"></textarea>
				<button class="btn-xs" type="button" style="text-align: right;" onclick="onClickWirteReply()">
					<span class="glyphicon glyphicon-ok-sign">등록</span>
				</button>
			</div>
		</div><br/>
		<div align="left">
			<button class="btn-xs" type="button" onclick="location='${pageContext.request.contextPath}/board/write.do'">
				<span class="glyphicon glyphicon-pencil">글쓰기</span>
			</button>
			<button class="btn-xs" type="button">답글</button>
			
			</div>
			
			<!-- 공유하기 -->
			<div align="right">
				<div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-mobile-iframe="false">
					<a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">공유하기</a>
				</div>
				<a id="kakaostory-share-button" data-url="https://dev.kakao.com"></a>
				<a href="https://twitter.com/share" class="twitter-share-button" style="margin-top: 40px;">Tweet</a> 
			</div>
			
			<br/><c:if test="${board.writer eq member.id || member.type eq 'S'}">
			</c:if>
				<button class="btn" type="button" onclick="location='${ pageContext.request.contextPath }/board/${page}/${pc}/update.do/${ board.no }'">
					<span class="glyphicon glyphicon-ok-sign">수정</span>
				</button>
				<button class="btn" type="button" onclick="onClickDelete()">
					<span class="glyphicon glyphicon-trash">삭제</span>
				</button>
				<button class="btn" type="button" onclick="location='${ pageContext.request.contextPath }/board/list.do?pc=${ pc }&page=${ page }'">
					<span class="glyphicon glyphicon-circle-arrow-left">목록</span>
				</button>
				
				<!-- 이전, 다음 페이지 -->
				<div style="margin-top: 40px;" align="left">
			 		<a href="${ pageContext.request.contextPath }/board/${page}/${pc}/detail.do/${board.preNo}" 
			 		<c:if test="${ board.preTitle ne null }">
			 			style="font-size: 8pt; color: rgb(70, 70, 70); margin-top: 20px;" 
			 		</c:if>
			 		<c:if test="${ board.preTitle eq null}">
			 			style="font-size: 8pt; color: rgb(70, 70, 70); margin-top: 20px; pointer-events: none; color:rgb(180, 180, 180);"
			 		</c:if>
			 		>▲윗글&nbsp;&nbsp;${ board.preTitle }</a><br/>
			 		<a href="${ pageContext.request.contextPath }/board/${page}/${pc}/detail.do/${board.nextNo}"
 			 		<c:if test="${ board.nextTitle ne null }">
			 			style="font-size: 8pt; color: rgb(70, 70, 70); margin-top: 20px;" 
			 		</c:if>
			 		<c:if test="${ board.nextTitle eq null}">
			 			style="font-size: 8pt; color: rgb(70, 70, 70); margin-top: 20px; pointer-events: none; color:rgb(180, 180, 180);"
			 		</c:if>
			 		>▼아랫글&nbsp;&nbsp; ${ board.nextTitle }</a>
			 	<hr/>
			 	</div>
				
				<!-- 프리미엄 링크 -->
				<div style="margin-top: 40px;" align="left">
			 		<span style="color:rgb(255, 120, 14); font-weight: bold;">프리미엄 </span>링크 
			 		<a href="#" style="font-size: 8pt; text-decoration: underline; color: rgb(70, 70, 70); margin-left: 70%;">프리미엄링크 신청→</a>
			 		<hr/>
			 	</div>
				<div style="margin-top: 10px;" align="left">
			 		<a href="http://www.bitacademy.com/" style="font-size: 12pt; text-decoration: underline; color: rgb(70, 70, 70);" target="_blank">비트교육센터(강남)</a>
			 		- <a href="http://www.bitacademy.com/" style="font-size: 8pt; color: rgb(140, 140, 140);" target="_blank">http://www.bitacademy.com/</a><br/>
			 		<span style="color: rgb(70, 70, 70);">국비지원교육, 기업위탁교육, 대학생 방학특강 전국 1위</span>
			 	</div>
				<div style="margin-top: 10px; margin-bottom: 8%;" align="left">
			 		<a href="http://www.bitjobedu.co.kr/" style="font-size: 12pt; text-decoration: underline; color: rgb(70, 70, 70);" target="_blank">비트캠프(강북)</a>
			 		- <a href="http://www.bitjobedu.co.kr/" style="font-size: 8pt; color: rgb(140, 140, 140);" target="_blank">http://www.bitjobedu.co.kr/</a><br/>
			 		<span style="color: rgb(70, 70, 70);">3개월 프로젝트를 통해 실력자로 거듭나자</span>
			 	</div>
			</div>
		</div>
		 <form style="display: hidden" action="${ pageContext.request.contextPath }/boardReply/write.do" method="POST" id="replyWrite">
	 		<input type="hidden" id="no" name="no" value="" />
	 		<input type="hidden" id="replyContent" name="replyContent" value="" />
	 		<input type="hidden" id="writer" name="writer" value="" />
	 		<input type="hidden" id="pc" name="pc" value=${pc } />
	 		<input type="hidden" id="page" name="page" value=${ page } />
	 	</form>
	 	 <form style="display: hidden" action="${ pageContext.request.contextPath }/boardReply/rrwrite.do" method="POST" id="replyreplyWrite">
	 		<input type="hidden" id="rno" name="no" value="" />
	 		<input type="hidden" id="rreplyContent" name="replyContent" value="" />
	 		<input type="hidden" id="rwriter" name="writer" value="" />
	 		<input type="hidden" id="rpc" name="pc" value=${pc } />
	 		<input type="hidden" id="groupNo" name="groupNo" value="" />
	 		<input type="hidden" id="parentId" name="parentId" value="" />
	 		<input type="hidden" name="page" value=${ page } />
	 	</form>
	</section><br/>
	<script>
		  !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';
		  if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}
		  (document, 'script', 'twitter-wjs')
		  
		  window.kakaoAsyncInit = function () {
		    Kakao.Story.createShareButton({
		      container: '#kakaostory-share-button'
		    });
		  };
		
		  (function (d, s, id) {
		    var js, fjs = d.getElementsByTagName(s)[0];
		    if (d.getElementById(id)) return;
		    js = d.createElement(s); js.id = id;
		    js.src = "//developers.kakao.com/sdk/js/kakao.story.min.js";
		    fjs.parentNode.insertBefore(js, fjs);
		  }(document, 'script', 'kakao-js-sdk'));
		  
		(function(d, s, id) {
			  var js, fjs = d.getElementsByTagName(s)[0];
			  if (d.getElementById(id)) return;
			  js = d.createElement(s); js.id = id;
			  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8";
			  fjs.parentNode.insertBefore(js, fjs);
		 }(document, 'script', 'facebook-jssdk'));
	</script>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>

</head>
</html>