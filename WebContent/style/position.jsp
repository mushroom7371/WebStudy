<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>position</title>
<style>
	#relative>div, #absolute>div{
		width:100px;
		height:100px;
		line-height:100px;
		text-align:center;
		z-index:100;
	}
	
	#position .a{background-color : #f00;}
	#position .b{background-color : #0f0;}
	#position .c{background-color : #66f;}
	#position .d{background-color : #0ff;}
	
	#relative .b{position : relative; left:100px; top:-100px;}
	#relative .c{position : relative; left:0px; top:-100px;}
	#relative .d{position : relative; left:100px; top:-200px;}
	
	#absolute {position : relative;}
	#absolute .b{position : absolute; left:100px; top:0px;}
	#absolute .d{position : absolute; left:50px; top:50px; z-index:-1;}
	
</style>
</head>
<body>
<div id='position'>
	<h2>RELATIVE</h2>
	<div id='relative'>
		<div class='a'>A</div>
		<div class='b'>B</div>
		<div class='c'>C</div>
		<div class='d'>D</div>
	</div>
		
	<h2>ABSOLUTE</h2>
	<div id='absolute'>
		<div class='a'>A</div>
		<div class='b'>B</div>
		<div class='c'>C</div>
		<div class='d'>D</div>
	</div>
</div>
</body>
</html>