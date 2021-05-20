<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='device=width-width, initial-scale=1.0'>
<title>회원정보 조회</title>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/member.css'>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/member.js'></script>
</head>
<body>

	<div id='member'>
		<h1>회원정보 조회</h1>
		<form name='frm_search' method='post' action=''>
				<input type='button' value='가입' id='btnRegister'/>
			<div class='find_zone'>
				<input type='search' name='findStr'/>
				<input type='button' value='검색' id='btnFind'/>	
			</div>
		</form>
		
		<div class='title'>
			<span class='no'>NO</span>
			<span class='mid'>아이디</span>
			<span class='mname'>성명</span>
			<span class='phone'>연락처</span>
			<span class='email'>이메일</span>
		</div>
	
		<div class='items'>
			<div class='item' onclick='member.view()'>
				<span class='no'>1</span>
				<span class='mid'>Kim</span>
				<span class='mname'>김씨</span>
				<span class='phone'>010-1111-1111</span>
				<span class='email'>1111@naver.com</span>
			</div>
			
			<div class='item' onclick='member.view()'>
				<span class='no'>2</span>
				<span class='mid'>Lee</span>
				<span class='mname'>이씨</span>
				<span class='phone'>010-2222-2222</span>
				<span class='email'>2222@naver.com</span>
			</div>
			
			<div class='item' onclick='member.view()'>
				<span class='no'>3</span>
				<span class='mid'>Park</span>
				<span class='mname'>박씨</span>
				<span class='phone'>010-3333-3333</span>
				<span class='email'>3333@naver.com</span>
			</div>
		</div>
		
			<div id='btn_zone'>
				<input type='button' value='맨처음'/>
				<input type='button' value='이전'/>
				<input type='button' value='1'/>
				<input type='button' value='2'/>
				<input type='button' value='3'/>
				<input type='button' value='다음'/>
				<input type='button' value='맨끝'/>
			</div>
		
	<input type='hidden' name='nowPage' value='${(empty param.nowPage)? 1: param.nowPage }'/>
	<!-- nowPage가 비어있는 값이면 1을 넣어주고 아니면 nowPage로 설정한다. -->
	<input type='hidden' name='mid'/>
	<!-- 목록으로 이동할때 이전 조회 화면을 보여주기 위해서 만들어두었다. -->
	<input type='hidden' name='findStr' value='${param.findStr }'/>
		
		
	</div>
	
<script>member.init();</script>
<!-- member.js 파일의 member.init()를 불러온다. -->

</body>
</html>