<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<script src='../lib/jquery-3.6.0.min.js'></script>
<title>show_hide</title>
</head>
<body>
<div id='show_hide'>
	<input type='button' id='show' value='show'/>
	<input type='button' id='show_fast' value='show(fast)'/>
	<input type='button' id='show_slow' value='show(slow)'/>
	<input type='button' id='show_custom' value='show(custom)'/>
	<br/>
	<input type='button' id='hide' value='hide'/>
	<input type='button' id='hide_fast' value='hide(fast)'/>
	<input type='button' id='hide_slow' value='hide(slow)'/>
	<input type='button' id='hide_custom' value='hide(custom)'/>
	
	<input type='button' id='slide_up' value='slide_up'/>
	<input type='button' id='slide_down' value='slide_down'/>
	<input type='button' id='slide_toggle' value='slide_toggle'/>
	
	<br/>
	<div id='target'>
	
	설레는 때에, 모래뿐일 황금시대다. 옷을 붙잡아 있는 석가는 원대하고, 청춘의 가는 들어 교향악이다.
	능히 낙원을 목숨이 뼈 현저하게 그들은 얼마나 것은 듣는다. 천자만홍이 얼음이 그들에게 얼마나 뿐이다.
	그들은 부패를 자신과 새가 장식하는 지혜는 사랑의 것이다. 기쁘며, 일월과 것은 풍부하게 반짝이는
	생의 든 끓는 속에 이것이다.
	
	</div>
</div>
<script>
$('#show_hide').css({
	'width' : '500px',
	'margin' : '50px auto',
})
$('#target').css({
	'border' : '2px solid #aaa',
	'padding' : '20px',
	'box-sizing' : 'border-box',
	'margin-top' : '30px'
})

$('#hide').click(function(){	$('#target').hide();	})
$('#show').click(function(){	$('#target').show();	})

$('#hide_slow').click(function(){	$('#target').hide('slow');	})
$('#show_slow').click(function(){	$('#target').show('slow');	})

$('#hide_fast').click(function(){	$('#target').hide('fast');	})
$('#show_fast').click(function(){	$('#target').show('fast');	})

$('#hide_custom').click(function(){	$('#target').hide('3000');	})
$('#show_custom').click(function(){	$('#target').show('3000');	})

$('#slide_up').click(function(){	$('#target').slideUp('1000');	})
$('#slide_down').click(function(){	$('#target').slideDown('1000');	})
$('#slide_toggle').click(function(){	$('#target').slideToggle('1000');	})

</script>
</body>
</html>