<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>json_form</title>
<style>
	*{
		margin:0;
		padding:0;
		box-sizing: border-box;
	}
	#json_form{
		width:500px;
		margin:30px auto;
	}
	#json_form>h2{
		margin-bottom:20px;
	}
	#json_form .input_zone{
		text-align: right;
	}
	
	#json_form .title{
		background-color: #444;
		color:#fff;
		padding:3px;
	}
	
	#json_form span{ display: inline-block;}
	
	#json_form .fn{ width: 120px;}
	#json_form .em{ width: 120px;}
	#json_form .ph{ width: 150px;}
	#json_form .sa{ width: 70px; text-align: right;}
	
	#json_form .result{
		width:100%;
		border:1px solid #aaa;
		padding:10px;
		min-height:200px;
	}
</style>
</head>
<body>
<div id='json_form'>
	<h2>회원 검색</h2>
	<div class='input_zone'>
		<form name='frm' method='post' onsubmit='return false'>
			<label>검색어</label>
			<input type='text' size='40' name='findStr'/>
			<input type='button' value=' 검 색 ' id='btnFind'/>
		</form>
	</div>
	<div class='title'>
		<span class='fn'>성명</span>
		<span class='em'>이메일</span>
		<span class='ph'>연락처</span>
		<span class='sa'>급여</span>
	</div>
	<div class='result'></div>
</div>
<script>
	var frm = document.frm;
	var btn = document.getElementById('btnFind');
	var input = frm.findStr;//document.frm.findStr
	var xhr = new XMLHttpRequest();
	var rs = document.getElementsByClassName('result')[0];
	         
	input.onkeyup = funcKey;
	btn.onclick = funcFind;

	function funcKey(ev){
		if(ev.keyCode == 13){
			funcFind();
		}
	}
	
	function funcFind(){
		var url='json_form_result.jsp'
		var data ={};
		data.findStr = frm.findStr.value;
		
		var param = JSON.stringify(data);
		console.log(param)
		
		url = url + "?findStr=" + frm.findStr.value;

		xhr.open('get', url)
		xhr.send()
		xhr.onreadystatechange = function(){
			if(xhr.status==200 && xhr.readyState==4){
				var temp = xhr.responseText;
				rs.innerHTML = temp;
				//var json = JSON.parse(temp);
				
				
			}
		}
	}
</script>
</body>
</html>
