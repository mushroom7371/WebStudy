<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<link rel='stylesheet' type='text/css' href='./css/index.css'>
<title>index</title>
</head>
<body>
<%
	//기본 include 페이지
	String border = "./board/search.jsp";
	String stock = "./product/modify.jsp";
	String gb = "./guestbook/list.jsp";
	//읽어올 페이지의 경로를 변수에 담아 두었다.
%>
	<div id='index'>
		<div id='login'>
			<jsp:include page="loginForm.jsp"/>
			<!-- 동적 삽입으로 부모페이지가 실행되어질 시점에 include한 파일이 삽입된다. -->
		
		</div>
	
			<%@include file="header.jsp" %>
			<!-- 정적 삽입으로 jsp가 컴파일되기 전에 include한 파일이 부모 페이지에 삽입되어 컴파일된다. -->
			
		<div id='center'>
		
			<div id='sub_menu'>서브메뉴</div>
			
			<div id='middle'>
				<div id='border'>
					<jsp:include page='<%=border %>'/>
				</div>
				
				<div id='stock'>
					<jsp:include page='<%=stock %>'/>
				</div>
			</div>
			
			<div id='guestbook'>
				<jsp:include page='<%=gb %>'/>
			</div>
			
		</div>
		<%@include file="footer.jsp" %>
	</div>

</body>
</html>