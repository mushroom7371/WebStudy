<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>scale</title>
<style>
	#scale .x{
		transform:scale(3,1); /*이미지의 정중앙을 기준으로*/
		transform-origin:0 0;	/*0,0을 기준으로*/
	}
	#scale .y{
		transform:scale(1,3);
		transform-origin:0 0;
	}
	
	#scale .both{
		transform:scale(3,3);
		transform-origin:0 0;
	}

</style>
</head>
<body>
<div id='scale'>
	<img src='../imgs/retriever.jpg'/><br/>
	<img src='../imgs/retriever.jpg' class='x'/><br/>
	<img src='../imgs/retriever.jpg' class='y'/>
	<img src='../imgs/retriever.jpg' class='both'/>
	
</div>
</body>
</html>