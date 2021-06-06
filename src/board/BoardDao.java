package board;

import java.io.File;
import java.util.List;

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
	
	public List<BoardVo> select(Page page){
		List<BoardVo> list = null;
		
		try{
			int totList = sqlSession.selectOne("board.totList", page.getFindStr());
			page.setTotList(totList);
			page.compute();
			list = sqlSession.selectList("board.search", page);
			sqlSession.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public String insert(BoardVo vo){
		String msg = "ok..";
		try {
			int serial = sqlSession.selectOne("board.brd_getSerial");	//serial 번호를 가져옴
			vo.setSerial(serial);
			int r = sqlSession.insert("board.brd_insert", vo);	//xml의 insert 쿼리를 실행하는데 vo 를 가지고 실행한 결과를 r에 저장
			if(r > 0) {
				int chkCnt = 0; //첨부파일의 수 만큼 실행될 쿼리의 수
				for(BoardAttVo v : vo.getAttList()) {	//vo.getAttList()로 값을 가지고 와서 반복시행
					v.setpSerial(serial);
					chkCnt += sqlSession.insert("board.brdAtt_insert", v);
				}
				if(chkCnt == vo.getAttList().size()) {
					sqlSession.commit();
				}else {
					throw new Exception(); //오류발생시 catch 문장으로 넘김
				}
			}else {
				throw new Exception();
			}
			
			
		}catch(Exception ex) {
			msg = ex.toString();
			ex.printStackTrace();
			sqlSession.rollback(); //오류 발생시 롤백
			
			for(BoardAttVo delVo : vo.getAttList()) {
				File f = new File(BoardFileUpload.saveDir + delVo.getSysAtt());
				if(f.exists()) f.delete();
			}
			
		}
		sqlSession.close();
		return msg;
	}
	
	public String update(ReViewVo vo) {
		String msg = "수정되었습니다.";
		int r = 0;
		int chkCnt = 0;
		
		try {
			r = sqlSession.update("review.rev_update", vo);
			sqlSession.commit();

			if(r < 1) throw new Exception();
			chkCnt = 0;
			if(vo.getAttList() != null) {
				for(ReViewAttVo v : vo.getAttList()) {
					System.out.println("chkcnt " +chkCnt);
					v.setpSerial(vo.getSerial());
					chkCnt += sqlSession.insert("review.revAtt_insert", v);
					sqlSession.commit();
				}
				
				if(chkCnt == vo.getAttList().size()) {
					for(ReViewAttVo delVo : vo.getDelList()) {
						sqlSession.delete("review.revAtt_delete2", delVo.getSysAtt());
						sqlSession.commit();
						File f = new File(ReViewFileUpload.saveDir + delVo.getSysAtt());
						if(f.exists()) f.delete();
					}
					sqlSession.close();
				}else {
					throw new Exception();
				}
			} //첨부파일 유무로 수정
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("r=" + r);
			System.out.println("chkCnt=" + chkCnt);
			msg = ex.toString();
			ex.printStackTrace();
			sqlSession.rollback();
			for(ReViewAttVo delVo : vo.getAttList()) {
				File f = new File(ReViewFileUpload.saveDir + delVo.getSysAtt());
				if(f.exists()) f.delete();
			}
		}
		sqlSession.close();
		return msg;
	}
	
	public String repl(BoardVo vo) {
		String msg = "OK";
		int r = 0;
		int chkCnt = 0;
		try {
			int serial = sqlSession.selectOne("board.brd_getSerial");
			vo.setSerial(serial);
			r = sqlSession.insert("board.brd_repl", vo);
			if(r>0) {
				chkCnt = 0; //첨부파일의 수만큼 실행된 쿼리의 수
				for(BoardAttVo v : vo.getAttList()) {
					v.setpSerial(serial);
					chkCnt += sqlSession.insert("board.brdAtt_insert", v);
				}
				if(chkCnt == vo.getAttList().size()) {
					sqlSession.commit();
				}else {
					throw new Exception();
				}
			}else {
				throw new Exception();
			}
			
		}catch(Exception ex) {
			msg = ex.toString();
			System.out.println("r=" + r);
			System.out.println("chkCnt=" + chkCnt);
			ex.printStackTrace();
			sqlSession.rollback();
			
			for(BoardAttVo delVo : vo.getAttList()) {
				File f = new File(BoardFileUpload.saveDir + delVo.getSysAtt());
				if(f.exists()) f.delete();
			}
		}
		sqlSession.close();
		return msg;
	}
	
	public BoardVo view(int serial) {
		BoardVo vo = new BoardVo();
		
		try {
			sqlSession.update("board.brd_hitUp", serial);
			sqlSession.commit();
			
			vo = sqlSession.selectOne("board.brd_view", serial);
			List<BoardAttVo> attList = sqlSession.selectList("board.brdAtt_view", serial);
			sqlSession.commit();
			
			vo.setAttList(attList);
						
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		sqlSession.close();
		return vo;
	}
	
	public String delete(ReViewVo vo) {
		String msg = "삭제가 완료되었습니다.";
		List<ReViewAttVo> delList = null;
		
			try {
				delList = sqlSession.selectList("review.rev_att_list",vo.getSerial());
				System.out.println("delList size = " + delList.size());
				
				int r = sqlSession.delete("review.rev_delete", vo);
				System.out.println("r = " + r);
				if(r > 0) {
					r = sqlSession.delete("review.revAtt_delete", vo.getSerial());
					if(vo.getAttList() == null || r == vo.getAttList().size()) {
						sqlSession.commit();
						for(ReViewAttVo v : delList) {
							File f = new File(ReViewFileUpload.saveDir + v.getSysAtt());
							if(f.exists()) f.delete();
						}
					}else {
						throw new Exception();
					}
				}else {
					throw new Exception();
				}
			}catch(Exception ex) {
				sqlSession.rollback();
				ex.printStackTrace();
				msg = ex.toString();
			}
		return msg;
	}
	
	
	
	
	public static void main(String[] args) {
		new BoardDao();	//메서드가 실행될때 sqlSession이 생성됨
	}
}
