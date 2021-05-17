<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, inital-scale=1.0'>
<title>텍스트와 관련된 태그</title>
</head>
<body>
<fieldset>
	<legend>Hn</legend>
	<ul>
		<li>범위는 h1~h6 까지 사용가능</li>
		<li>자동으로 굵게 표시됨</li>
		<li>위 아래 부분에 빈줄이 추가됨</li>
	</ul>
</fieldset>
	
<h1>가장 큰 heading</h1>
<h6>가장 작은 heading</h6>

<fieldset>
	<legend>p | br | hr </legend>
	<ul>
		<li>문단을 만들어 내는 태그</li>
		<li>아래에 한줄의 공백이 추가됨</li>
		<li>br : 태그는 줄을 바꿔주는 태그</li>
		<li>hr : 수평선을 그어주는 태그=>html5에서는 section을 구분해 주는 기능으로 변경됨</li>
	</ul>
</fieldset>
<p>첫번째 문단</p>
<p>두번째 문단</p>
<p>세번째 문단 <br/><br/> 줄을 바꾼 후 한줄이 떨어짐 </p>
<hr/>

<fieldset>
	<legend>strong | b | i | q | mark | span </legend>
	<ul>
		<li>strong or b : 텍스트 중에서 굵게 표시하려고 할때 사용하는 태그 strong은 경고나 주의 등, b는 단순히 굵게 표시하는 용도 </li>
		<li>i : 비스듬하게 이탤릭체로 표시할 때 사용하는 태그</li>
		<li>q : 인용한 내용을 표시하기 위한 태그 blockquot와 조금 다름</li>
		<li>mark : 형광펜 효과 내는 태그 </li>
		<li>span : 줄바꿈 없이 영역을 묶는 태그 </li>
		
	</ul>
</fieldset>
<strong>strong</strong>처럼 굵게 표시되고<i>이탤릭체로</i>나오기도 하며
<q>하루를 공부하지 않으면 그것을...</q>와 같이 인용할 수도 있고<mark> 중요내용은</mark>
형광색으로 칠할 수 있으며 <span>span 태그는 영역을 인라인 형태로 묶을 수 있다.</span>

<hr/>
<h2>태그의 block 타입과 inline 타입의 비교</h2>
block 타입은 갖고있는 컨텐츠의 양이 적더라도 남아있는 오른쪽에 다른 요소들이 올 수 없고, 
inline 타입은 갖고있는 컨텐츠의 양만큼만 영역을 차지하면서 남아있는 오른쪽에 다른 요소들을
올 수 있게 하는 특징을 갖고 있다. CSS에서는 이 둘의 장점만 갖고 있는 inline-block 타입을 지원한다.

<div>문단1</div><div>문단2</div><div>문단3</div>

<hr/>

<span>묶음1</span>
<span>묶음2</span>
<span>묶음3</span>














</body>
</html>