<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath }/css/layout-teneg.css" rel="stylesheet"/>
<style type="text/css">
 	a:link { color: red; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: black; text-decoration: underline;}
 	fieldset{
 		border: 1px solid black;
 	}
 	
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/JavaScript">
$(document).ready(function(){
$("#update_faq").click(function(){
		var content= $('#content').val();
		var title = $('#title').val();
		$.ajax({
			type : "put",
			url : "${pageContext.request.contextPath}/rest/update/${vo.no}",
			headers:{
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				content : content,
				title : title
			}),
			dataType: "text",
			success : function(result){
				if(result == "success"){
					opener.location.reload();
					window.close();
				}
			}
		}); 
});

$('#delete_faq').click(function(){
		$.ajax({
			type : "delete",
			url : "${pageContext.request.contextPath}/rest/delete/${vo.no}",
			success : function(result){ 	
				if(result=="success"){
					opener.location.reload();
					window.close();
				}
			}
		});
	});

});
/* function FAQdelete(no){
	if(confirm){
		alert('삭제하시겠습니까?');
		location.href="${pageContext.request.contextPath}/faq/delete.do?no="+no;
	
	}
} */

</script>
</head>
<body>
<fieldset>
<legend><h4><strong>FAQ수정</strong></h4></legend>
<form name="form2" id="form2" action="${pageContext.request.contextPath }/faq/update.do" method="post">
<table border="1" width="30%" align="center">
	<tr>
		<th width="7%">No</th>
		<td width="5%"><input type="hidden" name="no" value="${vo.no }">${vo.no }</td>
		<th width="7%">DATE</th>
		<td  width="10%">${vo.regDate}</td>
	</tr> 
	<tr>
		<th>TITLE</th>
		<td colspan="3" ><input size="21px"  style="height: 21px"  type="text" id="title" name="title" value="${vo.title }"></td>
	</tr>  
	<tr>
		<th>WRITER</th>
		<td colspan="3">${vo.writer }</td>
	
	</tr>  
	<tr>
		<th >CONTENT</th>
		<td colspan="3"><textarea name="content" id="content" cols="80" rows="20">${vo.content}</textarea></td>
	</tr>  
</table>
<br/>
<div style="height: 100px; width: 300px; margin-left: 150px;">
<a href="#"><p id="update_faq" style="background: black; color: white; width: 130px; height: 60px; padding-top: 20px; display: inline-block;"><strong style="font-size:25px">UPDATE</strong>수정</p></a>
 <a href="#"><p id="delete_faq" style="border:1px solid black; white; color: black; width: 130px; height: 60px; padding-top: 20px;padding-left:10px;display: inline-block;"><strong style="font-size:25px">DELETE</strong>삭제</p></a>
</div>

	</form>
</fieldset>
		
</body>
</html>

