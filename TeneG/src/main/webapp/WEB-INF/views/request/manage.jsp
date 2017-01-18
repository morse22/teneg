<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요청리스트</title>

<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootbox.min.js"></script>


<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/userProfile.css?version=20161226_3" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet"href="${ pageContext.request.contextPath }/css/bootstrap.theme.min.css" />


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>	
	$(document).ready(function(){
		$("#Dlist").removeClass("active");
		$("#Plist").removeClass("active");
		$("#Clist").removeClass("active");
		
		switch("${param.type}"){
		case "myPList" :
			$("#Plist").addClass("active");
			break;
		case "myDList" :
			$("#Dlist").addClass("active");
			break;
		case "myCList" :
			$("#Clist").addClass("active");
			break;
		case "myAUCList" :
			$("#AUClist").addClass("active");
			break;
		}
	});
	
	function writeReview(no, expertId, id, price){
 		var popUrl = "${ pageContext.request.contextPath }/review/write.do/" + no + "/" + expertId +"/" + id + "/" + price;
		var popOption = "width=480, height=480, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
		
		window.open(popUrl, "", popOption);
	}
	
	function refund(id, requestNo, expertId){
 		var popUrl = "${ pageContext.request.contextPath }/refund/write.do/" + id + "/" + requestNo + "/" + expertId;
		var popOption = "width=480, height=530, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
		
		window.open(popUrl, "", popOption);
	}
	
	function viewReply(requestNo){
 		var popUrl = "${ pageContext.request.contextPath }/refund/replyDetail.do/" + requestNo;
		var popOption = "width=480, height=530, resizable=no, scrollbars=no, status=no, top=220, left=700;"; 
		
		window.open(popUrl, "", popOption);
	}
	
	function onClickAuction(requestNo){
		if(confirm("해당 경매를 실기간 보기에 등록하시겠습니까?")){
	        if (window.sessionStorage) {
	            sessionStorage.setItem("auctionNo", requestNo);
	            var position = sessionStorage.getItem("auctionNo");
	        }
		}
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

	<div class="container" style="margin-top: 100px; min-height: 800px;">

		<!-- 상단 -->
		<div>
			<h2 style="text-align: left;">의뢰관리</h2>
		</div>
		
		<div class="mar_30">
			<div role="tabpanel">
			
				<!-- 중단 리스트 -->
					<!-- tap  -->
					<div class="col-md-12 col-sm-6 hero-feature">
						<div class="thumbnail">

						<!-- tap  -->
							<div role="tabpanel">

								<!-- Nav tabs -->
								<ul class="nav nav-tabs" role="tablist">
									<li role="presentation" class="active" id="Dlist"><a href="${pageContext.request.contextPath }/request/manage.do?id=${loginUser.id}&type=myDList"
										>대기중(전문가 매칭 전)&nbsp; <span class="buy_useralram_none">${ typeCount.dCount }건</span></a>
									</li>
									<li role="presentation" id="Plist"><a href="${pageContext.request.contextPath }/request/manage.do?id=${loginUser.id}&type=myPList">진행중&nbsp;
										<span class="buy_useralram_none">${ typeCount.pCount }건</span></a>
									</li>
									<li role="presentation" id="Clist"><a href="${pageContext.request.contextPath }/request/manage.do?id=${loginUser.id}&type=myCList">
											처리완료&nbsp; <span class="buy_useralram_none">${ typeCount.cCount }건</span>
									</a></li>
									<li role="presentation" id="AUClist"><a href="${pageContext.request.contextPath }/request/manage.do?id=${loginUser.id}&type=myAUCList">
											경매중&nbsp; <span class="buy_useralram_none">${ typeCount.mCount }건</span>
									</a></li>
									<li>
										<div class="position_r">
											<div class="buy_period">
												<form method="GET" action="#">
													<select
														class="form-control" onchange="this.form.submit();"
														name="request_date"><option value="60">요구기간</option>
														<option value="1">1개월</option>
														<option value="3">3개월</option>
														<option value="6">6개월</option>
														<option value="12">12개월</option></select>
												</form>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div id="section1" class="container-fluid">
						<div class="col-md-12 col-sm-6 hero-feature">
							<div class="thumbnail">
								<div class="caption" align="center">
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane active" id="home">
											<c:if test="${ empty list }">
												<img src="${ pageContext.request.contextPath }/img/물음표.PNG" class="img1" />
												<c:choose>
													<c:when test="${ param.type eq 'myDList' }">
														매칭 대기중인 의뢰 내역이 없습니다.
													</c:when>
													<c:when test="${ param.type eq 'myPList' }">
														진행중인 의뢰 내역이 없습니다.
													</c:when>
													<c:when test="${ param.type eq 'myCList' }">
														완료 된 의뢰 내역이 없습니다.
													</c:when>
													<c:when test="${ param.type eq 'myMList' }">
														기간만료 된 의뢰 내역이 없습니다.
													</c:when>
												</c:choose>
											</c:if>
											<c:if test="${ not empty list and param.type eq 'myPList'}">
												<div align="left">
													<span style="color:red; font-size: 8pt; font-weight: bold;">*후기작성을 하셔야 모든 거래가 완료됩니다.</span><br/>
													<span style="color:red; font-size: 8pt; font-weight: bold;">완료대기 상태인 의뢰의 최종첨부 파일을 확인하고 전문가에대한 후기(평점)을 작성해 주세요</span><br/>												
												</div>
											</c:if>
											<c:if test="${ not empty list and param.type eq 'myDList'}">
												<div align="left">
													<span style="color:red; font-size: 8pt; font-weight: bold;">*전문가 보기 버튼을 클릭 후 원하시는 전문가에게 의뢰수락을 해주시면 요청하신 의뢰에 대한 처리가 시작됩니다.</span><br/>										
												</div>
											</c:if>
											<c:if test="${ not empty list }">
												<table class="table" border="1">
												<tr>
													<th style="width:5%; text-align: center;">의뢰번호</th>	
													<th style="width:17%; text-align: center;">제목</th>
													<th style="width:5%; text-align: center;">타입</th>
													<th style="width:8%; text-align: center;">등록일</th>
													<th style="width:5%; text-align: center;">진행상태</th>
													<c:if test="${ param.type eq 'myAUCList' }">
														<th style="width:5%; text-align: center;">현재낙찰가</th>
														<th style="width:5%; text-align: center;">실시간보기</th>
													</c:if>
													<c:if test="${ param.type ne 'myAUCList' }">
														<th style="width:5%; text-align: center;">진행률</th>
													</c:if>
													<c:if test="${ param.type eq 'myCList' }">
														<th style="width:7%; text-align: center;">담당자</th>
														<th style="width:5%; text-align: center;">결과물</th>
													</c:if>
													<c:if test="${ param.type eq 'myPList' }">
														<th style="width:7%; text-align: center;">담당자</th>
														<th style="width:5%; text-align: center;">결과물</th>
														<th style="width:5%; text-align: center;">환불</th>
													</c:if>
													<c:if test="${ param.type eq 'myDList' }">
														<th style="width:5%; text-align: center;">전문가보기</th>
													</c:if>
												</tr>
												<c:forEach var="request" items="${ list }">
													<tr>
														<td style=" text-align: center;">${ request.no }</td>
														<td style=" text-align: center;">${ request.title }</td>
														<td style=" text-align: center;">${ request.field }</td>
														<td style=" text-align: center;">${ request.regDate }</td>
														
														<c:choose>
															<c:when test="${ request.status eq 'D' }">
																<td style=" text-align: center; color:green; font-weight: bold">대기중</td>
																<td style=" text-align: center; color:green; font-weight: bold">시작전</td>
															</c:when>
															<c:when test="${ request.status eq 'P' }">
																<td style=" text-align: center; color:red; font-weight: bold">진행중</td>
																<td style=" text-align: center; color:red; font-weight: bold">${ request.progress }%</td>		
															</c:when>
															<c:when test="${ request.status eq 'DC' }">
																<td style=" text-align: center; color:blue; font-weight: bold">완료대기</td>
																<td style=" text-align: center; color:blue; font-weight: bold">${ request.progress }%</td>
															</c:when>
															<c:when test="${ request.status eq 'RP' }">
																<td style=" text-align: center; color:rgb(255, 200, 14); font-weight: bold">환불진행</td>
																<td style=" text-align: center; color:blue; font-weight: bold">${ request.progress }%</td>
															</c:when>
															<c:when test="${ request.status eq 'RC' }">
																<td style=" text-align: center; color:blue; font-weight: bold">환불완료</td>
																<td style=" text-align: center; color:red; font-weight: bold">none</td>
															</c:when>
															<c:when test="${ request.status eq 'C' }">
																<td style=" text-align: center; color:blue; font-weight: bold">처리완료</td>
																<td style=" text-align: center; color:blue; font-weight: bold">${ request.progress }%</td>
															</c:when>
															<c:when test="${ request.status eq 'RR' }">
																<td style=" text-align: center; color:red; font-weight: bold">환불불가</td>
																<td style=" text-align: center; color:red; font-weight: bold">none</td>
															</c:when>
															<c:when test="${ request.status eq 'AUC' }">
																<td style=" text-align: center; color:red; font-weight: bold">진행중</td>	
															</c:when>
														</c:choose>
														<td style="text-align: center;">
															<c:if test="${ request.status eq 'DC' }">
															<button onclick="javascript:writeReview('${request.no}', '${request.expertId}', '${ loginUser.id }', '${ request.price }');">후기작성</button>
															</c:if>
															<c:if test="${ request.status eq 'D' }">
															<button onclick="location='${ pageContext.request.contextPath }/requestwaiting/listByNo.do?no=${ request.no }'">보기</button>
															</c:if>
															<c:if test="${ request.status eq 'AUC' }">
																<img style="height: 25px; width: 20px;" src="${ pageContext.request.contextPath }/img/egg2.png"/>
																<span style="font-weight: bold;"> ${ request.price }</span>
															</c:if>
															<c:if test="${ request.status eq 'C' or request.status eq 'P' or request.status eq 'RP' or request.status eq 'RC' or request.status eq 'RR'}">
															<a href="${ pageContext.request.contextPath }/expert/detail.do/${ request.expertId }">${ request.expertId }</a>
															</c:if>
														</td>
														<c:if test="${ request.status eq 'AUC' }">
															<td style="text-align: center;"><button onclick="onClickAuction('${request.no}')">선택</button></td>
														</c:if>
														<c:choose>
															<c:when test="${ request.status eq 'P'}">
																<td style=" text-align: center; color:red; font-weight: bold">미첨부</td>
															</c:when>
															<c:when test="${ request.status eq 'RP'}">
																<td style=" text-align: center; color:rgb(255, 200, 14); font-weight: bold">환불진행</td>
															</c:when>
															<c:when test="${ request.status eq 'RC'}">
																<td style=" text-align: center; color:red; font-weight: bold">none</td>
															</c:when>
															<c:when test="${ request.status eq 'DC' or request.status eq 'C' }">
																<td style=" text-align: center; color:blue; font-weight: bold">
																	<a href="${ pageContext.request.contextPath }/finalFile/${request.saveFileName}" download>다운로드</a>
																</td>
															</c:when>
															<c:when test="${ request.status eq 'RR' }">
																<td style=" text-align: center; font-weight: bold">
																	<a href="#" style="color:red;" onclick="viewReply('${request.no}')">사유보기</a>
																</td>
															</c:when>
														</c:choose>
														<c:if test="${ param.type eq 'myPList' and request.status ne 'RP'}" >
															<td style="text-align: center;"><button onclick="refund('${loginUser.id}','${request.no}',' ${ request.expertId }')">신청</button></td>
														</c:if>
														<c:if test="${ request.status eq 'RP'}" >
															<td style=" text-align: center; color:rgb(255, 200, 14); font-weight: bold">환불진행</td>
														</c:if>
													</tr>	
												</c:forEach>
												</table>
											</c:if>
										</div>
									</div>								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>




