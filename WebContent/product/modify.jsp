<%@page import="product.ProductVo"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>제품 입출고 수정</title>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/product.css'>
</head>
<body>
<% //스크립트를 열어준다.
String serial = request.getParameter("serial");	//getParameter로 매개변수를 요청하여 반환 받은 값을 변수에 저장한다.
ProductDao dao = new ProductDao();	//이 객체가 만들어 지는 순간 데이터 베이스와 연동된다.
ProductVo vo = dao.selectOne(serial);	//selectOne() 메서드를 통해 데이터베이스로 부터 반환받은 객체를 데이베이스에 저장한다.

request.setAttribute("vo", vo);

%>
<div id='product'>
<h1>제품 입출고 정보 수정</h1>
	<form name='frm_product' id='frm_product' method='post' action=''>
		<label>구분</label>
		<label>
			<input type='radio' name='gubun' value='입고' ${(vo.gubun=='입고')? 'checked' : '' }>입고
			<!-- label로 감싸지 않았을때는 글자를 눌러도 선택이 안됨
			라디오 버튼시 하나가 선택되면 하나는 해제되는 것을 해야됨 name을
			같게 하면 이 기능이 완성됨 name이 배열로 처리되기 때문-->
		</label>
		
		<label>
			<input type='radio' name='gubun' value='출고' ${(vo.gubun=='출고')? 'checked' : '' }>출고
			<!-- vo의 gubun의 데이터 값이 출고 이면 라디오 버튼을 checker로 아니면 비워둔다 -->
		</label>
		<br/>
		
		<label>입출고일</label>
			<input type='date' name='nal' value='${vo.nal }'/>
		<br/>
		
		<label>제품코드</label>
			<input type='text' name='pCode' size='8' value='${vo.pCode }'/>
		<br/>
		
		<label>제품명</label>
			<input type='text' name='pName' size='35 'value='${vo.pName }'/>
		<br/>
		
		<label>수량</label>
			<input type='number' name='ea' value='${vo.ea }'/>
		<br/>
		
		<label>단가</label>
			<input type='number' name='price' value='${vo.price }'/>
		<br/>
		
		<label>금액</label>
			<input type='number' name='amt' readonly value='${vo.amt }'/>
		<br/>
		
		<label>작성자</label>
			<input type='text' name='mid' value='${vo.mid }'/>

		<div id='btn_zone'>
		<input type='button' value='수정' onclick='product.modifyR()'/>
		<input type='button' value='삭제' onclick='product.deleteR()'/>
		<input type='reset' value='취소' onclick='product.select()'/>
		<!-- 각각의 버튼을 클릭하였을 때 product.js 파일에서 해당하는 메서드를 호출한다. -->
		</div>
		
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='findStr' value='${param.findStr }'/>
		<input type='text' name='serial' value='${param.serial }'/>
			
	</form>

</div>
</body>
</html>