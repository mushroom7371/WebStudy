package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.apt.model.ExecutableTypeImpl;

import kr.jobtc.json.DBConn;

public class ProductDao {
	Connection conn;	//Connection 타입의 변수를 선언한다.
	PreparedStatement ps;	//statement를 상속받는 인터페이스로 SQL구문을 실행시키는 기능을 가진다.
	ResultSet rs;	//executeQuery()로 인해 반환된 값은 ResultSet 타입으로 반환되므로 이를 저장하기 위한 타입의 참조변수를 선언함.
	String sql;	// sql 문장을 담기위한 변수 선언
	
	public ProductDao() {
		conn = new DBConn().getConn();	//기본 생성자로 인하여 변수 conn에 DBConn의 getConn()실행되어 반환받은 값이 저장된다.
	}
	
	public List<ProductVo> select(Page page){	//select 메서드의 리턴타입을 지네릭을 사용하여 ProductVo 타입의 값을 저장할 수있도록 하였다. 매개변수로는 Page 타입의 page를 입력한다.
		List<ProductVo> list = new ArrayList<ProductVo>();
		//Arraylist 객체를 생성하여 List 타입의 참조변수 list에 저장한다.
		int totSize = 0;
		try {
			//검색어에 해당하는 전체 건수
			sql = "select count(serial) cnt from product where (pcode like ? or pname like ? ) ";
			sql += " and gubun in(" + page.getGubun() + ")";
			//데이터베이스에 명령할 SQL 구문을 저장하였다.
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + page.getFindStr() + "%");
			ps.setString(2, "%" + page.getFindStr() + "%");
			
			
			rs = ps.executeQuery();
			//prepareStatement 객체의 sql 쿼리를 사용하여 데이터 객체를 반환 받아 참조변수 rs에 저장하였다.
			if(rs.next()) {
				totSize = rs.getInt("cnt");
			}
			
			page.setTotList(totSize);
			page.compute();
			//nowPage에 해당하는 목록 list 저장
			sql = "select * from ("
				+ 		" select rownum rno, p.* from ("
				+ 			" select serial, gubun, pcode, pname, ea, price, amt, mid, to_char(nal, 'rrrr-mm-dd') nal from product "
				+ 			" where (pcode like ? or pname like ? ) ";
			
			sql += " and gubun in(" + page.getGubun() + ")";
			
			sql += "	order by serial desc )p"
				+ ") where rno between ? and ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + page.getFindStr() + "%");
			ps.setString(2, "%" + page.getFindStr() + "%");
			ps.setInt(3, page.getStartNo());
			ps.setInt(4, page.getEndNo());
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductVo vo = new ProductVo();
				vo.setSerial(rs.getInt("serial"));
				vo.setGubun(rs.getString("gubun"));
				vo.setNal(rs.getString("nal"));
				vo.setpCode(rs.getString("pcode"));
				vo.setpName(rs.getString("pname"));
				vo.setEa(rs.getInt("ea"));
				vo.setPrice(rs.getInt("price"));
				vo.setAmt(rs.getInt("amt"));
				vo.setMid(rs.getString("mid"));
				
				list.add(vo);
			}//sql구문을 실행하여 전달 받은 값이 있다면, 각각의 변수에 데이터를 저장한다.
			
			rs.close();
			ps.close();
			conn.close();
			//커넥션을 닫아주지 않으면 다른 곳에서 사용이 불가능 할수도 있다.
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public ProductVo selectOne(String serial) {
		ProductVo vo = new ProductVo();
		String sql = "select serial, gubun, pcode, pname, ea, price, amt, mid, "
					+ " to_char(nal,'rrrr-mm-dd') nal from product where serial=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, serial);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				//next()의 의미는 다음 값을 뜻하는데 데이터가 1개일때는 다음 값이 존재하지 않지만 결과는 값을 받아온다
				//이는 rs 객체의 구조상 맨위에는 BOF/BOT 형식으로 자리를 차지하고 있으며 첫번째 데이터는 그 밑에 자리 잡는다
				//그래서 데이터가 1개여도 next()로 인하여 값을 찾을수 있는 것이다.
				vo.setSerial(rs.getInt("serial"));
				vo.setGubun(rs.getString("gubun"));
				vo.setNal(rs.getString("nal"));
				vo.setpCode(rs.getString("pcode"));
				vo.setpName(rs.getString("pname"));
				vo.setEa(rs.getInt("ea"));
				vo.setPrice(rs.getInt("price"));
				vo.setAmt(rs.getInt("amt"));
				vo.setMid(rs.getString("mid"));
			}
			
			if(rs !=null) rs.close();
			if(ps !=null) ps.close();
			if(conn !=null) conn.close();
			//닫아 줄때는 조건문으로 null 값이 아닐경우를 걸어주는게 정석이다.
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return vo;
	}
	
	public String delete(String serial) {	//데이터 삭제 메서드
		String msg = "정상적으로 삭제됨";
		String sql = "delete from product where serial=? ";
		//sql 문장으로 전달할 문자열을 저장함.
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, serial);
			//sql 문장의 ? 부분을 serial로 바꾼다
			
			int r = ps.executeUpdate();
			//executeUpdate() 메서드를 통해 추가,삭제,수정 하는 sql문을 실행하고, sql문에 영향을 받는 행수를 반환받는다
			//이 때문에 int 타입의 변수를 선언하여 값을 대입하였다.
			if(r<1) {
				msg = "삭제중 오류 발생";
				//r<1의 의미는 executeUpdate() 메서드로 인하여 반환받은 값이 없다는 의미이므로 해당 기능이 실패했다는 뜻이다.
			
			ps.close();
			conn.close();
			
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return msg;
	}
	
	public String modify(ProductVo vo) {
		String msg = "정상적으로 수정되었습니다.";
		String sql = "update product set gubun=?, nal=?, pcode=?, pname=?, ea=?, price=?, amt=?, mid=? "
					+ " where serial= ? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getGubun());
			ps.setString(2, vo.getNal());
			ps.setString(3, vo.getpCode());
			ps.setString(4, vo.getpName());
			ps.setInt(5, vo.getEa());
			ps.setInt(6, vo.getPrice());
			ps.setInt(7, vo.getEa()*vo.getPrice());
			ps.setString(8, vo.getMid());
			ps.setInt(9, vo.getSerial());
			
			int r = ps.executeUpdate();
			if(r<1) {
				msg = "수정중 오류 발생";
			}
			
			ps.close();
			conn.close();
			
		}catch(Exception ex){
			ex.printStackTrace();;
		}
		
		
		return msg;
	}
	
	public String insert(ProductVo vo) {
		String msg = "정상적으로 저장됨.";
		String sql = "insert into product(serial, gubun, nal, pcode, pname, ea, price, amt, mid) "
					+ " values(seq_product.nextval, ?, ?, ?, ?, ?, ?, ? ,? )";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getGubun());
			ps.setString(2, vo.getNal());
			ps.setString(3, vo.getpCode());
			ps.setString(4, vo.getpName());
			ps.setInt(5, vo.getEa());
			ps.setInt(6, vo.getPrice());
			ps.setInt(7, vo.getEa()*vo.getPrice());
			ps.setString(8, vo.getMid());
			
			int r = ps.executeUpdate();
			if(r<1) {
				msg = "저장중 오류 발생";
			}
			
		}catch(Exception ex) {	
			ex.printStackTrace();
		}
		
		return msg;
	}
	
}



