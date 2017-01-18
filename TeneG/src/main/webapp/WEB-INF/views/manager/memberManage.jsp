<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요청리스트</title>

<script
	src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/js/bootbox.min.js"></script>


<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/userProfile.css?version=20161226_3" />
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/bootstrap.theme.min.css" />


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	ul{
	 list-style-type: none;    
    }
</style>

<body>
	<header>
		<div align="center">
			<div style="width: 85%; margin-top: 1%;">
				<jsp:include page="/include/header.jsp" />
			</div>
		</div>
	</header>

	<jsp:include page="/include/side.jsp" />

	<div class="container" style="margin-top: 10px">			
			<div id="section1" class="container-fluid">
				<div class="col-md-10 col-sm-6 hero-feature">					
						<div class="thumbnail">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#allMember"
									aria-controls="home" role="tab" data-toggle="tab">전체회원&nbsp; 
								</a></li>
								<li role="presentation"><a href="#expertWaiting"
									aria-controls="profile" role="tab" data-toggle="tab">전문가 대기회원&nbsp; 
								</a></li>
								<li role="presentation"><a href="#messages"
									aria-controls="messages" role="tab" data-toggle="tab">탈퇴회원&nbsp;										
								</a></li>
								<li role="presentation"><a href="#settings"
									aria-controls="settings" role="tab" data-toggle="tab">처리완료&nbsp;
								</a></li>

							</ul>
							<div class="caption" align="center" style="height: 500px">
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="allMember">매칭
										대기중인 내역이 없습니다.</div>
									<div role="tabpanel" class="tab-pane" id="expertWaiting">매칭완료된
										내역이 없습니다.</div>
									<div role="tabpanel" class="tab-pane" id="messages">구현중.....</div>
									<div role="tabpanel" class="tab-pane" id="settings">구현중.....</div>
									
								</div>
	
							</div>




						</div>


					

				</div>
			</div>

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

	</div>




	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</head>
</html>




