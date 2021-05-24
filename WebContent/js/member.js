/**
 *회원 관리 
 *var는 재정의가 가능, let은 재정의가 불가능
 **/

var member = {};

member.init = function(){	//member.init을 호출하면 함수가 실행된다.
	var url = './member/member.do?job=';
	//공통 경로 부분을 따로 변수에 담아 두었다.

	$('#btnInsert').on('click', function(){
		//var param = $('frm_member').serialize();
		//$('#border').load(url + 'registerR', param);
		
		var frm = $('#frm_member')[0];
		
		if(frm.findStr.value =='') frm.findStr.value = ' '; //임시조치
		
		var data = new FormData(frm);	//enctype의 경우에는 기존에 사용했던 직렬화의 경우 파일 전달이 안된다. 그래서 FormData()객체를 만들어 사용함.
		
		$.ajax({	//ajax 형식으로 각 데이터를 전달한다.
			type	: 'POST',
			enctype	: 'multipart/form-data',
			url		: './upload.do?falg=insert',
			data	: data,
			processData	: false,	//새로 공부를 해야됨 파일 전달과 관련?
			contentType	: false,
			success	: function(resp){
				$('#member').load('./member/member.do', 'job=search');
			}
		});
	
	})
	
	
	
	
	
	$('#btnRegister').on('click', function(){
		//btnRegister 버튼이 클릭 되었을시 아래의 기능을 실행
		var param = $('#frm_member').serialize();
		//frm_member의 데이터값을 직렬화 하여 param에 저장한다.
		$('#border').load(url + 'register', param);
		//border의 영역에 register페이지를 로드하여 준다.
	})
	
	
	$('#btnSelect').on('click', function(){
		var param = $('#frm_member').serialize();
		$('#border').load(url + 'search', param);
	})
	
	$('#btnDeleteR').on('click', function(){
		var pwd = $('#passwordZone #pwd').val();
		var frm = $('#frm_member')[0];
		frm.pwd.value = pwd;		
		var param = $('#frm_member').serialize();
		
		$('#border').load(url + 'deleteR', param, function(){
			$('#passwordZone').css({
			'display' : 'none'
			})
		});
	})
	
	$('#btnDelete').on('click', function(){
		$('#passwordZone').css({
			'display' : 'block'
		})
	})
	
	$('#btnCancel').on('click', function(){
		$('#passwordZone').css({
			'display' : 'none'
		})
	})
	
	$('#btnModify').on('click', function(){
		var param = $('#frm_member').serialize();
		$('#border').load(url + 'modify', param);
	})
	
	$('#btnUpdate').on('click', function(){
		$('#passwordZone').css({
			'display' : 'block'
		})
	})
	
	$('#btnUpdateR').on('click', function(){
		var pwd = $('#passwordZone #pwd').val();
		var frm = $('#frm_member')[0];
		frm.pwd.value = pwd;
		
		if(frm.findStr.value == '') frm.findStr.value = ' ';
		
		var data = new FormData(frm);
		
		$.ajax({
			type	: 'POST',
			url		: 'upload.do?flag=update',
			enctype	: 'multipart/form-data',
			data	: data,
			contentType	: false,
			processData	: false,
			success	: function(resp){
				$('#border').load('./member.do', 'job=search');
			}
		});
	})
	
	
	$('#btnFind').on('click', function(){
		var param = $('#frm_member').serialize();
		$('#border').load(url + 'search', param);
	})
	
	
	$('#photo').on('click',function(){
		var frm = document.frm_member;
		frm.picture.click();
	})

	
}


member.view = function(mid){
	var url = './member/member.do?job=';
	var frm = $('#frm_member')[0];
	frm.mid.value = mid;
	var param = $('#frm_member').serialize();
		$('#border').load(url + 'view', param);
}

member.move = function(nowPage){
	var url = './member/member.do?jab=search';
	var frm = $('#frm_member')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#border').load(url,param);
}

member.checkHost = function(host){	//입력상자가 매개변수로 받은 값으로 선택되도록 하는 함수
	var frm = $('#frm_member')[0];
	switch(host){
		case 'IT여행자'	:
			frm.host[0].selected = true;
			break;
		case 'acorn'	:
			frm.host[1].selected = true;
			break;
		case '네이버'	:
			frm.host[2].selected = true;
			break;
		case '네이트'	:
			frm.host[3].selected = true;
			break;
		case '다음'	:
			frm.host[4].selected = true;
			break;
		
	}
}

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

//file tag의 내용이 변경된 경우
	var pic = $('#picture')[0];
	if(pic !=null){
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
}








