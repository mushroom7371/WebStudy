<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>답글</title>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/board.css'>
</head>
</head>
<body>

<div id='board'>
	<h1>답글 작성</h1>
		<form name='frm_board' method='post' action=''>
		
		<label>작성자</label>
		<input type='text' name='mid' value='juna' />
		<br/>
		
		<label>제목</label>
		<input type='text' name='subject' value='hi~' />
		<br/>
		
		<textarea name='doc'></textarea>

		<br/>
		
		<label>암호</label>
		<input type='password' name='pwd' />
		<br/>
		
		<label>첨부파일</label>
		<input type='file' name='attfile' multiple />

		<div id='btn_zone'>
		<input type='button' value='답글 작성'/>
		<input type='reset' value='취소'/>
		</div>

	</form>
</div>

</body>
</html>