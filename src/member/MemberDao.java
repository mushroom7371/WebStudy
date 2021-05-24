package member;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	Connection conn;	//데이터베이스와 연동하고 데이터값을 가져오기 위한 각각의 타입의 참조변수를 멤버변수로 선언하였음
	PreparedStatement ps;	//sql을 실행하게 하는 기능을 가진 PreparedStatement 타입의 참조변수를 선언
	ResultSet rs;	//executeQuery() 메서드로 리턴받은 데이터는 ResultSet 타입이므로 이를 저장하기 위한 변수 선언
	
	public MemberDao(Connection conn) {	//생성자를 통합 주입
		this.conn = conn;	//클래스가 인스턴스화 될때(객체 생성이 될때) 생성자의 객체를 멤버변수로 선언한(자기 자신의) conn에 저장한다.
	}
	
	public int getTotList(String findStr) {	//데이터 검색을 위한 매서드
		int totList = 0;
		String sql = " select count(mid) totList from member "
				+ " where mid = ? "
				+ " or irum like ? "
				+ " or phone like ? "
				+ " or address like ? ";
		try {
			ps = conn.prepareStatement(sql);	//sql 문장을 준비시켜놓고,
			ps.setString(1, findStr);	//각각의 ? 자리에 findStr로 받은 값을 대입하여준다.
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setString(4, "%" + findStr + "%");
			
			rs = ps.executeQuery();	//executeQuery() 메서드를 통하여 데이터를 resultSet 타입의 객체로 반환받아 rs에 주소값을 저장한다.
			if(rs.next()) {	//rs객체에 다음값이 존재한다면
				totList = rs.getInt("totList");	//변수 totList에 rs의 getInt()메서드에 "totList"를 매개변수로 받은 리턴값을 저장
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return totList;
	}
	
	public List<MemberVo> select(Page page){	//메서드를 통한 주입
		String findStr = page.getFindStr();
		page.setTotList(getTotList(findStr));	//getTotList의 반환값을 setTotList의 매개변수로 전달하여 결과값을 리턴받음
		page.compute();
		
		List<MemberVo> list = new ArrayList<MemberVo>();	//지네릭을 통한 MemberVo 타입의 값을 저장하는 List 타입의 참조변수에 ArrayList객체의 주소를 저장
		String sql = "select * from ("
					+ " select rownum rno, m.* from ( "
					+ " 	select * from member "
					+ " 	where mid = ? "
					+ " 	or irum like ? "
					+ " 	or phone like ? "
					+ " 	or address like ? "
					+ " 	order by irum asc"	
					+ " )m "
					
					+ ") "
					+ " where rno between ? and ? ";
				
				//데이터베이스에 전달하여 수행할 sql문을 작성함. 계층형 쿼리 찾고자하는 컬럼을 작성하고 이를 m으로 묶어 다시 검색하도록 함
		try {
			ps = conn.prepareStatement(sql);	//conn 객체의 prepareStatement()를 통하여 sql문을 실행할 준비를 한다.
			ps.setString(1, findStr);
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setString(4, "%" + findStr + "%");
			ps.setInt(5, page.getStartNo());
			ps.setInt(6, page.getEndNo());
			
			
			
			rs = ps.executeQuery();	//ps의 executeQuery()메서드로 인하여 sql문을 실행한 결과를 전달받아 참조변수 rs에 주소값을 저장한다.
			
			while(rs.next()) {	//rs 데이터 객체에 다음값이 있다면(rs객체의 구조로 인하여 첫데이터는 비어있고 마지막 데이터는 비어있다. 그러므로 next의 의미가 맞아 떨어진다.)
				MemberVo vo = new MemberVo();	//memberVo 객체를 생성하여 일치하는 타입의 참조변수에 주소값을 저장한다.
				vo.setRno(rs.getInt("rno"));
				vo.setMid(rs.getString("mid"));
				vo.setIrum(rs.getString("irum"));
				vo.setPhone(rs.getString("phone"));
				vo.setAccount(rs.getString("account"));
				vo.setHost(rs.getString("host"));
				//set...()메서드로 인하여 각각의 변수에 해당하는 데이터 값으로 받아온 문자열을 저장한다.
				
				list.add(vo);	//list 객체에 vo의 값을 저장한다.
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list; //메서드의 최종 결과로 list객체를 리턴하여 준다.
	}
	
	public int insert(MemberVo vo) {
		int r = 0;
		String sql = "insert into member(mid, irum, pwd, phone, post, address, address2, account, host, photo)"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		
		try {
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			ps.setString(2, vo.getIrum());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getPhone());
			ps.setString(5, vo.getPost());
			ps.setString(6, vo.getAddress());
			ps.setString(7, vo.getAddress2());
			ps.setString(8, vo.getAccount());
			ps.setString(9, vo.getHost());
			ps.setString(10, vo.getPhoto());
			
			r = ps.executeUpdate();
			
			if(r>0) {
				conn.commit();
			}else {
				conn.rollback();
			}
			ps.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return r;
	}
	
	public MemberVo view(String mid) {
		MemberVo vo = new MemberVo();
		String sql = "select * from member where mid=? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setMid(rs.getString("mid"));
				vo.setIrum(rs.getString("irum"));
				vo.setPhone(rs.getString("phone"));
				vo.setPost(rs.getString("post"));
				vo.setAddress(rs.getString("address"));
				vo.setAddress2(rs.getString("address2"));
				vo.setAccount(rs.getString("account"));
				vo.setHost(rs.getString("host"));
				vo.setPhoto(rs.getString("photo"));
			}
			
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return vo;
	}
	
	// 1)삭제하기 전에 첨부파일의 정보를 가져옴
	// 2)데이터 삭제
	// 3)파일 삭제
	public void delete(MemberVo vo) {
		int r = 0;
		String sql = "";
		String delPath = FileUpload.saveDir;	//FileUpload 클래스에 상수로 정의된 saveDir를 경로로 지정한다.
		
		try {
			conn.setAutoCommit(false);	// 삭제와 관련된 메서드이므로 각각의 쿼리들이 자동으로 작동되지 못하게 한다.
			sql = "select photo from member where mid=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			rs = ps.executeQuery();
			if(rs.next()) {
				delPath += rs.getString("photo");
			}
			
			sql = "delete from member where mid=? and pwd=? ";	//mid와 pwd가 일치하는 곳의 데이터를 삭제하기 위한 sql문장
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			ps.setString(2, vo.getPwd());	//vo에 저장된 mid, pwd를 가져와서 sql문장에 대입한다.
			
			r = ps.executeUpdate();
			
			if(r > 0) {	//r이 >0 보다 크다는 것은 삭제과정이 이뤄 졌다는 뜻으로 아래의 과정을 실행한다.
				conn.commit();
				
				File file = new File(delPath);
				if(file.exists()) file.delete();
			}else {
				conn.rollback();
			}
			
			rs.close();
			ps.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//1)기존 이미지 파일명을 가져옴
	//2)내용을 업데이트
	//3)기존 이미지 삭제
	public int update(MemberVo vo) {
		int r = 0;
		String sql = "";
		String delPath = FileUpload.saveDir;
		String photo = "";
		try {
			sql = "select photo from member where mid = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			rs = ps.executeQuery();
			if(rs.next()) {
				photo = rs.getString("photo");
			}
			
			sql = " update member "
					+ " set irum = ?, phone = ?, post = ?, address = ?, "
					+ " 	address2 = ?, account = ?, host = ? ";
			
			if( !(vo.getPhoto() == null || vo.getPhoto().equals("")) ) {
				sql += " , photo='" + vo.getPhoto() + "' ";
			}
			
			sql += " where mid=? and pwd=? ";
			
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getIrum());
			ps.setString(2, vo.getPhone());
			ps.setString(3, vo.getPost());
			ps.setString(4, vo.getAddress());
			ps.setString(5, vo.getAddress2());
			ps.setString(6, vo.getAccount());
			ps.setString(7, vo.getHost());
			ps.setString(8, vo.getMid());
			ps.setString(9, vo.getPwd());
			
			r = ps.executeUpdate();
			if(r > 0) {
				File file = new File(delPath + photo);
				if(file.exists()) file.delete();
				conn.commit();
			}else {
				File file = new File(delPath + vo.getPhoto());
				if(file.exists()) file.delete();	
				conn.rollback();
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return r;
	}
	
	
	
}
