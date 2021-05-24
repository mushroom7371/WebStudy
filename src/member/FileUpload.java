package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.jobtc.json.DBConn;

@WebServlet(urlPatterns = "/upload.do")	//upload.do 가 들어오면 실행되는 서블렛
@MultipartConfig(
		location = "C:/Temp/",
		maxFileSize = 1024000000L,
		maxRequestSize = -1,
		fileSizeThreshold = -1
		)
//서블릿이 multipart 데이터를 처리할 수 있도록 설정하기 위해서는
//@WebServlet 애노테이션을 사용하거나 web.xml에서 <multipart-config> 태그를 사용해야 된다.

public class FileUpload extends HttpServlet{
	Connection conn;
	MemberDao dao;
	RequestDispatcher disp;


	final static String saveDir = "C:\\eclipse\\workspace\\WebStudy\\WebContent\\member\\picture\\";
	//저장 경로 설정

	public void init() throws ServletException{	//서블렛이 실행될때 최초 한번 실행됨.
		//System.out.println("FileUpload.init()");
		conn = new DBConn().getConn();	//이로 인하여 데이터베이스와 연결된다.
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int r = 0;
		String flag = "";
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		//한글 깨짐 방지 설정

		//PrintWriter out = resp.getWriter();
		//out.print("<h1>Hi......</h1>");
		String contentType = req.getContentType();
		//req의 contentType을 문자열로 가져와서 String 타입 변수에 저장한다.

		//out.print("<li>contentType : " + contentType);

		if(contentType == null || !contentType.toLowerCase().startsWith("multipart/")) {
			//out.print("<h2>enctype이 지정되지 않음</h2>");
			return;
		}	//contentType의 enctype 확인용 if문
		
		dao = new MemberDao(conn);
		MemberVo vo = new MemberVo();
		Page page = new Page();
		Collection<Part> parts = req.getParts();
		//getParts() 메서드를 통하여 여러가지 Part를 Collection에 담아서 리턴함.
		for(Part p : parts) {	//향상된 for 문을 이용하여 p의 데이터를 parts에 담는다.
			//out.print("<li>part name : " + p.getName());

			//out.print("<li>contentType : " + p.getContentType());

			if(p.getHeader("Content-Disposition").contains("filename=")) {
				//out.print("<li> file size : " + p.getSize());
				String fileName = p.getSubmittedFileName();
				//	out.print("<li> file name : " + fileName);

				vo.setPhoto(fileName);

				if(p.getSize()>0) {
					p.write(saveDir + fileName);
					p.delete();	//임시파일을 제거함
				}

			}else {	//file tag가 아닌경우
				//out.print("<li>part value : " + req.getParameter(p.getName()));
				//p.getName()을 매개변수로 하여 파라메터값으로 가져오는데 이는 value를 의미한다.
				String tagName = p.getName();
				String value = req.getParameter(tagName).trim();
				switch(tagName) {
				case "mid" :
					vo.setMid(value);
					break;
				case "irum" :
					vo.setIrum(value);
					break;
				case "pwd" :
					vo.setPwd(value);
					break;
				case "phone" :
					vo.setPhone(value);
					break;
				case "post" :
					vo.setPost(value);
					break;
				case "address" :
					vo.setAddress(value);
					break;
				case "address2" :
					vo.setAddress2(value);
					break;
				case "account" :
					vo.setAccount(value);
					break;
				case "host" :
					vo.setHost(value);
					break;

				case "findStr" :
					page.setFindStr(value);
					break;
				case "nowPage" :
					page.setNowPage(Integer.parseInt(value));
					break;
				}
			}//end of if
		}//end of for
		
		flag = req.getParameter("flag");
		
		if(flag.equals("insert")) {
			r = dao.insert(vo);
		}else if(flag.equals("update")) {
			r = dao.update(vo);
		}
	
		
		req.setAttribute("page", page);
		
		disp = req.getRequestDispatcher("./member/search.jsp");
		disp.include(req, resp);
		
	}
}
