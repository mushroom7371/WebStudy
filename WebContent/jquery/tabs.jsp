<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<link rel='stylesheet'
		href='https://code.jquery.com/ui/1.12.1/themes/black-tie/jquery-ui.css'>
<script src='../lib/jquery-3.6.0.min.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<title>tabs</title>
</head>
<body>
<div id='tabs'>
	<!-- tab에 들어갈 탭 메뉴 -->
	<ul>
		<li><a href='#menu_html'>HTML 소개</a></li>
		<li><a href='#menu_css'>CSS 소개</a></li>
		<li><a href='#menu_javaScript'>JavaScript 소개</a></li>
		<li><a href='#menu_ajax'>ajax 소개</a></li>
		<li><a href='#menu_jQuery'>jQuery 소개</a></li>
	</ul>
	
	<!-- tab 내용이 들어갈 -->
	<div id='menu_html'>HTML5 내용입니다.</div>
	<div id='menu_css'>CSS 내용입니다.</div>
	<div id='menu_javaScript'>JavaScript 내용입니다.</div>
	<div id='menu_ajax'>aJax 내용입니다.</div>
	<div id='menu_jQuery'>jQuery 내용입니다.</div>

</div>
<script>
	$('#tabs').tabs();


</script>
</body>
</html>