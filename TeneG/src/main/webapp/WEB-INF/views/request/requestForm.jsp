
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Form</title>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="//cdn.ckeditor.com/4.6.1/basic/ckeditor.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.theme.min.css" />

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script>
	function doWrite() {
		var w = document.wForm;
		alert(w.eggCount.text());
		if (w.title.value == '') {
			alert('제목을 입력 하세요');
			w.title.focus();
			return false;
		}
		if (CKEDITOR.instances["content"].getData() == "") {
			alert('내용을 입력 하세요');
			w.content.focus();
			return false;
		}
		if (w.field.value == '') {
			alert('카테고리를 선택하세요');
			w.field.focus();
			return false;
		}
		if (w.deadline.value == '') {
			alert('요청마감일을 선택하세요');
			w.deadline.focus();
			return false;
		}
		if (w.eggCount.text() == '0') {
			alert('예산을 선택하세요');
			return false;
		}

		if (checkExt(w.attachfile1)) {
			alert("업로드 할 수 없는 파일입니다.");
			return false;
		}

		return true;
	}
	
	var start = 0;
	var last = 0;
	function changeEgg(data) {
		last = start + data;
		start = last;
		$("#eggCount").html(last);
		$("#price").val(last); 
	}
	
	function resetEgg() {
		last = 0;
		start = 0;
		$("#eggCount").html(0);
		

	}
	
	function checkExt(obj) {
		var forbidName = [ 'exe', 'jsp', 'java', 'class', 'js' ];
		var fileName = obj.value;
		var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
		for (var i = 0; i < forbidName.length; i++)
			if (forbidName[i] == ext)
				return true;
		return false;
	}

	$(function() {
		$("#testDatepicker").datepicker({
			changeMonth : true,
			changeYear : true,
			nextText : '다음 달',
			prevText : '이전 달',
			dateFormat : "yymmdd",
			minDate : 0

		});
		
		 
	});
	

	function checkAuction(){
		if($("#status").is(":checked")){
			$("#egg").text("경매 시작가");
		}else{$("#egg").text("예산");}		
	}
	/*  */

	$(document).ready(function() {
		CKEDITOR.replace("content",	
	   			{
	   		      height : "500px",
	   		      startupFocus : false 
	   		    }
	   				
	   		).on("change", function(e){
	 				text = e.editor.getData();
	 				var total = 0;
	     			for(var i=0;i<text.length;i++){
	     				oneChar = text.charAt(i);
	     				if(escape(oneChar).length > 4) total += 3;
	     				else total++;
	     			}
	     			$("#t2").text(total);
	   		});
		
		
		});


	/*  */
</script>
<body>

	<header>
		<div align="center">
			<div style="width: 85%; margin-top: 1%;">
				<jsp:include page="/include/header.jsp" />
			</div>
		</div>
	</header>

	<div align="center" style="margin-top: 50px;">
		<div>
			<img src="${ pageContext.request.contextPath }/img/banner.png" />
		</div>
	</div>

	<section>
		<div align="center" style="margin-top: 90px;">
			<form class="form-horizontal" name="wForm"
				action="${ pageContext.request.contextPath }/request/write.do"
				method="post" onsubmit="return doWrite()"
				enctype="multipart/form-data">
				<div style="width: 60%; padding: 50px; background-color: #e9fafc;">
					<input type="hidden" name="id" value="${loginUser.id }" /> <input
						type="hidden" name="price" id="price">

					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">요청제목</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="title" id="title"
								placeholder="제목을 입력하세요" />
						</div>
					</div>

					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">요청내용</label>
						<div class="col-sm-8">
							<textarea class="form-control" name="content"
								style="height: 500px;" id="content"></textarea>
						</div>
					</div>
					<div align="right">
						<span id="t2" style="color: rgb(70, 70, 70); font-weight: bold;">0</span><span
							style="color: red; font-weight: bold; margin-right: 180px;">/4000자</span>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">첨부파일</label>
						<div class="col-sm-4">
							<input class="form-control" type="file" name="attachfile1" />
						</div>
					</div>

					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">카테고리</label>
						<div class="col-sm-2">
							<select class="form-control" name="field">
								<option value="c">c언어</option>
								<option value="cpp">c++</option>
								<option value="java">Java</option>
								<option value="python">Python</option>
								<option value="php">PHP</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">마감일</label>
						<div class="col-sm-4">
							<input class="form-control" type="text" name="deadline"
								id="testDatepicker">
						</div>
					</div>

					<div class="form-group">
						<label for="title" class="col-sm-2 control-label" id="egg">예산</label>
						<div class="col-sm-4" align="left" style="width: 630px;">
							<button type="button" onclick="changeEgg(1)" value="1"
								class="btn" style="margin-left: 10px;">1 egg</button>
							<button type="button" onclick="changeEgg(5)" value="5"
								class="btn">5 egg</button>
							<button type="button" onclick="changeEgg(10)" value="10"
								class="btn">10 egg</button>
							<div style="float: right">
								<span id="eggCount" name="eggCount" style="margin-top: 4px;">0
								</span> <img src="${ pageContext.request.contextPath }/img/egg2.png"
									style="width: 27px; height: 30px;">

							</div>
						</div>
						<br />
						<div align="center">
							<div style="width: 665px; margin-top: 20px;" align="left">
								<button type="button" onclick="changeEgg(50)" value="50"
									class="btn" style="padding: 6px 8px 6px 8px;">50 egg</button>
								<button type="button" onclick="changeEgg(100)" value="100"
									class="btn" style="padding: 6px 5px 6px 4px;">100 egg</button>
								<button type="button" onclick="changeEgg(1000)" value="1000"
									class="btn" style="padding: 6px 5px 6px 4px;">1000 egg</button>
								<button type="button" onclick="resetEgg()" class="btn"
									style="width: 70px;">초기화</button>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">프리미엄</label> 
						<label>
						<input type="checkbox" name="premium" id="premium" value="Y"
							 style="margin-left: 360px;">프리미엄 (+ 500 EGG)
						</label>
						<label>
						<input type="checkbox" name="status" id="status" value="AUC"
							style="margin-left: 10px;" onchange="checkAuction()">경매 (+ 100 EGG)
						</label>
					</div>


					<br />

					<button type="submit" class="btn">
						<span class="glyphicon glyphicon-ok-sign">요청하기</span>
					</button>

				</div>
			</form>
		</div>
	</section>
	<br />

	<footer style="margin-top: 50px;">
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</head>
</html>