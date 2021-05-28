package board;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = "/boardUpload.do") //이 패턴이 들어오면 servlet을 실행해 달라
@MultipartConfig(
		location= "c:/Temp/",
		maxFileSize = 1024*1024*100,
		maxRequestSize = -1,
		fileSizeThreshold = -1
)
public class BoardFileUpload extends HttpServlet {
	BoardDao dao;
	RequestDispatcher rd;
	final static String saveDir = "C:\\eclipse\\workspace\\WebStudy\\WebContent\\upload\\";
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);	//파일 업로드시 get 형식은 지원하지 않기에 post타입으로 넘겨준다.
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String flag = ""; //insert, update, repl 각각의 문자열로 들어왔는지 확인하고 나중에 참조됨
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");	//파일의 중복네임을 막기위해 사용
		
		String contentType = req.getContentType();
		if(contentType == null || !contentType.toLowerCase().startsWith("multipart/")) {
		//cuntentTypt이 null 이거나 소문자로 변경한 시작 값이 multipart 타입이 아니면 프로세스 종료 맞으면 밑의 프로세스 실행
			return;
		}
		
		dao = new BoardDao();
		BoardVo bVo = new BoardVo();
		Page page = new Page();	
		List<BoardAttVo> attList = new ArrayList<BoardAttVo>(); //첨부파일을 저장하기 위해 선언 및 생성
		
		Collection<Part> parts = req.getParts();	
		for(Part p : parts) {
			if( p.getHeader("Content-Disposition").contains("filename=")) { // file tag
				String fileName = p.getSubmittedFileName(); //선택한 원본파일명
				System.out.println(fileName);
				BoardAttVo attVo = new BoardAttVo();
				
				String date = sdf.format(new Date());
				
				if(p.getSize()>0) { //파일의 크기가 0 이상이면
					p.write(saveDir + date + "-" + fileName);	//p에 데이터를 saveDir의 경로에 현재시간-파일명 으로 저장한다.?
					p.delete();	//temp의 값을 제거한다.
					
					attVo.setSysAtt(date + "-" + fileName);
					attVo.setOriAtt(fileName);
					attList.add(attVo);
				}
				
			}else {	//일반 tag
				String tagName = p.getName();
				String value = req.getParameter(tagName).trim();
				
				switch(tagName) {
				case "serial"	:
					bVo.setSerial(Integer.parseInt(value));
					break;
				case "subject"	:
					bVo.setSubject(value);
					break;
				case "mid"	:
					bVo.setMid(value);
					break;
				case "pwd"	:
					bVo.setPwd(value);
					break;
				case "doc"	:
					bVo.setDoc(value);
					break;
				case "nowPage"	:
					page.setNowPage(Integer.parseInt(value));
					break;
				case "findSter"	:
					page.setFindStr(value);
					break;
				}
			}
		}
		
		bVo.setAttList(attList);
		
		flag = req.getParameter("flag");
		
		switch(flag) {
		case "insert"	:
			dao.insert(bVo);
			break;
		case "update"	:
			dao.update(bVo);
			break;
		case "repl"		:
			dao.repl(bVo);
			break;
		}
		
		rd = req.getRequestDispatcher("./board/search.jsp");
		rd.include(req, resp);
		
	}
	@Override
	public void init() throws ServletException {

	}

}
