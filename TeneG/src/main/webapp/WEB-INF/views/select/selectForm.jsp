<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#select_table{
		margin-left:auto;
		margin-right:auto;
		width: 500px;
		height: 300px;
		}
	#select_table td{
		height: 50px;
	}
	button{
		background-color: white;
		width: 100px;
		height: 50px;
	}
	#select_btn{
		margin-left:auto;
		margin-right:auto;
		margin-top:10px;
		width: 230px;
	}
	
</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
$('#select_ajax').click(function(){
		var id =$('#select_id').val();
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/select/select_ajax.do",
			data:{
				"id":id
			},	
			success : function(data){
				console.log(data);
				if(data == 0){
					var id =$('#select_id').val();
						$.ajax({
							type: "post",
							url:"${pageContext.request.contextPath}/select/select_Pro.do",
							data:{
								"id":id
							},
							success:function(){
								alert('성공');
							}
						});
						
				}else if(data != 0){
					alert('이미찜했습니다!');
				}
			}
		});

	});

$('#delete_list').click(function(){
	var id =$('#select_id').val();
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/select/select_delete.do",
		data:{
			"id" : id
		},
		success:function(){
			opener.location.reload();
			window.close();
			}
		});
	});	
});
</script>
</head>
<body>
	<!-- select id, field, content, regDate, title, titleImage, mainImage, approval from t_expert -->
<table border="1px solid #bbb" id="select_table">
	<tr>
		<th rowspan="4">img</th>
	</tr>
	<tr>
		<td><input type="hidden" id="select_id" value="${vo.id}">${vo.id }</td>
	</tr>
	<tr>	
		<td>${vo.field }</td>
	</tr>
	<tr>	
		<td>제목</td>
	</tr>	
	<tr>
		<td colspan="2">
			<textarea rows="10" cols="80">${vo.content }</textarea>
		</td>
	</tr>
</table>
<div id="select_btn">	
<button id="select_ajax"><i class="material-icons">face</i>찜하기</button>
<%-- <button onclick="select('${vo.id }')"><i class="material-icons">face</i>찜하기</button> --%>
<button id="delete_list"><i class="material-icons">highlight_off</i>취소</button>
</div>
</body>
</html>