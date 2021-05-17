<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>c:if</title>
</head>
<body>
<div id='if'>
<!-- 두 수를 a,b에 대입한 후 큰 값을 출력 -->
<c:set var='a' value='100'/>
<c:set var='b' value='200'/>
<c:if test='${a gt b }'>
	큰값 : ${a }
</c:if>
<c:if test='${a lt b }'>
	큰값 : ${b }
</c:if>
<p/>
<!-- 파라메터로 전달된 c, d 값 중 큰 수를 출력 -->
<c:if test='${param.c gt param.d }'>
	큰값 : ${param.c }
</c:if>
<c:if test='${param.c lt param.d }'>
	큰값 : ${param.d }
</c:if>

</div>

</body>
</html>