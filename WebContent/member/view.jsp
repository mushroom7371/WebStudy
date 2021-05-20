<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>회원정보 상세보기</title>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/member.css'>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/member.js'></script>
</head>
<body>
	<div id='member'>
		<h1>회원정보 상세보기</h1>
	<form name='frm_register' method='post' action=''>
		
		<label>아이디</label>
		<input type='text' name='mid' value='hong'/>
		<br/>
		
		<label>성명</label>
		<input type='text' name='irum' value='길동이'/>
		<br/>
		
		<label>암호</label>
		<input type='password' name='pwd'/>	<!-- name이 같으면 배열로 처리됨 -->
		<output>확인</output>
		<input type='password' name='pwd'/>
		<br/>
		
		<label>연락처</label>
		<input type='text' name='phone' value='010-1111-1111'>
		<br/>
		
		<label>주소</label>
		<input type='text' name='post'/>
		<input type='button' value='우편번호'/>
		<br/>
		<label></label>
		<input type='text' name='address' size='50'/>
		<br/>
		
		<label>상세주소</label>
		<input type='text' name='address2' size='50'/>
		<br/>
		
		<label>이메일</label>
		<input type='text' name='email'/>
		<output>@</output>
		<select name='host' size='1'>
			<option value='IT여행자'>IT여행자</option>
			<option value='acorn'>acorn</option>
			<option value='네이버'>네이버</option>
			<option value='네이트'>네이트</option>
			<option value='다음'>다음</option>
		</select>

		<div id='btn_zone'>
		<input type='button' value='수정' id='btnModify'/>
		<input type='button' value='삭제' id='btnDelete'/>
		<input type='button' value='취소' id='btnSelect'/>
		</div>
		
		<img src='http://placehold.it/150X180' class='photo'/>
		
		
	<input type='hidden' name='nowPage' value='${(empty param.nowPage)? 1: param.nowPage }'/>
	<!-- nowPage가 비어있는 값이면 1을 넣어주고 아니면 nowPage로 설정한다. -->
	<input type='hidden' name='mid'/>
	<!-- 목록으로 이동할때 이전 조회 화면을 보여주기 위해서 만들어두었다. -->
	<input type='hidden' name='findStr' value='${param.findStr }'/>
		
		
	</form>
	</div>
<script>member.init();</script>
<!-- member.js 파일의 member.init()를 불러온다. -->
</body>
</html>