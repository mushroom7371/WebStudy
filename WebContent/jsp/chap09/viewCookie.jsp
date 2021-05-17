<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>viewCookie</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null && cookies.length > 0){
		for(int i = 0; i < cookies.length; i++){
			String cName = cookies[i].getName();
			String cValue = URLDecoder.decode(cookies[i].getValue(), "utf-8");
			out.print("<li>" + cName + " : " + cValue);
		}
	}
	out.print("<li>cookie 유지시간 : " + cookies[0].getMaxAge());
%>

</body>
</html>