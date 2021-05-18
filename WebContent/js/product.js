/**
 * 제품관리에 사용되는 스크립트
 */

var product = {};	//리터럴 형태로 객체가 만들어졌다. 리터럴로 생성되면 new로 생성이 불가능하다.
product.init = function(){	//product 객체의 init를 호출하면 function()이 실행된다.

	$('#checkAll').on('click', function(){	//checkAll이 클릭되면 function을 실행한다.
		var chk = document.frm_product.gubun;	//변수 chk에 search의 form name의 gubun을 담는다.
		
		for(var i of chk){	//chk는 같은 이름을 가지므로 배열로 저장되고 이 안의 i 번지마다 반복한다.
			i.checked=this.checked;
			//this 는 자기자신 checkAll을 의미한다. 
		}
	});
	
	$('#btnFind').on('click', function(){	//btnFind가 클릭되었을때 실행된다.
		document.frm_product.nowPage.value = 1;	//검색버튼이 실행 되면 무조건 1page로 이동하도록 한다.
		var param = $('#frm_product').serialize();	//변수 param 에 frm_product의 값을 직렬화 하여 저장한다.
		$('#product').load('./product/search.jsp', param);
		//product에 param 값을 가지고 search.jsp 페이지를 로드한다.
	})
}

product.move = function(nowPage){	//product의 move가 호출 되면 fucntion이 실행되는데 매개변수로 받은 값을 통하여
	document.frm_product.nowPage.value = nowPage;	//frm_product의 nowPage 값을 매개변수 값으로 바꿔준다.
	var param = $('#frm_product').serialize();
	
	$('#product').load('./product/search.jsp', param);
}

product.modify = function(serial){
	document.frm_product.serial.value = serial;	//frm_product의 nowPage 값을 매개변수 값으로 바꿔준다.
	var param = $('#frm_product').serialize();
	
	$('#product').load('./product/modify.jsp', param);
}

product.select = function(){	//modify.jsp 에서 취소버튼을 클릭 할시 이전 화면으로 되돌아 오도록 param 값을 통하여 search.jsp를 load 한다.
	var param = $('#frm_product').serialize();
	$('#product').load('./product/search.jsp', param);
}


product.deleteR = function(){	//modify.jsp 에서 삭제 버튼을 클릭할시
	var yn = confirm("정말 삭제 하시겠습니까?");
	if(!yn) return;
	//확인창을 띄워 true 일 경우 삭제를 진행, false 일 경우 return 한다.
	var param = $('#frm_product').serialize();
	$.ajax({	//.ajax형식으로 아래의 요청을 표현한다.
		type	: 'POST',	//post 타입으로 
		url		: './product/delete_result.jsp',	//이 주소의 url을
		data	: param,	//요청과 함께 서버로 param 데이터를 넘겨준다.
		success	: function(resp){	
			$('#product').load('./product/search.jsp', param);
			//요청이 성공했을때 함수를 호출하여 search.jsp 페이지를 보여준다.
		},
		error	: function(xhr, status, resp){
			alert("삭제중 오류 발생");
		}
	})
}

product.modifyR = function(){
	var yn = confirm("정말 수정 하시겠습니까?");
	if(!yn) return;
	//확인창을 띄워 true 일 경우 수정을 진행, false 일 경우 return 한다.
	var param = $('#frm_product').serialize();
	$.ajax({	//.ajax형식으로 아래의 요청을 표현한다.
		type	: 'POST',	//post 타입으로 
		url		: './product/modify_result.jsp',	//이 주소의 url을
		data	: param,	//요청과 함께 서버로 param 데이터를 넘겨준다.
		success	: function(resp){	
			$('#product').load('./product/search.jsp', param);
			//요청이 성공했을때 함수를 호출하여 search.jsp 페이지를 보여준다.
		},
		error	: function(xhr, status, resp){
			alert("삭제중 오류 발생");
		}
	})
}

product.insert = function(){
	var param = $('#frm_product').serialize();
	$('#product').load('./product/register.jsp', param);
}

product.insertR = function(){
	var param = $('#frm_product').serialize();
	
	$.ajax({	//.ajax형식으로 아래의 요청을 표현한다.
		type	: 'POST',	//post 타입으로 
		url		: './product/register_result.jsp',	//이 주소의 url을
		data	: param,	//요청과 함께 서버로 param 데이터를 넘겨준다.
		success	: function(resp){	
			$('#product').load('./product/search.jsp', param);
			//요청이 성공했을때 함수를 호출하여 search.jsp 페이지를 보여준다.
		},
		error	: function(xhr, status, resp){
			alert("삭제중 오류 발생");
		}
	})
}






