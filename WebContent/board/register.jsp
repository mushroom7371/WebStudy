<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>게시판 입력</title>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/board.js'></script>
<script src='./js/image_preview.js'></script>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/board.css'>
</head>
<body>
<div id='board'>

	<h1>게시판 입력</h1>
	<form name='frm_board' id='frm_board' method='post' action=''>
	<!-- method는 get과 post 가 있는데 이 둘의 차이는?
		action은 서버를 만들 수 있는 페이지? -->
		
		<label>작성자</label>
		<input type='text' name='mid' value='juna' />
		<br/>
		
		<label>제목</label>
		<input type='text' name='subject' value='hi~' />
		<br/>
		
		<textarea name='doc'></textarea>
		<!-- textarea는 2칸이상의 공백, 엔터키를 인식함
			 rows='10' cols='30' 이걸로 조정할수도있으나 CSS로 건드림
			html 태그를 인식하지 않는다 => 일반 text로 인식함 -->
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
			<input type='button' value='작성' id='btnInsertR'>
			<input type='button' value='취소' id='btnSearch'/>
		<!-- reset은 모두 삭제가 아니라 초기값으로 설정해준다. -->
		</div>
		
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='serial' value='${param.serial }'/>
		
		


</div>
	</form>
</div>
<script>
brd.init();
imageView('attfile', 'attzone');
</script>
</body>
</html>