<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>checkbox</title>
<style>
	#checkbox{
		width:400px;
		margin:0 auto;
	}
	#checkbox textarea{
		width:100%;
		height:150px;
	}

</style>
</head>
<body>
<div id='checkbox'>
	<h2>Checkbox Sample</h2>
	<div>
		연예인
	</div>
	<form name='frm' method='post' action=''>
		<textarea name='ta'></textarea>
		<br/>
		<label><input type='checkbox' name='chk' value='유나'/>유나</label>
		<label><input type='checkbox' name='chk' value='아이유'/>아이유</label>
		<label><input type='checkbox' name='chk' value='펀치'/>펀치</label>
		<label><input type='checkbox' name='chk' value='초롱'/>초롱</label>
		<br/>
		<label><input type='checkbox' name='chk' value='예원'/>예원</label>
		<label><input type='checkbox' name='chk' value='양지원'/>양지원</label>
		<label><input type='checkbox' name='chk' value='은하'/>은하</label>
	
		<br/>
		<input type='button' value='선택' id='btn'/>
		<input type='reset' value='다시'/>
	</form>

</div>
<script>
	var ff = document.frm;
	var btn = document.getElementById('btn');
	btn.onclick = process;

	function process(){
		var leng = ff.chk.length;
		var str= [];
		ff.ta.value='';
		for(var i = 0; i < leng; i++){
			if(ff.chk[i].checked){
				str.push(ff.chk[i].value);
			}
		}
		
		ff.ta.value = str.join('');
	}
</script>


</body>
</html>