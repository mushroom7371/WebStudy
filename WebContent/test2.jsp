<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	9단의 구구단을 out.print(), &1t%= %>, el로 작성하여 출력
 -->
 <%
 int j = 9;
 StringBuffer sb = new StringBuffer();
 for(int i = 1; i < 10; i++){
	 String s = String.format("%s * %s = %s <br/>", j, i, j*i);
	 sb.append(s);
 }
 out.print("<h3>out.print <h3/>");
 out.print(sb.toString());
 
 request.setAttribute("gu", sb.toString());
 %>
 
 <h3>표현식</h3>
 <%= sb.toString() %>
 
 <h3>EL</h3>
 ${gu }

</body>
</html>