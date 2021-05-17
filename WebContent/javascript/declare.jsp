<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>declare</title>
</head>
<body>
<div id='declare'>
	<h2>스크립트 작성 방법</h2>
	<div id='info'>
		<ol>
			<li>1) 웹 문서안에 &ltscript>&lt/script> 태그를 선언하여 작성</li>
			<li>2) 태그에 이벤트 핸들러 속성을 사용하여 작성</li>
			<li>3) 외부에 스트립트 코드를 작성하여 &ltscript>&lt/script>태그를 현재 문서에 포함</li>
		</ol>	
	</div>
	
	<h2>웹 문서안에서 작성하기</h2>
	<input type='button' id='btnLogin' value='로그인'>
	<script>
		var btn = document.getElementById('btnLogin');
		btn.onclick = function(){
			alert('버튼을 클릭했습니다.')
		}
	</script>
	
	<h2>태그에 작성하기</h2>
	<input type='button' value='로그아웃' onclick="javascript:alert('로그아웃 버튼이 클릭됨')"/>
	
	<h2>외부 문서에 작성하여 포함시키기</h2>
	<input type='button' value='회원가입' id='btnRegister'/>
	<script src='test.js'></script>
	
	
	
	
	
	
</div>
</body>
</html>