<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>media(landscape/portrait)</title>
<style>
	#media .r{background-color:#f00;}
	#media .g{background-color:#0f0;}
	#media .b{background-color:#00f;}
	#media>div{
		height:300px;
		display:inline-block;
		float:left;
		}

	@media screen and (orientation:landscape){
		#media .r{width:33%;}
		#media .g{width:33%;}
		#media .b{width:33%;}
	}
	
	@media screen and (orientation:portrait){
		#media .r{width:100%;}
		#media .g{width:100%;}
		#media .b{width:100%;}
	}

</style>
</head>
<body>
<div id='media'>

	<div class='r'>R</div>
	<div class='g'>G</div>
	<div class='b'>B</div>
	
</div>
</body>
</html>