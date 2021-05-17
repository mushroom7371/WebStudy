<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>while1</title>
<style>


</style>
</head>
<body>
<div id='while1'>

	<fieldset>
		<legend>while examlpe</legend>
		<div>
			두 수 x,y가 1부터 시작하여 x는 2씩 증가, y는 3씩 증가되고 있다. 두 수 x,y의 합이 1000이상이 되면 해당 합과 두 수 x,y를 출력하시오
		</div>
		</fieldset>
		<div id='result'></div>

</div>

<script>
	var result = document.getElementById('result');
	var x = 1;
	var y = 1;
	var r = '<ul>';
	var sum = 0; // 두 수의 합
	
	while(sum < 1000){
		
		x = x+2;
		y = y+3;

		sum = x+y;

	}
	
	r = r + '<li>X = ' + x + '</li>';
	r = r + '<li>Y = ' + y + '</li>';
	r = r + '<li>sum - ' + sum + '</li>';
	r = r + '</ul>';
	
	result.innerHTML = r;

</script>

</body>
</html>