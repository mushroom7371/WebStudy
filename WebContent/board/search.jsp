<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>게시글 조회</title>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/board.js'></script>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/board.css'>
</head>
</head>
<body>

<div id='board'>
	<h1>게시글 조회</h1>
	
	<form name='frm_board' id='frm_board' method='post' action=''>
		<input type='button' id='btnInsert' value='작성'/>

		<div class='find_zone'>
			<input type='search' name='findStr' value='${param.findStr}'/>
			<input type='button' value='검색' id='btnFind'/>
		</div>
		
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='serial' value='${param.serial }'/>
	
		
	</form>
	
	<div class='title'>
		<span class='no'>순번</span>
		<span class='subject'>제목</span>
		<span class='date'>작성일</span>
		<span class='mid'>작성자</span>
		<span class='hit'>조회수</span>
	</div>
	
	<div class='items'>
	<c:forEach var='vo' items="${list}">
		<div class='item' onclick="brd.view('${vo.serial}')">
				<span class='no'>${vo.serial }</span>
				<span class='subject'>${vo.subject }(${vo.attCnt})</span>
				<span class='date'>${vo.mdate }</span>
				<span class='mid'>${vo.mid }</span>
				<span class='hit'>${vo.hit }</span>
		</div>
	</c:forEach>

	</div>

	<div id='btn_zone'>
		<c:if test="${page.startPage>1 }">
			<input type='button' value='맨처음' onclick='brd.move(1)'/>
			<input type='button' value='이전' onclick='brd.move(${page.startPage-1})'/>
		</c:if>
		
		<c:forEach var='p' begin='${page.startPage }' end='${page.endPage }'>
			<input type='button' value='${p }' onclick='brd.move(${p })'/>
		</c:forEach>
		
		<c:if test="${page.endPage<page.totPage }">
			<input type='button' value='다음' onclick='brd.move(${page.endPage+1 })'/>
			<input type='button' value='맨끝' onclick='brd.move(${page.totPage })'/>
		</c:if>
	</div>
	
	</div>

<script>brd.init();</script>
</body>
</html>