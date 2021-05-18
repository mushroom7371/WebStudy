<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String serial = request.getParameter("serial");	//parameter 값으로 serial 값을 요청받아 변수에 저장함
	ProductDao dao = new ProductDao();	//ProductDao 객체를 생성하게 되어 데이터베이스에 연동된다.
	String msg = dao.delete(serial);
	System.out.println(msg);	//외부에는 표시되지 않는 확인용 출력메서드
%>