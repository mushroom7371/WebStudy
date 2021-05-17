<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>readText</title>
</head>
<body>
<div id='readText'>
	<input type='button' value='READ' id='btnText'/>
	<input type='button' value='게시판' id='btnBoard'/>
	<input type='button' value='방명록' id='btnGuest'/>
	<div id='result'></div>
	<div id='result2'></div>
	<div id='result3'></div>
</div>

<script>
	var xhr = new XMLHttpRequest();
	var btn = document.getElementById('btnText');
	var rs = document.getElementById('result');
	
	//추가한 버튼, div 객체 생성
	var btnBoard = document.getElementById('btnBoard');
	var btnGuest = document.getElementById('btnGuest');
	
	var rs2 = document.getElementById('result2');
	var rs3 = document.getElementById('result3');
	
	
	btn.onclick = function(){
		var url = 'myinfo.txt';
		xhr.open('get', url);
		xhr.send();
		xhr.onreadystatechange = function(){
			console.log(xhr.status + ', ' + xhr.readState);
			if(xhr.status==200 && xhr.readyState==4){ //요청과 응답이 모두 정상일때
				var data = xhr.responseText;
				rs.innerHTML = data;
			}
		}
	}
	
	btnBoard.onclick = function(){
		var url = '../board/search.jsp';
		xhr.open('get', url);
		xhr.send();
		xhr.onreadystatechange = function(){
		if(xhr.status=200 && xhr.readyState==4){
			var data = xhr.responseText;
			rs2.innerHTML = data;
		}
	}
}
	
	btnGuest.onclick = function(){
		var url = '../guestbook/list.jsp';
		xhr.open('get', url);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.status = 200 && xhr.readyState == 4){
				var data = xhr.responseText;
				rs3.innerHTML = data;
			}
		}
	}
	

</script>

</body>
</html>