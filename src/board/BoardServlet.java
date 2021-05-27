package board;

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

@WebServlet(urlPatterns = "/board.do")
public class BoardServlet extends HttpServlet {
	BoardDao dao;
	RequestDispatcher rd;
	String job = "search";
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		job = "search";
		doPost(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		BoardVo vo = null;
		
		String url = "./board/";	//공통 경로를 변수에 담아뒀다.
		dao = new BoardDao();	// BoardDao 객체를 생성하고 참조변수에 담는다.
		
		Page page = new Page();	//Page 객체를 생성하여 해당 타입의 참조변수에 그 주소값을 담는다
		String tempNowPage = req.getParameter("nowPage");
		
		if(req.getParameter("job") != null) {	//파라메터의 값이 null 이 아닐경우
			job = req.getParameter("job");	//해당 파라메터 값을 job에 저장해둔다.
		}
		
		if(req.getParameter("findStr") != null) {
			page.setFindStr(req.getParameter("findStr"));	//findStr의 값이 null 이 아닐시 그 값을 파라메터로 가져와 page의 findStr로 설정하여 준다.
		}
		
		if(tempNowPage == null || tempNowPage.equals("")) {	//tempNowPage의 데이터 값이 null 이거나 공백일 경우
			page.setNowPage(1);	//NowPage의 값을 1로 설정하여 공백 검색시 1페이지로 가도록 함
		}else {
			page.setNowPage(Integer.parseInt(tempNowPage)); //공백이 아닐 시 그 데이터를 정수로 바꿔 해당 페이지로 이동
		}
		
		switch(job) {
		case "search"	:
			url += "search.jsp";
			List<BoardVo> list = dao.select(page);
			
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			break;
		}
		
		rd = req.getRequestDispatcher(url);
		rd.include(req, resp);
		
	}

	@Override
	public void init() throws ServletException {
	}

}
