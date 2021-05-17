<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<script src='../lib/jquery-3.6.0.min.js'></script>
<title>one</title>
</head>
<body>
<div id='one'>
	<label>아이디</label>
	<input type='text' name='min' id='mid'/>
	<input type='button' value='one' id='one'/>
	<div id='result'></div>

</div>
<script>
	var cnt = 0;
	$('#one').one('click', function(){
		cnt++;
		$('#result').html(cnt);
	})

</script>
</body>
</html>