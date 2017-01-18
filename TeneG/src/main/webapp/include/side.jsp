<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div style="margin-left: 230px; margin-top: 90px;">
			<h2 style="text-align: left;">관리자페이지</h2>
		</div>
<div class="col-md-2 col-sm-6 hero-feature" style="margin-left:230px; ">
					<div class="thumbnail">
						<!-- 사이드  -->
						<div id="side">
							<ul class="first">
								<li ><h3 id="menu1" class="menu_tit2" title="메뉴 및 게시글"><img alt="" src="${ pageContext.request.contextPath }/img/managerImg/menu1.PNG"> 메뉴 및 게시글</h3>
									<ul>
										<li><a href="#boardManage" aria-controls="board">게시글
												관리</a></li>
										<li ><a href="#menuManage" aria-controls="menu">메뉴 관리</a></li>
									</ul></li>
								<li><h3 class="menu_tit3" title="회원관리"><img alt="" src="${ pageContext.request.contextPath }/img/managerImg/menu3.PNG">회원관리</h3>
									<ul>
										<li><a href="${ pageContext.request.contextPath }/manager/memberManage.do">회원,운영진</a></li>
										<li><a href="#leaveManage">탈퇴, 가입불가</a></li>
										<li><a href="#gradeManage">회원등급 관리</a></li>
										<li><a href="#messageManage">쪽지</a></li>
										<li><a href="#statsManage">카페 통계</a></li>
									</ul></li>
								<li><h3 class="menu_tit4" title="디자인"><img alt="" src="${ pageContext.request.contextPath }/img/managerImg/menu4.PNG">꾸미기</h3>
									<ul>
										<li><a href="${ pageContext.request.contextPath }/manager/editad.do">사이드광고</a></li>
										<li><a href="${ pageContext.request.contextPath }/manager/editBoardBanner.do">게시판베너</a></li>
										<li><a href="${ pageContext.request.contextPath }/manager/mainAd.do">메인광고</a></li>
									</ul></li>
							</ul>
						</div>




					</div>
				</div>

