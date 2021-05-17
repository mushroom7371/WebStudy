<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>object_array</title>
<style>
*{
	margin:0;
	padding:0;
	box-sizing: border-box;
}

#object_array{
	width:700px;
	min-height:400px;	
	margin:40px auto;
	padding:20px;
	border : 3px solid #aaa;
	border-radius:10px;
	position: relative;
}

#object_array h2{
	color : #44f;
	font-size:22pt;
	text-align:center;
	margin-bottom:50px;
}

#object_array .left{
	width:50%;
	height:240px;
	float:left;
	padding:10px;
	border:1px solid #ccc;
}

.left form>label{
	display: inline-block;
	width:60px;
}
.left form>hr{
	margin : 20px auto;
}
.left .btn_zone{
	text-align: center;
	
}

#object_array .right{
	width:50%;
	height:240px;
	float:right;
	padding:10px;
	border:1px solid #ccc;
}

.right .title{
	background-color:#888;
	color : #fff;
	padding:4px 5px;
}

.right .items{
	padding-left : 5px;
	height: 190px;
	overflow-y:scroll;
}
.right span{
	display: inline-block;
}
.right .mid { width: 120px; }
.right .mname{width: 150px;}

.right .item:hover{
	background-color:#ddd;
}



#object_array #btnList{
	color:#00f;
	position:absolute;
	right:17px;
	bottom:13px;
}

</style>
</head>
<body>
<div id='object_array'>
	<h2>Object와 배열을 사용한 응용예</h2>
	<div class='left'>
		<form name='frm' method='post' action=''>
			<label>아이디</label>
			<input type='text' name='mid' />
			<input type='button' value='검색' id='btnFind'/>
			<br/>
			<label>성명</label>
			<input type='text' name='mname'/>
			<br/>
			<input type='button' value='저장' id='btnSave'/>
			<input type='button' value='삭제' id='btnDelete'/>
			<input type='button' value='수정' id='btnModify'/>
		</form>
	</div>
	
	<div class='right'>
		<div class='title'>
			<span class='mid'>아이디</span>
			<span class='mname'>성명</span>
		</div>
		<div class='items'>
			<span class='mid'>hong</span>
			<span class='mname'>홍길동</span>
		</div>	

	</div>
	<input type='button' value='출력' id='btnList'/>
	
</div>
<script type="text/javascript" src="object_array.js"></script>
</body>
</html>