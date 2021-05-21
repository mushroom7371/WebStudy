<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadForm</title>
</head>
<body>
<div id='uploadForm'>
	<h2>File Upload</h2>
	<form name='frm' method='post' enctype='multipart/form-data' action='/WebStudy/upload.do'>
	<!-- 파일 업로드 시 post타입으로만 보낼수 있다. 각 속성은 위와 같이 작성해야 업로드가 가능해짐 -->
		text : <input type='text' name='mid' value='hong'/><br/>
		file1 : <input type='file' name='file1'/><br/>
		file2 : <input type='file' name='file2'/><br/>
		<input type='submit' value='전송'/>
	
	
	</form>

</div>
</body>
</html>