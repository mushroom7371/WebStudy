<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 오라클 데이터 베이스 연결
   1) WEB-INF/lib/오라클DB의 드라이버 파일 복사
		C:\app\inst-2-31\product\18.0.0\dbhomeXE\jdbc\lib\ojdbc8.jar
		
   2) Class.forName()을 사용하여 드라이버를 메모리에 로딩
   3) DriverManage클래스를 사용하여 오라클 DB에 접속
   4) SQL문장을 작성
   5) Statement 또는 PreparedStatement를 사용하여 실행할 쿼리의 객체 생성(connection객체를 사용)
   6) SQl문장 실행(insert, update, delete=> excuteUpdate(), select=>excuteQuery로 실행)
   7) select결과는 ResultSet으로 받고, insert, update, delete는 적용된 행수가 반환됨)
*/
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	String user = "system";
	String pwd = "wnsghk6670";
	Connection conn = null;
	
	String findStr = request.getParameter("findStr");
	String whereSql = "";
	String token = "";
	
	StringTokenizer st = new StringTokenizer(findStr);

	if(st.countTokens()>0){//무조건 토큰이 하나 이상일 때 
		token = st.nextToken();
		whereSql = 
				String.format(" where first_name like '%s'  or phone_number like '%s' ",
											"%"+token+"%" ,"%"+token+"%");
		while(st.hasMoreElements()){
			token = st.nextToken();
			whereSql += 
					String.format(" or first_name like '%s'  or phone_number like '%s' ",
												"%"+token+"%" ,"%"+token+"%");
		}
	}
	
	//out.print(whereSql + "<p/>");
	try{
		Class.forName(driver); // 2)
		conn = DriverManager.getConnection(url, user, pwd); // 3)
		String sql = "select first_name, email, phone_number, to_char(salary, '999,999') sal from HR.employees " 
		           + whereSql ; // 4)
		
		PreparedStatement ps = conn.prepareStatement(sql); // 5)
		
		ResultSet rs = ps.executeQuery(); // 6)
		StringBuffer sb = new StringBuffer();
		while(rs.next()){
			String str = String.format(
				 "<div><span class='fn'>%s</span>"
				  +"     <span class='em'>%s</span>"	
				  +"     <span class='ph'>%s</span>"	
				  +"     <span class='sa'>%s</span>"
				  +"</div>",
						  rs.getString("first_name"),
						  rs.getString("email"),
						  rs.getString("phone_number"),
						  rs.getString("sal")
					);
			
			sb.append(str);
		}
		out.print(sb.toString());
	}catch(Exception ex){
		out.print(ex.toString());
	}
%>
