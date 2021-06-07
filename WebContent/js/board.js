/**
 * 게시판 핸들링을 위한 js
 */

var brd = {};	//리터럴 생성

brd.init = function(){
	$('#board #btnSearch').on('click', function(){
		var frm = $('#frm_board')[0];
		
		if(frm.serial.value =='') frm.serial.value = 0;
		if(frm.nowPage.value == '') frm.nowPage.value = '1';
		
		var param = $(frm).serialize();
		$('#board').load('./board.do?job=search', param);
	})
	
	$('#board #btnFind').on('click', function(){
		var frm = $('#frm_board')[0];
		frm.nowPage.value = 1;
		var param = $(frm).serialize();
		$('#board').load('./board.do', param);
	})
	
	$('#board #btnInsert').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/register.jsp', param);
	})
	
	$('#board #btnInsertR').on('click', function(){
		var frm = $('#frm_board')[0];
		
		//내용 입력폼과 파일 업로드 폼이 분리되지 않아서 필요함
		if(frm.findStr.value == '') frm.findStr.value = ' ';
		if(frm.serial.value =='') frm.serial.value = 0;
		if(frm.nowPage.value == '') frm.nowPage.value = '1';
		
		var data = new FormData(frm);
		
		$.ajax({
			type : 'POST',
			url : './boardUpload.do?flag=insert',
			enctype : 'multipart/form-data',
			data : data,
			contentType : false,	//form 태그의 정보를 text가 아닌 bianary로 전달하라는 의미
			processData : false,	//form 태그의 정보를 text가 아닌 bianary로 전달하라는 의미
			success : function(resp){
				alert("성공!~");
				$('#board').load('./board.do');
			}
		})
		
	});
	/* 수정------------------------------- */
	$('#board #btnModify').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/modify.jsp', param);
	})
	
	$('#board #btnUpdate').on('click', function(){
		
	})
	
	$('#board #btnUpdateR').on('click', function(){
		
	})
	
	
	$('#board #btnView').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/view.jsp', param);
	})
	
	$('#board #btnRepl').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/repl.jsp', param);
	})
	
	$('#board #btnReplR').on('click', function(){
		
		
	})
	
	$('#btnDeleteR').on('click', function(){
		var pwd = $('#brdPasswordZone #pwd').val();
		var frm = $('#frm_frm')[0];
		frm.pwd.value = pwd;		
		var param = $('#frm_frm').serialize();
		
		$('#border').load(url + 'deleteR', param, function(){
			$('#brdPasswordZone').css({
			'display' : 'none'
			})
		});
	})
	
	$('#btnDelete').on('click', function(){
		$('#brdPasswordZone').css({
			'display' : 'block'
		})
	})
	
	$('#btnCancel').on('click', function(){
		$('#brdPasswordZone').css({
			'display' : 'none'
		})
	})
		
}

brd.view = function(serial){
	var frm = $('#frm_board')[0];
	frm.serial.value = serial;
	var param = $(frm).serialize();
	$('#board').load('./board.do?job=view', param);
}


brd.move = function(nowPage){
	var frm = $('#frm_board')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#board').load('./board.do', param);
}
