<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>hap_result</title>
</head>
<body>
<h2>합합 결과</h2>
<div id='hap_result'>

<%
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
%>

<ul>
	<li>수1 : <%=su1 %></li>
	<li>수2 : <%=su2 %></li>
	<li>합계 : <%=su1+su2 %></li>
</ul>
<script>	
	var	합 : eval(<%=su1 %>+'+'+<%=su2 %>)
	innerH
</script>


</div>

</body>
</html>