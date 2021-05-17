<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>transition</title>
<style>
	#transition>div{
		width:200px;
		height:80px;
		border:1px solid #aaa;
		font-size:30px;
		background-color:#fff;
		color:#000;
		transition-property:background-color color;
		transition-duration:1s;
	}
	
	#transition>div:hover{
		background-color:#00f;
		color:#fff;
	/*바탕색을 서서히 변경------*/
		transition-property:background-color color;
		transition-duration:1s;
	}
	
	
</style>
</head>
<body>
<div id='transition'>
	<h1>transiton</h1>
	<div>A</div>
	<div>B</div>
	<div>C</div>
	<div>D</div>
	<div>E</div>
	<div>F</div>

</div>
</body>
</html>