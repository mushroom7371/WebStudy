<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>while2</title>
<style>


</style>
</head>
<body>
<div id='while2'>

	<fieldset>
		<legend>whlie example</legend>
		<div>
			두 수 x,y를 입력받아 두 수 사이의 수 중 4또는 7의 배수의 갯수를 출력하시오
		</div>
		</fieldset>
		<div class='body'>
			<label>X</label>
			<input type='text' id='x' value='1'/>
			<br/>
			<label>Y</label>
			<input type='text' id='y' value='100'/>
			<br/>
			<input type='button' id='btn' value='실행'/>
			<div id='result'></div>
		</div>

</div>

<script>
	var btn = document.getElementById('btn');
	
	btn.onclick = function(){
		var x = Number(document.getElementById('x').value);
		var y = Number(document.getElementById('y').value);
		var result = document.getElementById('result');
		
		var four = 0;
		var seven = 0;
		
		while(x <= y){
			
			if(x%4==0){
				four++;
			}
			
			if(x%7==0){
				seven++;
			}
			
			x++;
		}
		
		result.innerHTML += four + seven;
	}


</script>

</body>
</html>