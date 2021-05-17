<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>mouseover</title>
<style>
	#mouseover{
		width:600px;
		margin:30px auto;
	}
	#mouseover .imgs{
		display:flex;
		flex-direction: r;
		gap:5px;
	}
	#mouseover .imgs img{
		width:96px;
		heigth:100px;
	}
</style>
</head>
<body>
<div id='mouseover'>
<img src='http://placehold.it/500x400' width='500' height='400' id='here'><br/>
<div class='imgs'>
	<img src='../imgs/dog1.jpeg' onmouseover='mover(0)'/>
	<img src='../imgs/dog2.jpeg' onmouseover='mover(1)'/>
	<img src='../imgs/dog3.jpeg' onmouseover='mover(2)'/>
	<img src='../imgs/dog4.jpeg' onmouseover='mover(3)'/>
	<img src='../imgs/retriever.jpg' onmouseover='mover(4)'/>
</div>
<script>
	var imgs=['dog1.jpeg','dog2.jpeg','dog3.jpeg','dog4.jpeg','retriever.jpg'];
	function mover(n){
		var here=document.getElementById('here');
		here.src='../imgs/'+imgs[n];
	}

</script>

</div>
</body>
</html>