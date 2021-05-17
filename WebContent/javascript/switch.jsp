<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>switch</title>
</head>
<body>
<div id='switch'>

	<label>입력</label>
	<input type='text' id='custom'/>
	<input type='button' value='확인' id='btn'/>
	<hr/>
	<label>결과</label>
	<input type='text' id='result'/>

</div>

<script>

	var custom = document.getElementById('custom');
	var btn = document.getElementById('btn');
	var result = document.getElementById('result');
	
	btn.onclick = function(){
		
		var name = custom.value;
		
		switch(name){
		case 'A' : result.value = 'VIP고객'; break;
		case 'B' : result.value = '우수고객'; break;
		case 'C' : result.value = '고객'; break;
		case 'D' : result.value = '진상고객'; break;
		case 'E' : result.value = '입장금지 고객'; break;
		case 'F' : result.value = '입장금지 고객'; break;
		
		default:
			result.value = '없는 고객입니다.';
		}
	}
		
</script>


</body>
</html>