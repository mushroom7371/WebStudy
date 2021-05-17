<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang='ko'>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>array_sort</title>
</head>
<body>
<div id='array_sort'>
	<fieldset>
		<legend>배열 정렬</legend>	
		<div>
			자바 스크립트의 sort()함수는 기본적으로 정렬시 문자열로 인식하여 정렬하게됨.
			따라서 숫자형 데이터형으로 정렬하기 위해서는 사용자가 정렬 방식을 sort()함수의
			매개변수로 전달해 주어야 함.
		</div>
	</fieldset>
	
<script>
	var su = [12,2,5,47,3,6457,345,12,54,3567,48,7634,7,3245,];
	su.sort(my); //함수 호출 시 my 뒤에 ()가 있어야하는데 없는 함수들은 콜백 함수라고 함
	console.log(su);
	
	su.reverse();
	console.log(su);
	
	function my(x,y){
		var a = Number(x);
		var b = Number(y);
		return b-a;
	}



</script>
</div>
</body>
</html>