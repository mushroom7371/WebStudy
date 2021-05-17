<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>dynamic_main</title>
</head>
<body>
<div id='dynamic_main'>
	<h2>Header</h2>
	
	<jsp:include page="dynamic_sub.jsp">
		<jsp:param value="hong gil dong" name="name"/>
		<jsp:param value="18" name="age"/>
	</jsp:include>
	
	<h2>Footer</h2>

</div>

</body>
</html>