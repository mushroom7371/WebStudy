<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>storage_test</title>
</head>
<body>
<script>

	console.log(localStorage.getItem("mid"));
	console.log(sessionStorage.getItem("name"));
	
	var obj2 = localStorage.getItem('obj');
	console.log(obj2);
	
	var o = JSON.parse(obj2);
	console.log("map=>object");
	console.log(o.phone);
	console.log(o.address);

</script>

</body>
</html>