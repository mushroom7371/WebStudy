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

@WebServlet(urlPatterns = "/boardUpload.do")
@MultipartConfig(
		location= "c:/temp/",
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
		String flag = ""; //insert, update, repl
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		
		String contentType = req.getContentType();
		if(contentType == null || !contentType.toLowerCase().startsWith("multipart/")) {
		//cuntentTypt이 null 이거나 소문자로 변경한 시작 값이 multipart 타입이 아니면
			return;
		}
		
		dao = new BoardDao();
		BoardVo bVo = new BoardVo();
		Page page = new Page();	
		List<BoardAttVo> attList = new ArrayList<BoardAttVo>();
		
		Collection<Part> parts = req.getParts();	//제너릭을 이용한 컬랙션타입의 참조변수에 
		for(Part p : parts) {
			if( p.getHeader("Content-Disposition").contains("filename=")) { // file tag
				String fileName = p.getSubmittedFileName();
				BoardAttVo attVo = new BoardAttVo();
				attVo.setOriAtt(fileName);
				
				String date = sdf.format(new Date());
				
				if(p.getSize()>0) {
					p.write(saveDir + date + "-" + fileName);
					p.delete();
					attVo.setSysAtt(date + "-" + fileName);
				}
				
				attList.add(attVo);
				
				
				
			}else {	//일반 tag
				
			}
		}
		
		
	}
	@Override
	public void init() throws ServletException {

	}

}
