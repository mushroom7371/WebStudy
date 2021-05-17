<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>setinterval</title>
<style>
	*{
		margin:10px;
		padding:0;
		box-sizing:border-box;
	}

	#setinterval #div1{
		font-size:20px;
		width:440px;
		height:50px;
		border:1px solid #aaa;
		background-color:#ffff00;
		text-align:center;
		padding-top:10px;
		border-radius:8px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#setinterval #btn{
		margin-left: 48%;
	}

</style>
</head>
<body>
<div id='setinterval'>
	<input type='button' id='btn' value='날짜'/>
	<p/>
	<div id='div1'></div>
</div>
<script>
	var div1, btn;
	var week=['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
	window.onload=function(){
		document.getElementById('btn').onclick=createDate;
		div1=document.getElementById('div1');
		setInterval(createDate,1000);
	}
	
	function createDate(){
		var now = new Date();
		var str = '';
		str += now.getFullYear() + '년 ';
		str += (now.getMonth()+1) + '월 ';
		str += now.getDate() + '일 ';
		str += week[now.getDay()] + '/ ';
		str += now.getHours() + '시 ';
		str += now.getMinutes() + '분 ';
		str += now.getSeconds() + '초 ';
		
		div1.innerHTML = str;
	}

</script>
</body>
</html>