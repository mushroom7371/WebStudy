<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>hap</title>
</head>
<body>
<div id='hap'>
	<h2>합합</h2>
	<form name='frm' method='post' action='hap_result.jsp'>
		<label>수1<input type='text' name='su1'/></label>
		<br/>
		<label>수2<input type='text' name='su2'/></label>
		<br/>
		<input type='submit' name='btn' value='전송'/>
	</form>
</div>
</body>
</html>