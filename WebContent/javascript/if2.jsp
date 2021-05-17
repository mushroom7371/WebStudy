<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>if2</title>
</head>
<body>
<div id='if2'>

	<div>국어 성적</div>
	<input type='text' id='kor'/>
	<br/>
	<div>영어 성적</div>
	<input type='text' id='mat'/>
	<input type='button' value='계산' id='btn'/>
	<hr/>
	<div>결과</div>
	<input type='text' id='result'/>

</div>

<script>
	var kor = document.getElementById('kor');
	var mat = document.getElementById('mat');
	var btn = document.getElementById('btn');
	var result = document.getElementById('result');
	
	btn.onclick = function(){
		
		var k = Number(kor.value);
		var m = Number(mat.value);
		var sum = Number(k + m);
		var avg = Number(sum/2);
		
		if( avg >= 60  ){
			result.value = '합격';
		}else{
			result.value = '불합격';
		}
	}


</script>


</body>
</html>