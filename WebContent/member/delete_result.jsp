<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/member.js'></script>
<title>delete_result</title>
</head>
<body>
<div id='member'>
	<h1>delete_result</h1>
	<form name='frm_member' id='frm_member' method='post'>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='mid' value='${param.findStr }'/>
	</form>
</div>
<script>member.init();</script>
<!-- member.js 파일의 member.init()를 불러온다. -->
</body>
</html>