<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<link rel='stylesheet'
		href='https://code.jquery.com/ui/1.12.1/themes/pepper-grinder/jquery-ui.css'>
<script src='../lib/jquery-3.6.0.min.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<title>sortable</title>
</head>
<body>
<div id='sortable'>
	<ul id='sort_here'>
		<li class='ui-state-default'><span class='ui-icon'></span><span>HTML5</span></li>
		<li class='ui-state-default'><span class='ui-icon'></span><span>CSS3</span></li>
		<li class='ui-state-default'><span class='ui-icon'></span><span>JavaScript</span></li>
		<li class='ui-state-default'><span class='ui-icon'></span><span>Ajax</span></li>
		<li class='ui-state-default'><span class='ui-icon'></span><span>JQUERY</span></li>
		<li class='ui-state-default'><span class='ui-icon'></span><span>JSP</span></li>
		<li class='ui-state-default'><span class='ui-icon'></span><span>MYBATIS</span></li>
		<li class='ui-state-default'><span class='ui-icon'></span><span>SERVLET</span></li>
	</ul>
</div>
<script>
	$('#sort_here').sortable();
</script>
</body>
</html>