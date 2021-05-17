<%@page import="chap10.StudentVo"%>
<%@page import="chap10.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>login</title>
</head>
<body>
<div id='login'>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
	//loginForm.jsp의 id,password 값이 입력되는 상자의 데이터를 가져오는(getParameter) 요청(request)하여 변수에 담았다
	StudentDao dao = new StudentDao();
	//StudentDao 클래스로 부터 객체를 생성하여 그 주소값을 StudentDao 타입의 참조변수 dao에 담는다.
	
	StudentVo vo = dao.login(id, pwd);
	//StudentVo 타입의 참조변수 vo에 dao의 login()메서드를 통하여 반환 받은 데이터를 저장한다.
	//login()는 반환타입이 StudentVo 이며 매겨변수로 받은 값을 이용하여 데이터베이스를 sql문으로 실행하여 리턴받은 데이터를 객체화 하여 반환한다.
	
	if(vo == null){	//반환 받은 데이터가 없다면 알림창을 띄워 주고 index.jsp로 되돌아 간다.
	%>
		<script>
			alert('아이디나 암호가 잘못되었습니다.');
			location.href = 'index.jsp';
		</script>
	<%	}else{	//데이터가 존재 한다면 아래와 같은 형식으로 데이터값들을 불러와 표현식을 통하여 표시한다.%>
	<ul>
		<li>mid	: <%=vo.getMid() %></li>
		<li>irum : <%=vo.getIrum() %></li>
		<li>phone : <%=vo.getPhone() %></li>
		<li>address : <%=vo.getAddress() %></li>
		<li>email : <%=vo.getEmail() %></li>
		<li>pwd : <%=vo.getPwd() %></li>
		<li>grade : <%=vo.getGrade() %></li>
		
	</ul>
	
	<% 
	
	session.setAttribute("id", vo.getMid());	//세션에 id값을 저장한 후 index페이지로 돌아간다.
	response.sendRedirect("index.jsp");
	
	
	} %>
</div>
</body>
</html>