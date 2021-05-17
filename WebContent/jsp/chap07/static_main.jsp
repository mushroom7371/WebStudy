<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>static_main</title>
</head>
<body>
<%
	// String name="kim";	static_sub.jsp에 동일한 변수가 있기때문에 오류
	//정적삽입 <%@include 는 소스 코드를 복사해오기 때문에 변수가 중복선언으로 간주된다.

%>
	<div id='static_main'>
		<h2>Header</h2>
			<%@include file="static_sub.jsp" %>
		<h2>Footer</h2>
	</div>

</body>
</html>