/**
 * index(main)
 */

let main = {};

main.init = function(){
	
}

main.menu = function(){
	switch(menu){
		case 'member'	:
			$('#border').load('./member/member.do');
			break;
		
		case 'board'	:
			$('#border').load('./board/search.jsp');
			break;
	}
}