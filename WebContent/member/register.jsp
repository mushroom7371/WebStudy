<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>회원가입</title>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/member.css'>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/member.js'></script>
<script src='//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>
<!-- 우편번호를 가져오기위한 다음 api-->
</head>
<body>
	<div id='member'>
		<h1>회원가입</h1>
	<form name='frm_member' id='frm_member' method='post' action=''>
	<!-- 파일 업로드를 위해 enctype을 추가함. -->
		
		<label>아이디</label>
		<input type='text' name='mid' value='hong'/>
		<br/>
		
		<label>성명</label>
		<input type='text' name='irum' value='길동이'/>
		<br/>
		
		<label>암호</label>
		<input type='password' name='pwd'/>	<!-- name이 같으면 배열로 처리됨 -->
		<output>확인</output>
		<input type='password' name='pwd'/>
		<br/>
		
		<label>연락처</label>
		<input type='text' name='phone' value='010-1111-1111'>
		<br/>
		
		<label>주소</label>
		<input type='text' name='post' readonly />
		<input type='button' name='btnZipCode' value='우편번호' onclick='funcZip()'/>
		<br/>
		
		<label></label>
		<input type='text' name='address' size='50'/>
		<br/>
		
		<label>상세주소</label>
		<input type='text' name='address2' size='50'/>
		<br/>
		
		<label>이메일</label>
		<input type='text' name='email'/>
		<output>@</output>
		<select name='host' size='1'>
			<option value='IT여행자'>IT여행자</option>
			<option value='acorn'>acorn</option>
			<option value='네이버'>네이버</option>
			<option value='네이트'>네이트</option>
			<option value='다음'>다음</option>
		</select>

		<div id='btn_zone'>
		<input type='button' value='가입' id='btnInsert'/>
		<input type='button' value='취소' id='btnSelect'/>
		</div>
		
		<img src='http://placehold.it/150X180' width='150' height='180'
		 class='photo' id='photo'/>
		
	<input type='text' name='nowPage' value='${param.nowPage }'/>
	<input type='text' name='findStr' value='${param.findStr }'/>
	<input type='file' name='picture' id='picture'/>
		
	</form>
	</div>
<!-- servlet 테스트용
<script>
function servletTest(){
	var frm = document.frm_register;
	frm.action = "../my.nhn";
	frm.submit();
}
</script>
 -->
<script>member.init();</script>
<script>
//우편번호 검색
function funcZip(){
	var frm = document.frm_member;
		//frm의 btnZipCode 가 클릭 되었을시 함수 실행
	new daum.Postcode({
		oncomplete : function(data)	{
			frm.post.value = data.zonecode;
			frm.address.value = data.address;
		}		
	}).open();
	
}

$('#photo').on('click',function(){
	var frm = document.frm_member;
	frm.picture.click();
})

//file tag의 내용이 변경된 경우
var pic = document.getElementById('picture');

pic.onchange = function(ev){
	var files = ev.srcElement.files;
	var reader = new FileReader();
	reader.readAsDataURL(files[0]);
	reader.onload = function(ev2){
		var img = new Image();
		img.src = ev2.target.result;

		$('#photo')[0].src = img.src;
	}
}


</script>
<!-- member.js 파일의 member.init()를 불러온다. -->
</body>
</html>