<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>logout</title>
</head>
<body>
<div id='logout'>
	<%
		//session에 등록된 id값 제거
		session.removeAttribute("id");
		response.sendRedirect("index.jsp");
		
		//session 전체를 삭제
		session.invalidate();
	%>

</div>

</body>
</html>