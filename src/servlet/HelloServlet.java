package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/my.nhn")
//my.nhn 이라는 url이 들어오면 HollwServlet 클래스가 실행되도록 하였음.
public class HelloServlet extends HttpServlet {
	//HttpServlet 클래스를 상속받는 클래스를 만들었다. method의 타입에 따라 doGet() 또는 doPost() 메서드를 사용해야 되기 때문에
	//HttpServlet 클래스의 메서드를 오버라이딩 하여 재정의 함.
	//각 메서드의 protected 접근제어자는 부모클래스의 범위를 참고 한다.

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("HollowServlet.doGet()......");
		System.out.println("name = " + req.getParameter("name"));	//사용자가 파라메터로 요청한 값이 출력되도록 테스트
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//한글 깨짐을 방지하기위한 인코딩 작업
		resp.setContentType("text/html; charset=utf-8");
		
		System.out.println("HollowServlet.doPost()......");
		System.out.println("mid = " + req.getParameter("mid"));
		System.out.println("irum = " + req.getParameter("irum"));
		//register 파라메터 출력 확인용
	}

	@Override
	public void init() throws ServletException {
		System.out.println("HollowServlet.init()......");
		//init()은 최초 한번만 실행된다. 이는 초기화 작업이다.
	}

}
