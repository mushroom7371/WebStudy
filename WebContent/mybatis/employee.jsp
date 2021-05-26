<%@page import="member.MemberVo"%>
<%@page import="mybatis.EmpVo"%>
<%@page import="product.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.MybaFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee</title>
</head>
<body>
<div id='employee'>
	<%
		SqlSession sqlSession = MybaFactory.getFactory().openSession();	
		//sql 실행이나 트랜잭션을 관리하는 SqlSession 클래스 타입의 참조변수를 선언하고, MybaFactory의 getFactory()메서드를 통해 리턴받은 객체로 세션을 오픈한다.
		//String firstName = sqlSession.selectOne("test.test_emp", 120);
		//한가지의 값을 출력하기위한 selectOne 메서드의 매개변수로 xml 파일의 namespace의 id를 넣어주었다.
		//out.print("<li>firstName : " + firstName);
	
		//부서코드를 입력하여 부서명을 출력.
		
		//SqlSession sqlSession1 = MybaFactory.getFactory().openSession(); SqlSession은 한번만 만들어도됨
		String depName = sqlSession.selectOne("test.test_dep", 100);
		out.print("<li>depName = " + depName);
		
		//제품목록을 모두 출력
		out.print("<hr/><h2>제품 목록</h2>");
		List<ProductVo> pList = sqlSession.selectList("test.all_product");
		//여러건의 데이터값을 출력하기 위한 selectList 메서드
		for(ProductVo vo : pList){	//향상된 for문으로 pList의 데이터를 vo에 담았다
			out.print("<li>" + vo.getpCode());
			out.print(" -- " + vo.getpName());
		}
		
		//부서코드가 100번인 직원들의 사번, 이름, 급여, 연락처를 조회
		out.print("<hr/><h2>부서코드 100번 직원정보</h2>");
		
		List<EmpVo> eList = sqlSession.selectList("test.dep4", 100);
		for(EmpVo vo : eList){
			out.print("<li>" + vo.getEmployeeId());
			out.print(" -- " + vo.getFirstName());
			out.print(" -- " + vo.getPhoneNumber());
			out.print(" -- " + vo.getSalary());
			//데이터베이스의 컬럼명과 EmpVo 클래스에 정의한 변수명이 다르기때문에 null값이 나온다.	
			//이를 방지하기위해 매핑을 test.xml 파일에 매핑을 하였다.
		}
		
		ProductVo pVo = new ProductVo();
		//제품관리 테이블에 데이터를 추가하시오
		/*
		ProductVo pVo = new ProductVo();
		pVo.setGubun("입고");
		pVo.setpCode("p001");
		pVo.setpName("모니터");
		pVo.setEa(500);
		pVo.setPrice(50000);
		pVo.setAmt(pVo.getEa() * pVo.getPrice());
		pVo.setMid("h001");
		
		int r = sqlSession.insert("test.product_insert", pVo);
		if(r > 0){
			sqlSession.commit();
			out.print("정상적으로 저장됨");
		}else{
			sqlSession.rollback();
			out.print("저장중 오류 발생");
		}
	
		
		//serial=10025번인 자료의 ea와 price를 수정

		pVo = new ProductVo();
		pVo.setSerial(10025);
		pVo.setEa(100);
		pVo.setPrice(500);
		int r = sqlSession.update("test.product_update", pVo);
		
		if(r > 0){
			out.print("<br/>정상적으로 수정됨");
			sqlSession.commit();
		}else{
			out.print("<br/>수정중 오류 발생");
			sqlSession.rollback();
		}
		
		int r = sqlSession.delete("test.product_delete", 10025);
		if(r > 0){
			out.print("<br/>정상적으로 수정됨");
			sqlSession.commit();
		}else{
			out.print("<br/>수정중 오류 발생");
			sqlSession.rollback();
		}
		
		*/
		
		//입력된 mid가 null 이 아닌 경우에만 where 조건이 실행되도록 조치
		List<MemberVo> mList = sqlSession.selectList("test.if_test", null);
		out.print("<br/>mList size : " +  mList.size());	//회원전체 건수
				
		mList = sqlSession.selectList("test.if_test", "park");
		out.print("<br/>mList size : " + mList.size());	//park 회원만
		
		//입력된 값이 1,2,3,4 중 하나이며, 이는 분기를 나타낸다.
		//1이면 입사일이 1~3월까지인 직원들을, 2이면 4~6월까지...EmpVo에 담아서 리턴 
		
		List<EmpVo> list2 = sqlSession.selectList("test.emp_list", 1); //1사분기에 입사한 직원들의 목록
		List<EmpVo> list3 = sqlSession.selectList("test.emp_list", 2);
		List<EmpVo> list4 = sqlSession.selectList("test.emp_list", 3);
		List<EmpVo> list5 = sqlSession.selectList("test.emp_list", 4);
		
		for(EmpVo vo : list2){
			out.print("<br/>1분기 first_name : " + vo.getFirstName());
		}
		
		for(EmpVo vo : list3){
			out.print("<br/>2분기 first_name : " + vo.getFirstName());
		}
		
		for(EmpVo vo : list4){
			out.print("<br/>3분기 first_name : " + vo.getFirstName());
		}
		
		for(EmpVo vo : list5){
			out.print("<br/>4분기 first_name : " + vo.getFirstName());
		}
		
		//where 사용 findStr에 값이 전달된 경우에만 employees 테이블에 first_name에 findStr이 포함된 명당을
		//EmpVo 에 담아 출력 id: test.emp_find
		List<EmpVo> list6 = sqlSession.selectList("test.emp_find", "th");
		out.print("<br/>findStr is 'th' : " + list6.size());
		
		List<EmpVo> list7 = sqlSession.selectList("test.emp_find", null);
		out.print("<br/>findStr is null : " + list7.size());
		
		sqlSession.close();
	%>
</div>
</body>
</html>