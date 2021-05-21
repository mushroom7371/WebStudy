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
		var data = new FormData(frm);	//enctype의 경우에는 기존에 사용했던 직렬화의 경우 파일 전달이 안된다. 그래서 FormData()객체를 만들어 사용함.
		
		$.ajax({	//ajax 형식으로 각 데이터를 전달한다.
			type	: 'POST',
			enctype	: 'multipart/form-data',
			url		: '/WebStudy/upload.do',
			data	: data,
			processData	: false,	//새로 공부를 해야됨 파일 전달과 관련?
			contentType	: false,
			success	: function(resp){
				$('#member').load('/WebStudy/member/member.do');
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
		var param = $('frm_member').serialize();
		$('#border').load(url + 'search', param);
	})
	
	$('#btnDelete').on('click', function(){
		var param = $('frm_member').serialize();
		$('#border').load(url + 'deleteR', param);
	})
	
	$('#btnModify').on('click', function(){
		var param = $('frm_member').serialize();
		$('#border').load(url + 'modify', param);
	})
	
	$('#btnUpdate').on('click', function(){
		var param = $('frm_member').serialize();
		$('#border').load(url + 'modifyR', param);
	})
	
	$('#btnFind').on('click', function(){
		var param = $('frm_member').serialize();
		$('#border').load(url + 'search', param);
	})
	
}


member.view = function(){
	var url = './member/member.do?job=';
	
	var param = $('frm_member').serialize();
		$('#border').load(url + 'view', param);
}















