/**
 * file태그에 의해 선택된 이미지 미리보기
 */
function imageView(fileTag, imageZone){
	var ft = document.getElementById(fileTag);
	var izone = document.getElementById(imageZone);
	
	ft.onchange = function(ev){
		var ele = ev.srcElement; //이벤트가 발생한 태그의 객체를 반환/설정한다.
		var files = ele.files;	//files에 ele의 파일들을 저장한다.
		for(var index in files){
			console.table(files[index]);
		}
		
		for(var file of files){
			var reader = new FileReader();	//파일을 읽어들이기 위해 스트림 FileReader 클래스의 객체를 생성한다. 
			reader.readAsDataURL(file);	//reader 객체의 readAsDataURL()을 통해 file의 데이터를 읽어온다. 
			reader.onload = function(ev2){	//데이터를 읽는 것이 성공하면 이벤트를 실행한다.
				var div = makeItem(izone);	//하단에 생성한 메서드 참고
				var img = new Image();
				img.src = ev2.target.result;
				
				div.appendChild(img);
				izone.appendChild(div);
			}
		}
	}	// end og ft.onchage
	
	//drag & drop 기능 추가
	izone.ondragenter = function(e){
		e.preventDefault();
		e.stopPropagation();
		return false;
	}
	
	izone.ondragover = function(e){
		e.preventDefault();
		e.stopPropagation();
		return false;
	}
	
	izone.ondrop = function(e){
		e.preventDefault();
		e.stopPropagation();
		
		var dt = e.dataTransfer;
		var files = dt.files;
		
		for(var file of files){
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(ev2){
				var div = makeItem(izone);
				var img = new Image();
				img.src = ev2.target.result;
				
			div.appendChild(img);
			izone.appendChild(div);
			}
		}
	}
}

function makeItem(izone){
	//div 태그 생성<div class='item'></div>
	var div = document.createElement('div');
	div.setAttribute('class', 'item');
	
	//삭제버튼 : <input type='button' value='x' class='del_btn' name='btnDel'/>
	var delBtn = document.createElement('input');
	delBtn.setAttribute('type', 'button');
	delBtn.setAttribute('value', 'X');
	delBtn.setAttribute('class', 'del_btn');
	delBtn.setAttribute('name', 'btnDel');
	
	div.appendChild(delBtn);
	
	delBtn.onclick = function(){
		var p = this.parentNode;
		izone.removeChild(p);
	}
	
	return div;

}

