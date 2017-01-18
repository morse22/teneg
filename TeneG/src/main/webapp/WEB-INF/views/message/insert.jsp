<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
</head>
<style>
	button{
		border-radius : 4px;
		width: 80px; 
		height: 20px; 
		background-color: white; 
		color:#bbb; 
		font-size: 14px; 
		padding-bottom: 30px;
		margin-bottom: 10px;
		
	}
	#hover_icon:hover{
		color: black;
	}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#message').click(function() {
			var recipient = $('#recipient').val();
			var title = $('#title').val();
			var content = $('#content').val();
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath }/msg/insert.do",
				headers : {
					"Content-Type" : "application/json"
				},
				dataType : "text",
				data : JSON.stringify({
					recipient : recipient,
					title : title,
					content : content,
				}),
				success : function(){
					opener.location.reload();
					window.close();
					}
				});
			});			
		});

 	$(document).ready(function() {
		$("#hideselect").click(function() {
			if ($('#hideselect').is(":checked")) {
				$('#recipient').val('');
				$('#hidemenu').hide();
			} else if (!($('#hideselect').is(":checked"))) {
				$('#hidemenu').show();
			}

		});
	}); 
</script>
<body>

<div  style="width: 530px; font-size: 14px">
쪽지쓰기
<hr>
</div>

<div>
<button id="message"><span id="hover_icon"><i class="material-icons">arrow_forward</i>전송</span></button>
<button id="cancle"><span id="hover_icon"><i class="material-icons">clear</i>취소</span></button>
</div>
<table style="width: 530px; height: 150px">
<tr>
	<th align="left" style="width:150px;">받는사람&nbsp;&nbsp;<span style="font-size: 14px">전체<input type="checkbox"  id="hideselect" name="hideselect"></span></th>
	<td id="hidemenu" ><input type="text" name="recipient" id="recipient"></td>
</tr>
<tr>
	<th align="left">제목</th>
	<td><input type="text" name="title" id="title"></td>
</tr>
<tr>
	<td colspan="2"><textarea name="content" id="content" cols="85" rows="15"></textarea></td>
</tr>
</table> 
</body>
</html>