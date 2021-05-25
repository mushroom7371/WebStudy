package board;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybaFactory;

public class BoardDao {
	SqlSession sqlSession;	//sql 실행이나 트랜잭션 관리를 위한 SqlSession 클래스 타입의 참조변수를 선언
	
	public BoardDao() {
		try {
			sqlSession = MybaFactory.getFactory().openSession();
			//MybaFactory 클래스의 getFactory() 메서드를 통하여 SqlSessionFactory객체를 가져오고 이 객체의 openSession()를 호출하여 받은 리턴값을 저장한다.
			
			if(sqlSession == null) {	//sqlSession에 데이터가 있다면 정상 저장됨을 출력
				System.out.println("sqlSession 생성시 오류 발생");
			}else {
				System.out.println("정상적으로 sqlSession이 생성됨");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	public static void main(String[] args) {
		new BoardDao();	//생성자로 인하여 메인 메서드가 실행될때 sqlSession이 생성됨
	}
}
