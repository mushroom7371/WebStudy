<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>상세보기</title>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/board.js'></script>
<script src='./js/image_preview.js'></script>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/board.css'>
</head>
<body>
<div id='board'>

	<h1>상세보기</h1>
	<form name='frm_board' id='frm_board' method='post' action=''>
		
		<label>작성자</label>
		<input type='text' name='mid' value='${vo.mid }' />
		<br/>
		
		<label>제목</label>
		<input type='text' name='subject' value='${vo.subject }' />
		<br/>
		
		<textarea name='doc'>${vo.doc }</textarea>
		<br/>

		<div id='image_preview'>
			<c:forEach var='f' items="${vo.attList}">
				<a href='upload/${f.sysAtt }' download='${f.oriAtt }'>
					<img src='./upload/${f.sysAtt }' width='150px' height='180px'/>
				</a>
			</c:forEach>
		</div>
		<!-- multiple은 파일 다중 선택 html5에서 추가됨. -->

		<div id='btn_zone'>
			<input type='button' value='수정' id='btnModify'/>
			<input type='button' value='삭제' id='btnDelete'/>
			<input type='button' value='답글' id='btnRepl'/>
			<input type='button' value='취소' id='btnSearch'/>
		</div>
		
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='serial' value='${param.serial }'/>
		
		<input type='password' name='pwd' />
	</form>
	
		<div id='brdPasswordZone'>
			<div id='textZone'>
				<label>삭제하시려면 암호를 입력해 주세요.</label>		
				<input type='password' id='pwd'/>
				<input type='button' value='확인' id='btnDeleteR'/>
				<input type='button' value='취소' id='btnCancel'/>	
			</div>		
		</div>
</div>
<script>
brd.init();
</script>
</body>
</html>