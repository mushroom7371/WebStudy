<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>func_css</title>
<script src='../lib/jquery-3.6.0.min.js'></script>
</head>
<body>
<div id='func_css'>
	<div>1</div>
	<div>2</div>
	<div>3</div>
	<div>4</div>
	<div>5</div>
	<div>6</div>
	<br/>
	<input type='button' value=' < ' id='btnLeft'/>
	<input type='button' value=' > ' id='btnRight'/>
</div>
<script>
	// #func_css 안에 있는 모든 div의 display속성, width, height 속성을 지정
	$('#func_css>div').css({
		'display'	:	'inline-block',
		'width'		:	'130px',
		'height'	:	'60px',
		'border'	:	'3px solid #555'
	})
	
	var leng = $('#func_css>div').length;	//div의 갯수가 늘어도 적용 되도록 갯수를 고정한게 아니라 배열의 길이를 변수에 저장함
	var index = leng;	//변수 index는 배열의 길이를 담고 있다.
	$('#btnLeft').click(function(){	//btnLeft 버튼이 클릭되었을시 function을 실행
		var target = $('#func_css>div').get(index)	//변수 target에 div의 인덱스 번호(div 번지)를 저장함
		$(target).css('background-color', '')	//해당 index 위치에 있는 div의 css를 설정한다. 배경을 지움 
		
		index--;	//index의 숫자를 1 감소시킨다 
		if(index<0)	index=leng-1;	//index가 0보다 작을 경우 index는 다시 leng-1로 설정하여 맨끝에서 반복된다.
		
		var target = $('#func_css>div').get(index) //변수 target는 index--;로 인하여 앞 번지수의 div를 가리킨다.
		$(target).css('background-color', '#f00')	//해당 번지수의 div의 css를 설정함. 배경을 빨간색으로 바꿈
	})
	
	$('#btnRight').click(function(){	//btnLeft의 반대 function
		var target = $('#func_css>div').get(index)
		$(target).css('background-color', '')
		
		index++;	//오른쪽으로 진행할 것이기 때문에 index는 1씩 증가한다.
		if(index>=leng) index=0;;	//index가 길이를 넘어가게 되면 index는 0으로 설정한다. 처음으로 되돌아감
		
		var target = $('#func_css>div').get(index)
		$(target).css('background-color', '#f00')
		
	})

</script>

</body>
</html>