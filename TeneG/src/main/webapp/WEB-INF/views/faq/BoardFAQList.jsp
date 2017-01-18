<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TeneG</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/half-slider.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/simple-sidebar.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/plugins/morris.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">
<style type="text/css">
 	a:link { color: red; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: black; text-decoration: underline;}
 	.line{border-bottom:1px solid black;}
 	
 	     *{
          margin: 0px auto 0px auto;
            
          
        }
        
        table.mainboard th{
            height: 50px;
            width: 60px;
        }
        table{
            width: 65%;
            border-radius: 5px; 
            text-align: center;
        }
      
        #qna_title{
            margin-left: 17.5%;
            padding-bottom: 10px;
        }
        #qna_button{
            margin-left: 50%;
            padding-top: 10px;
        }
        #select{
            height: 21px;
        }
</style>
</head>
<body>
	<h2>나의질문</h2>
	<form>
	<table border="1" class="mainboard">
            <tr>
                <th>회원</th>
                <th>주문/결제</th>
                <th>적립금/쿠폰</th>
                <th>기타</th>
            </tr>
        </table>
        <br /><br/>
        <table border="1">
            <tr>
               <td colspan="3" align="left">검색 <input type="search" name="search" id="select" >
                    <select id="select"><option name="option" valeu="new" >최신순</option><option name="option" value="old">오래된순</option></select></td>
            </tr>
            <tr>
                <th style="width:150px">No</th>
                <th>content</th> 
                <th style="width:150px">writer</th>         
            </tr>
            	<c:forEach var="list" items="${items}">
            <tr>
                <td>${list.no }</td>
                <td><a href="${pageContext.request.contextPath }/qna/detail.do?no=${list.no}">${list.title }</a></td>
                <td>${list.writer }</td>
            </tr>
            	</c:forEach>
			<tr >
				<td colspan="3">
				<select  name="search_option_date">
					<option value="allNEW"
						<c:if test="${search_option_date == 'allNEW' }">selected</c:if>>최신순</option>
					<option value="allOLD"
						<c:if test="${search_option_date == 'allOLD' }">selected</c:if>>오래된순</option>
				</select>
					<select name="search_option">
						<option value="all"
							<c:if test="${search_option == 'all' }">selected</c:if>>전체</option>
						<option value="title"
							<c:if test="${search_option == 'title' }">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${search_option == 'content' }">selected</c:if>>내용</option>
						<option value="no"
							<c:if test="${search_option == 'no' }">selected</c:if>>글번호</option>
				</select> 
				
				<input type="text" name="search_keyword" value="${search_keyword}">
				<input type="submit" value="SEARCH"></td>
			</tr>
		</table>
	</form>
	
	<table width="40%" align="center" style="text-align: center;" >
		<tr>
		<td>
		<c:if test="${page.curPage > 1 }">
			<a
				href="${ pageContext.request.contextPath }/qna/QnAList.do?curPage=1&search_option=${search_option}&search=${search_keyword}">[처음]</a>&nbsp;
			</c:if>
		<c:if test="${page.curBlock > 1 }">
			<a
				href="${ pageContext.request.contextPath }/qna/QnAList.do?curPage=${page.prevPage}&search_option=${search_option}&search=${search_keyword}">[이전]</a>&nbsp;
				</c:if>
		
		<c:forEach var="pageNum" begin="${page.startBlock }"
			end="${page.endBlock }">
			<c:choose>
				<c:when test="${pageNum == page.curPage }">
					<span style="color: black">[${pageNum}]</span>
				</c:when>
				<c:otherwise>
					<a
						href="${ pageContext.request.contextPath }/qna/QnAList.do?curPage=${pageNum}&search_option=${search_option}&search=${search_keyword}">[${pageNum}]</a>&nbsp;
			</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.curBlock <= page.totBlock }">
			<a
				href="${ pageContext.request.contextPath }/qna/QnAList.do?curPage=${page.nextPage}&search_option=${search_option}&search=${search_keyword}">[다음]</a>&nbsp;
			</c:if>
		<c:if test="${page.curPage < page.totPage }">
			<a
				href="${ pageContext.request.contextPath }/qna/QnAList.do?curPage=${page.totPage}&search_option=${search_option}&search=${search_keyword}">[끝]</a>&nbsp;
			</c:if>
			</td>
			</tr>
	</table>
	<div align="center">
	<a href="${pageContext.request.contextPath }/qna/insertQna.do"><button>1:1문의</button></a>
	<a href="${pageContext.request.contextPath }/qna/myPageQna.do"><button>MY PAGE</button></a>
	</div>
	
</body>
</html>
