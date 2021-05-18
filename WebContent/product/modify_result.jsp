<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="vo" class="product.ProductVo" scope="request"/>
<jsp:setProperty name="vo" property="*"/>
<!-- Bean태그를 통하여 vo객체에 데이터가 저장되었다. -->

<%
	ProductDao dao = new ProductDao();
	String msg = dao.modify(vo);
	System.out.println(msg);
%>