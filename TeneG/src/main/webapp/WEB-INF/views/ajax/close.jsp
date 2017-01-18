<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script>
	window.load = function(){
		alert("완료처리가 정상적으로 완료 되었습니다.");
		opener.location.reload();
		window.close();
	}
</script>
</head>
<body>
</body>
</html>