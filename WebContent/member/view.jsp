<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>회원정보 상세보기</title>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/member.css'>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/member.js'></script>
</head>
<body>
<div id='member'>
		<h1>회원정보 상세보기</h1>
	<form name='frm_member' id='frm_member' method='post' action=''>
		
		<label>아이디</label>
		<input type='text' name='mid' value='${vo.mid }'/>
		<br/>
		
		<label>성명</label>
		<input type='text' name='irum' value='${vo.irum }'/>
		<br/>

		<label>연락처</label>
		<input type='text' name='phone' value='${vo.phone }'>
		<br/>
		
		<label>주소</label>
		<input type='text' name='post' value='${vo.post }'/>

		<br/>
		<label></label>
		<input type='text' name='address' size='50' value='${vo.address }'/>
		<br/>
		
		<label>상세주소</label>
		<input type='text' name='address2' size='50' value='${vo.address2 }'/>
		<br/>
		
		<label>이메일</label>
		<input type='text' name='account' value='${vo.account }'/>
		<output>@</output>
		<select name='host'>
			<option value='IT여행자'>IT여행자</option>
			<option value='acorn'>acorn</option>
			<option value='네이버'>네이버</option>
			<option value='네이트'>네이트</option>
			<option value='다음'>다음</option>
		</select>

		<div id='btn_zone'>
		<input type='button' value='수정' id='btnModify'/>
		<input type='button' value='삭제' id='btnDelete'/>
		<input type='button' value='취소' id='btnSelect'/>
		</div>
		
		<c:choose>
			<c:when test="${vo.photo eq null }">
				<img src='http://placehold.it/150X180' class='photo'/>
			</c:when>
			
			<c:when test="${vo.photo ne null }">
				<img src='./member/picture/${vo.photo}' class='photo' width='150px' height='180px' />
			</c:when>
		</c:choose>
		
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='pwd'/>
		
	</form>
		<!-- 삭제버튼 클릭시 확인창이 나타나도록 하는 영역 설정 -->
		<div id='passwordZone'>
			<div id='textZone'>
				<label>삭제하시려면 암호를 입력해 주세요.</label>		
				<input type='password' id='pwd'/>
				<input type='button' value='확인' id='btnDeleteR'/>
				<input type='button' value='취소' id='btnCancel'/>	
			</div>		
		</div>
</div>
<script>
member.init();
member.checkHost('${vo.host}');

</script>
<!-- member.js 파일의 member.init()를 불러온다. -->
</body>
</html>