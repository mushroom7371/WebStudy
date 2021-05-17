<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>for2</title>
<style>
	*{
		margin:10;
		padding:10;
		box-sizing:border-box;
	}

	#for2 #result{
		border:2px solid #aaa;
		margin-top:10px;
		width:240px;
		height:400px;
	}

</style>
</head>
<body>
<div id='for2'>
	<h2>FOR</h2>
	<fieldset>
		<legend>미션</legend>
		<div>
			정수 n을 입력 받아 n단의 구구단을 출력하시오.
		</div>
	</fieldset>
	
	<label>구구단</label>
	<input type='text' id='gugu' value='2' />
	<input type='button' id='btn' value='실행' />
	<div id='result'></div>
</div>
<script>
	var btn = document.getElementById('btn');

	btn.onclick = function(){
	var gugu = Number(document.getElementById('gugu').value);
	var result = document.getElementById('result');
	
	var gugugugu = 0;
	
		for(var i = 1; i<=9; i++){
			gugugugu = gugu * i;
			
			result.innerHTML = result.innerHTML + gugu + " X " + i +" = " +  gugugugu +"<br/>";

		}
	
	}


</script>
</body>
</html>