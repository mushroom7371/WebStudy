/**
 * 게시판 핸들링을 위한 js
 */

var brd = {};	//리터럴 생성

brd.init = function(){
	$('#board #btnSearch').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board.do', param);
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
		
		var data = new FormData(frm);
		
		$.ajax({
			type : 'POST',
			url : './boardUpload.do?flag=insert',
			enctype : 'multipart/form-data',
			data : data,
			contentType : false,
			processData : false,
			success : function(resp){
				alert("성공!~");
				$('#board').load('./board.do');
			}
		})
		
	});
	
	$('#board #btnModify').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/modify.jsp', param);
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
		
}

brd.view = function(serial){
	var frm = $('#frm_board')[0];
	var param = $(frm).serialize();
	$('#board').load('./board/view.jsp', param);
}


brd.move = function(nowPage){
	var frm = $('#frm_board')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#board').load('./board.do', param);
}
