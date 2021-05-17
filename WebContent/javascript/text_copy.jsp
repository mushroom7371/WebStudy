<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>text_copy</title>
<style>
	
	#text_copy{
		width:500px;
		margin:30px auto;
	}
	
	#text_copy input[type=button]{
		margin-top:20px;
		margin-bottom:40px;
	}

</style>
</head>
<body onload='main()'>
<div id='text_copy'>

	<form name='frm' method='post' action=''>
		<h2>text 입력상자의 값</h2>
		<label>원본</label>
		<input type='text' size='50' name='ori'/>
		<br/>
		<label>사본</label>
		<input type='text' size='50' name='target'/>
		<br/>
		<input type='button' value='COPY' id='btn'/>
	</form>

</div>

<script>
	function main(){
		var btn = document.getElementById('btn');
		btn.onclick = function(){
			var ff = document.frm;
			copy(ff);
		}
	}
	
	function copy(ff){
		var v = ff.ori.value;
		ff.target.value = v;
	}
</script>

</body>
</html>