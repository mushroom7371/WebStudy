<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>loda_xml</title>
</head>
<body>
<div id='load_xml'>
	<input type='button' value='text.xml' id='btnXML'/>
	<input type='button' value='xml_data' id='btnXMLData'/>
	
	<div id='result'></div>

</div>
<script>
	var xhr = new XMLHttpRequest();
	var rs = document.getElementById('result');
	var btn = document.getElementById('btnXML');
	var btnXML = document.getElementById('btnXMLData');
	btn.onclick = function(){
		xhr.open('get', 'text.xml');
		xhr.send();
		xhr.onreadystatechange=function(){
			if(xhr.status==200 && xhr.readyState==4){
				var xml = xhr.responseXML;
				console.log(xml);
				var ids = xml.getElementsByTagName('id');
				var names = xml.getElementsByTagName('name');
				var address = xml.getElementsByTagName('address');
			
				var str = '';
				for(var i = 0; i<ids.length; i++){
					str += "<div class = 'items'>"
						+ "		<span class = 'id'>" + ids.item(i).firstChild.nodeValue + "</span>"
						+ "		<span class = 'name'>" + names.item(i).firstChild.nodeValue + "</span>"
						+ "		<span class = 'addre'>" + address.item(i).firstChild.nodeValue + "</span>"
						+ "</div>"
				}
				rs.innerHTML = str;
						
			}
		}
	}
	
	btnXML.onclick = function(){
		xhr.open('get', 'xml_data.jsp');
		xhr.send();
		xhr.onreadystatechange=function(){
			if(xhr.status==200 && xhr.readyState==4){
				var xml = xhr.responseXML;
				
				var ids = xml.getElementsByTagName('id');
				var names = xml.getElementsByTagName('name');
				var phones = xml.getElementsByTagName('phone');
			
				var str = '';
				for(var i = 0; i<ids.length; i++){
					str += "<div class = 'items'>"
						+ "		<span class = 'id'>" + ids.item(i).firstChild.nodeValue + "</span>"
						+ "		<span class = 'name'>" + names.item(i).firstChild.nodeValue + "</span>"
						+ "		<span class = 'phone'>" + phones.item(i).firstChild.nodeValue + "</span>"
						+ "</div>"
				}
				rs.innerHTML = str;
			}
		}
	}

</script>
</body>
</html>