<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>virtual_class</title>
<style>
	*{
		margin:0;
		padding:0;
		box-sizing:border-box;
	}
	#virtual_class .menu{
		margin-top:60px;
		margin-left:100px;
		width:70%;
		height:30px;
		padding:4px;
		background-color:#4444ff;
		box-shadow:2px 2px 3px 0px #aaa;
		border-radius:6px;
	}
	#virtual_class .menu li{
		list-style : none;
		float:left;
		width:90px;
		heigth:23px;
		color:#fff;
		text-align:center;
		border-radius:6px;
	}
	
	#virtual_class .menu li:hover{
		color:#4444ff;
		background-color:#fff;
		transition-property:background-color;
		transition-duration:2s;
	}
	
	/*짝수 번째 메뉴의 바탕색을 변경*/
	#virtual_class .menu li:nth-child(2n){
		color:#00ffcc;
	}
	
	/*첫번째 메뉴와 마지막 메뉴의 색상을 빨강*/
	#virtual_class .menu li:first-child{
		color:#ff0000;
	}
	#virtual_class .menu li:last-child{
		color:#ff0000;
	}
	
	
		#virtual_class .menu li ul{
		display:none;
	}

	#virtual_class .menu li:hover >ul{
		display:block;
	}
	
	
</style>
</head>
<body>
<div id='virtual_class'>
	<h2>가상 클래스, 요소를 사용한 메뉴 설계</h2>
	<div class='menu'>
		<ul>
			<li>MENU1
				<ul>
					<li>부메뉴1</li>
					<li>부메뉴2</li>
				</ul>
			</li>
			<li>MENU2</li>
			<li>MENU3</li>
			<li>MENU4</li>
			<li>MENU5</li>	
			<li>MENU6</li>	
		</ul>
	</div>


</div>
</body>
</html>