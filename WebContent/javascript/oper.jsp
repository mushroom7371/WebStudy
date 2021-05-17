<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>oper</title>
</head>
<body>
<div id='oper'>
<script>
	var a = 30;
	var b = 20;
	var result =0;
	
	result = (a>b) ? a : b;

	document.write(result);

	//age 지역 변수에 임의의 나이값을 대입하여 18세 이상이면 '성년' 아니면 '미성년'을
	//화면에 출력하시오(3항 연산자 사용)
	document.write('<hr/>');
	
	var age = 15;
	var c = '성년';
	var d = '미성년';
	var e;
	
	e = (age>=18) ? c : d;
	document.write(e);
	
</script>

</div>

</body>
</html>