<%@page import="product.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="product.Page"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!-- 태그 라이브러리를 사용하기 위해 taglib 디렉티브를 추가하였다. -->
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>제품 입출고 조회</title>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/product.css'>
<!-- 해당 웹 페이지의 css를 적용하기 위해 css파일을 링크로 연결하였다. -->
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/product.js'></script>
<!-- jquery와 직접 만든 product.js를 사용하기 위해 스크립트로 경로를 잡아주었다. -->
</head>
<body>
<%
	String findStr = "";	
	String gubun = "'입고'";	//데이터 베이스에 적용하기 위해 ""안에 ''로 표현하였다.
	int nowPage = 1;
	
	if(request.getParameter("findStr") != null){
		findStr = request.getParameter("findStr");
	}	//findStr에 값이 있다면, 그 값을 변수 findStr에 저장한다.
	
	if(request.getParameterValues("gubun") != null){	//gubun을 배열로 저장하였으나 이를 해제 하였다.
		String [] temp = request.getParameterValues("gubun");	//String 타입의 참조변수 temp를 선언하고 여기에 요청받은 gubun의 파라메타값을 배열로 저장한다.
		gubun = "'" + temp[0] + "'";
		for(int i = 1; i < temp.length; i++){
			gubun += ",'" + temp[i] + "'";
			//데이터 베이스에 문자열을 저장하기 위해 gubun="'출고', '재고'"의 형태로 만들었다.
		}
	}
	
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}//파라메터로 요청받은 nowPage의 값이 있다면, nowPage는 전달받은 값을 int 타입으로 변환한 값으로 저장한다.
	
	ProductDao dao = new ProductDao();
	//SQl 실행명령을 담고있는 ProductDao 클래스로 부터 객체를 생성하고, 이 주소값을 ProductDao 타입의 참조변수에 저장한다.
	
	Page p = new Page(gubun, findStr, 0, nowPage);
	//Page 객체를 생성하고 생성자에 매개변수를 입력하여 반환 받은 값을 Page 타입의 참조변수 p 에 저장한다.
	
	List<ProductVo> list = dao.select(p);
	//참조변수 list 에 dao의 select 메서드로 반환받은 데이터(객체)를 저장한다.
	
	//jstl을 사용하기 위해 request에 저장
	request.setAttribute("p", p);
	request.setAttribute("list", list);
%>

<div id='product'>
	<h1>제품 입출고 조회</h1>
	<form name='frm_product' id='frm_product' method='post' action=''>
	<!-- 선택, 검색 버튼이 위치하는 곳을 form태그로 묶어놨다. form데이터를 서버에 전달하는 방식을 post타입으로 정했다.
	action 속성을 form을 전송할 서버 쪽 스크립트파일을 지정할 수있다. -->
		<input type='button' value='입력' onclick='product.insert()'/>
		<!-- 입력버튼 클릭시 insert()가 실행된다. -->
		<div class='find_zone'>
			<label>
				<input type='checkbox' name='gubun' value='입고'/>입고
			</label>
			<label>
				<input type='checkbox' name='gubun' value='출고'/>출고
			</label>
			<label>
				<input type='checkbox' name='gubun' value='재고'/>재고
			</label>
			<label>
				<input type='checkbox' name='checkAll' id='checkAll' value='모두'/>모두
			</label>
				<input type='text' name='findStr' value="${param.findStr }"/>
				<!-- value는 검색 후에도 검색어가 지워지지 않게 하기위해 설정하였다. -->
				<input type='button' value='검색' id='btnFind'/>
				
				<input type='hidden' name='nowPage' value='${(empty param.nowPage)? 1: param.nowPage }'/>
				<!-- nowPage가 비어있는 값이면 1을 넣어주고 아니면 nowPage로 설정한다. -->
				<input type='hidden' name='serial'/>
				<!-- 수정화면에서 다시 목록으로 이동할때 이전 조회 화면을 보여주기 위해서 만들어두었다. -->
		</div>
	</form>
	
		<div class='title'>
			<span class='no'>NO</span>
			<span class='gubun'>구분</span>
			<span class='nal'>일자</span>
			<span class='code'>제품코드</span>
			<span class='pname'>제품명</span>
			<span class='ea'>수량</span>
			<span class='price'>단가</span>
			<span class='amt'>금액</span>
		</div>
		
		<div class='items'>
		<c:forEach var='v' items="${list }">
			<div class='item' onclick='product.modify(${v.serial})'>
			<!-- items의 항목이 클릭이 되면 product의 modify를 호출하고 해당 seraial을 넘겨준다. -->
				<span class='no'>${v.serial }</span>
				<span class='gubun'>${v.gubun }</span>
				<span class='nal'>${v.nal }</span>
				<span class='code'>${v.pCode }</span>
				<span class='pname'>${v.pName }</span>
				<span class='ea'>${v.ea }</span>
				<span class='price'>${v.price }</span>
				<span class='amt'>${v.amt }</span>
			</div>
		</c:forEach>
		<!-- 각각의 span 태그에 list의 데이터 값을 저장한다. -->
			
		</div>
			<!-- 페이징 처리를 위해 해당 버튼 클릭시 product.js의 move()메서드가 호출되어 기능이 실행된다. -->
			<div id='btn_zone'>
				<input type='button' value='맨처음' onclick='product.move(1)'/>
				<input type='button' value='이전' onclick='product.move(${p.startPage-1})'/>
				
				<c:forEach var='i' begin="${p.startPage }" end="${p.endPage }">
					<input type='button' value='${i }' onclick='product.move(${i})'/>
				</c:forEach>
				
				<input type='button' value='다음' onclick='product.move(${p.endPage+1})'/>
				<input type='button' value='맨끝' onclick='product.move(${p.totPage})'/>
			</div>
</div>
<%
	//checkbox 임시
	String[] chk = request.getParameterValues("gubun");
	if(chk != null){
		for(String s : chk){
			switch(s){
			case "입고" : out.print("<script>document.frm_product.gubun[0].checked=true; </script>");
				break;
			case "출고" : out.print("<script>document.frm_product.gubun[1].checked=true; </script>");
				break;
			case "재고" : out.print("<script>document.frm_product.gubun[2].checked=true; </script>");
				break;
			}
		}
	}
%>

<script>product.init();</script>
</body>
</html>