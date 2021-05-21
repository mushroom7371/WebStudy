<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
				<input type='search' name='findStr' value='${param.findStr }'/>
				<input type='button' value='검색' id='btnFind'/>	
				<input type='text' name='nowPage' value='${param.nowPage }'/>
				<input type='text' name='mid'/>
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
			<c:forEach var='vo' items='${list }'>	<!-- req에 담긴 list 정보를 아래와 같은 형식으로 출력 -->
			<div class='item' onclick='member.view()'>
				<span class='no'>1</span>
				<span class='mid'>${vo.mid }</span>
				<span class='mname'>${vo.irum }</span>
				<span class='phone'>${vo.phone }</span>
				<span class='email'>${vo.account }@${vo.host }</span>
			</div>
			</c:forEach>

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
		
	</div>
	
<script>member.init();</script>
<!-- member.js 파일의 member.init()를 불러온다. -->

</body>
</html>