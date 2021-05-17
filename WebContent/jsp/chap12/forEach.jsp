<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="gb.GuestBookVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>forEach</title>
</head>
<body>
<div id='forEach'>
<h3>1~100 출력</h3>
<c:forEach var="i" begin="1" end="100">
	${i }

</c:forEach>

<h3>1~100 홀수 출력</h3>
<c:forEach var="i" begin="1" end="100" step="2">
	${i }
</c:forEach>

<h3>1~100 까지 합계</h3>
<c:set var="hap" value="0"/>
<c:forEach var='i' begin='1' end='100'>
	<c:set var='hap' value='${hap + i }'/>	
</c:forEach>
hap : ${hap }

<h3>Array 출력</h3>
<%
int[] score = {2,12,23,4326,45,7,1234,34,7,568,23,234};
request.setAttribute("score", score);
%>

<c:forEach var='v' items="<%=score %>">
	${v }<br/>
</c:forEach>

<h4>최대값</h4>
<c:set var='max' value='${score[0] }'/>
<c:forEach var='v' items="${score }">
	<c:if test="${max < v }">
		<c:set var='max' value='${v }'/>	
	</c:if>
</c:forEach>
${max }

<h4>합계</h4>
<c:set var='hap' value='${0 }'/>
<c:forEach var='v' items='${score }'>
	<c:set var='hap' value='${hap + v }'/>
</c:forEach>
${hap }


<h3>List 출력</h3>
<%
	List<GuestBookVo> list = new ArrayList<GuestBookVo>();
	GuestBookVo v1 = new GuestBookVo();
	v1.setSerial(1);
	v1.setMid("hong");
	v1.setNal(new Date());
	v1.setDoc("하이하이~");
	v1.setBgcolor("#ff0000");
	
	GuestBookVo v2 = new GuestBookVo();
	v2.setSerial(2);
	v2.setMid("kim");
	v2.setNal(new Date());
	v2.setDoc("안녕~");
	v2.setBgcolor("#00ff00");
	
	list.add(v1);
	list.add(v2);
	
	request.setAttribute("list", list);
%>
<c:forEach var='o' items="${requestScope.list }">
	<div style='background-color:${o.bgcolor};'>
		<b>serial</b>
		<span>${o.serial }</span><br/>
		<b>mid</b>
		<span>${o.mid}</span><br/>
		<b>nal</b>
		<span>${o.nal }</span><br/>
		<b>doc</b>
		<span>${o.doc}</span><br/>
	</div>


</c:forEach>

<h3>Map 출력</h3>
<%
	Map<String, GuestBookVo> map = new HashMap<String, GuestBookVo>();
	map.put("k1", v1);
	map.put("k2", v2);
	
	request.setAttribute("listMap", map);
%>

<c:forEach var='map' items='${listMap }'>

	<div style='background-color:${map.value.bgcolor};'>
		<b>key</b>
		<span>${map.key }</span><br/>
		<b>serial</b>
		<span>${map.value.serial }</span><br/>
		<b>mid</b>
		<span>${map.value.mid}</span><br/>
		<b>nal</b>
		<span>${map.value.nal }</span><br/>
		<b>doc</b>
		<span>${map.value.doc}</span><br/>
	</div>

</c:forEach>

</div>

</body>
</html>