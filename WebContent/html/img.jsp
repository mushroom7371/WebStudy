<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>이미지 태그</title>
</head>
<body>

<div id='img'>

<h2>절대 경로</h2>
<img src='/WebStudy/imgs/dog1.jpeg' width='400px'/>
<br/>
<img src='/WebStudy/imgs/dog2.jpeg' width='400px'/>

<h2>상대 경로</h2>
<img src='../imgs/dog3.jpeg' width='400px' />
<br/>
<img src='../imgs/dog4.jpeg' width='400px' />

</div>
<h2>웹상에 있는 이미지 연결</h2>
<img src='https://postfiles.pstatic.net/MjAxNzAxMTNfMjM4/MDAxNDg0MzEwMTg3MzUw.M_emfr5JoUrNoq117KnwWsZsBLrBa6AgIFXqQ3fmZOkg.lTjHqmXbFoF5HsGtuRL8j3uQgvPSd5VyvH1UqCfEkv4g.JPEG.soyeon1616/5.jpg?type=w1' width='400px'/>

<h2>이미지와 텍스트</h2>
<div>
	<img src='../imgs/dog4.jpeg' width='400px' align='left' hspace='50px' vspace='50px' />
	리트리버 (Retriever)는 개 품종의 하나로, 대표적인 사냥개이다. 주로 새와 같은 사냥감을 찾아서 손상없이 주인에게 가져다주는 역할을 했다. 
	
</div>

</body>
</html>