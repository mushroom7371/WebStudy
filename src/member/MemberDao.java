package member;

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
	
	public List<MemberVo> select(Page page){	//메서드를 통한 주입
		List<MemberVo> list = new ArrayList<MemberVo>();	//지네릭을 통한 MemberVo 타입의 값을 저장하는 List 타입의 참조변수에 ArrayList객체의 주소를 저장
		String sql = "select * from member";	//데이터베이스에 전달하여 수행할 sql문을 작성함.
		try {
			ps = conn.prepareStatement(sql);	//conn 객체의 prepareStatement()를 통하여 sql문을 실행할 준비를 한다.
			rs = ps.executeQuery();	//ps의 executeQuery()메서드로 인하여 sql문을 실행한 결과를 전달받아 참조변수 rs에 주소값을 저장한다.
			
			while(rs.next()) {	//rs 데이터 객체에 다음값이 있다면(rs객체의 구조로 인하여 첫데이터는 비어있고 마지막 데이터는 비어있다. 그러므로 next의 의미가 맞아 떨어진다.)
				MemberVo vo = new MemberVo();	//memberVo 객체를 생성하여 일치하는 타입의 참조변수에 주소값을 저장한다.
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
}
