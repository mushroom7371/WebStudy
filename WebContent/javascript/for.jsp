<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>for</title>
<style>
	*{
		margin:0;
		padding:0;
		box-sizing:border-box;
	}
	#for {
		position: relative;
		margin:50px;
	}
	#for #btn{
		top:34px;
		position:absolute;
		width:80px;
		height:41px;
	}
	#for #result{
		border:2px solid #aaa;
		margin-top:10px;
		width:240px;
		height:100px;
	}

</style>
</head>
<body>
<div id='for'>
	<h2>for</h2>
	<label>X</label>
	<input type='text' id='x' value='1'/>
	<input type='button' id='btn' value='계산'/>
	<br/>
	<label>Y</label>
	<input type='text' id='y' value='10'/>
	<div id='result'></div>
</div>
<script>
	var btn = document.getElementById('btn');
	btn.onclick = function(){
		var x = Number(document.getElementById('x').value);
		var y = Number(document.getElementById('y').value);
		var result = document.getElementById('result');
		var sum = 0;
		
		for(var i =x; i<=y; i++){
			sum = sum+i;
		}
		result.innerHTML = sum;
	}

</script>
</body>
</html>








