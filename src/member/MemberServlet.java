package member;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.jobtc.json.DBConn;

@WebServlet(urlPatterns = "/member/member.do")
public class MemberServlet extends HttpServlet {
	Connection conn;	//데이터베이스와 연결하기위해 선언한 Connection 타입의 참조변수
	MemberDao dao;	//MemberDao 의 기능들을 사용하기 위해 미리 참조변수를 선언함.
	RequestDispatcher disp; //요청결과를 include 할때 사용됨.
	String job="search";	//멤버의 search 게시판을 기본으로 사용하기 위해 선언
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
		//get 타입으로 들어와도 post 타입으로 보내준다.
		//웹브라우저에서 요청을 받으면 WAS에서는 HttpServletRequest, HttpServletResponse 객체를 생성하여 저장한다.
		//첫번째 request 객체는 요청시의 정보를 담고 있고, 두번째 response 객체는 응답을 위한 정보를 담고 있다. 이를 servlet에게 전달한다.
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		//한글로 입력시 깨짐을 방지하기 위해 설정해 두었다.
		MemberVo mVo = null;
		String mId = "";
		String pwd = "";
		
		String url = "/member/";	//공통 경로를 변수에 담아뒀다.
		dao = new MemberDao(conn);	// conn 객체를 매개변수로 받아 MemberDao 객체를 생성하고 참조변수에 담는다.
		Page page = new Page();	//Page 객체를 생성하여 해당 타입의 참조변수에 그 주소값을 담는다
		String tempNowPage = req.getParameter("nowPage");
		
		if(req.getParameter("job") != null) {	//파라메터의 값이 null 이 아닐경우
			job = req.getParameter("job");	//해당 파라메터 값을 job에 저장해둔다.
		}
		
		if(req.getParameter("findStr") != null) {
			page.setFindStr(req.getParameter("findStr"));	//findStr의 값이 null 이 아닐시 그 값을 파라메터로 가져와 page의 findStr로 설정하여 준다.
		}
		
		if(tempNowPage == null || tempNowPage.equals("")) {
			page.setNowPage(1);
		}else {
			page.setNowPage(Integer.parseInt(tempNowPage));
		}
		
		switch(job) {	//job 이라는 파라메터가 각각의 경우일때 해당 url에 파일.jsp를 추가하여 페이지를 불러올 수 있도록 세팅
		case "search" :
			url += "search.jsp";
			List<MemberVo> list = dao.select(page);	//dao의 select(page)로 부터 전달받은 값을 List 타입의 참조변수에 주소값을 저장함. 지네릭으로 타입의 안정성을 높임
			req.setAttribute("list", list);	//req 객체의 list 속성을 list로 설정하여줌
			req.setAttribute("page", page);
			break;
			
		case "modify" :
			url += "modify.jsp";
			mId = req.getParameter("mid");
			mVo = dao.view(mId);
			req.setAttribute("vo", mVo);
			
			
			break;
			
		case "modifyR" :
			url += "modify_result.jsp";
			break;
			
		case "deleteR" :
			url += "search.jsp";
			
			mId = req.getParameter("mid");
			pwd = req.getParameter("pwd");
			mVo = new MemberVo();
			mVo.setMid(mId);
			mVo.setPwd(pwd);
			
			dao.delete(mVo);
			
			list = dao.select(page);
			req.setAttribute("page", page);
			req.setAttribute("list", list);
			
			break;
		case "view" :
			url += "view.jsp";
			mId = req.getParameter("mid");
			mVo = dao.view(mId);
			req.setAttribute("vo", mVo);
			
			break;
		case "register" :
			url += "register.jsp";
			break;
		case "registerR" :
			url += "register_result.jsp";
			break;
		}
		
		disp = req.getRequestDispatcher(url);	// getRequestDispatcher는 a.jsp - b.jsp 로 요청을 보내거나, b.jsp로 보낸 요쳥의 결과를 a.jsp에 포함시키는 역할을 한다.
		disp.include(req, resp);	//해당 url의 웹페이지에 req, resp의 정보를 전달해준다.
		
	}

	@Override
	public void init() throws ServletException {
		conn = new DBConn().getConn();
		//init()메서드로 인하여 최초 초기화시 DBConn 객체를 이용하여 데이터베이스와 연결한다.

	}

}
