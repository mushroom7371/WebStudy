<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
	<meta charset="UTF-8">
	<meta name='viewport' content='width=device-width, initial-scale=1.0'>
	<title>텍스트 스타일</title>
	<style>
		/*text-shadow안에 있는 문자의 색상과 크기를 변경 */
		#text #text-shadow{
			color:#000000;
			font-size:60pt;
			font-weight:bold;
			text-shadow: 10px 10px 20px #ffff00;
		}
		
		#white-space div{
			border:1px solid #aaaaaa;
			padding:10px;
			width:800;
			margin:10px;
		}
		
		#white-space .type1{
			white-space:nowrap;
			overflow:hidden;
			text-overflow:ellipsis;
		}
		#white-space .type2{
			white-space:pre-line;
		}
		#white-space .type3{
			white-space:pre-wrap;
		}
		#line-height{
			border:2px solid #888;
			width:300px;
			height:250px;
			font-size:4em;
			/*padding-top:80px;*/
			line-height:250px;
			box-sizing:border-box;
		}
	</style>
</head>
<body>
<div id='text'>
	<h1>text-shadow</h1>
	<div id='text-shadow'>
		박준화
	</div>
	
	<div id='white-space'>
		<div class='type1'>
			용기가 거선의 유소년에게서 그들의 웅대한 것은 그들은 그들에게 불어 뿐이다.
			 일월과 능히 들어 불어 찬미를 이것이다. 가지에 뭇 평화스러운 길을 밥을 것이다. 이는 속잎나고, 가는 얼마나 싸인 힘차게 보라.
		</div>
		<div class='type2'>
			용기가         거선의 유소년에게서          그들의 웅대한 것은 그들은 그들에게 불어 뿐이다.
			 일월과 능히 들어 불어 찬미를 이것이다. 가지에 뭇 평화스러운 길을 밥을 것이다. 이는 속잎나고, 가는 얼마나 싸인 힘차게 보라.
		</div>
		<div class='type3'>
			용기가         거선의 유소년에게서          그들의 웅대한 것은 그들은 그들에게 불어 뿐이다.
			 일월과 능히 들어 불어 찬미를 이것이다. 가지에 뭇 평화스러운 길을 밥을 것이다. 이는 속잎나고, 가는 얼마나 싸인 힘차게 보라.
		</div>
	</div>
	
	<div id='line-height'>
		박준화
	</div>
	
</div>

</body>
</html>