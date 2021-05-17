<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>usemap</title>
</head>
<body>

<div id='usemap'>

	<fieldset>
		<legend>usemap</legend>
		<dl>
			<dt>shape</dt>		
			<dd>circle, rect, poly</dd>
		
			<dt>coords</dt>
			<dd>
				- circle='x, y, r' => x,y원의 중점이고, r은 원의 반지름.<br/>
				- rect='x1,y1, x2,y2' => x1,y1은 사각형의 좌측상단 모서리의 좌표. x2,y2는 우측 하단 모서리<br/>
				- poly='x1,y1, x2,y2, x3,y3, ...' =>각각의 좌표를 이은 선이 영역이됨.
				
			</dd>
		</dl>
	</fieldset>
	
	<img src='../imgs/dog4.jpeg' usemap='#dog'/>
	
	<map name='dog'>
		<area shape='circle' coords='324,370,60' href='http://www.naver.com' alt='네이버'/>
		<area shape='poly' coords='236,176, 222,257, 369,241, 373,182' href='http://www.jobtc.kr' alt='IT여행자'/>
		<area shape='rect' coords='250,460, 390,590' href='http://www.daum.net' alt='다음'/>
	</map>

</div>

</body>
</html>