<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>답글</title>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/board.js'></script>
<script src='./js/image_preview.js'></script>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/board.css'>
</head>
</head>
<body>

<div id='board'>
	<h1>답글 작성</h1>
		<form name='frm_board' id='frm_board' method='post' action=''>
		
		<label>작성자</label>
		<input type='text' name='mid' value='juna' />
		<br/>
		
		<label>제목</label>
		<input type='text' name='subject' value='hi~' />
		<br/>
		
		<textarea name='doc'></textarea>

		<br/>
		
			<label>파일첨부</label>
			<input type='file' id='attfile' multiple/>
		
		<div id='image_preview'>
			<div id='attzone'>
		</div>
		<!-- multiple은 파일 다중 선택 html5에서 추가됨. -->
		
		<label>암호</label>
		<input type='password' name='pwd' />
		<br/>

		<div id='btn_zone'>
		<input type='button' value='답글 작성'/>
		<input type='button' value='취소' id='btnModify'/>
		</div>
		
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='findStr' value='${param.findStr }'/>

	</form>
</div>
<script>
brd.init();
imageView('attfile', 'attzone');
</script>
</body>
</html>