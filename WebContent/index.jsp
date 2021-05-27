<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<link rel='stylesheet' type='text/css' href='./css/index.css'>
<title>index</title>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/main.js'></script>
</head>
<body>
<%
	//기본 include 페이지
	//String border = "./member/search.jsp";
	String border = "./board.do";
	String stock = "./product/search.jsp";
	String gb = "./guestbook/list.jsp";
	//읽어올 페이지의 경로를 변수에 담아 두었다.
	
	request.setAttribute("border", border);
%>
	<div id='index'>
		<div id='login'>
			<jsp:include page="loginForm.jsp"/>
			<!-- 동적 삽입으로 부모페이지가 실행되어질 시점에 include한 파일이 삽입된다. -->
		
		</div>
	
			<%@include file="header.jsp" %>
			<!-- 정적 삽입으로 jsp가 컴파일되기 전에 include한 파일이 부모 페이지에 삽입되어 컴파일된다. -->
			
		<div id='center'>
		
			<div id='sub_menu'>서브메뉴</div>
			
			<div id='middle'>
				<div id='border'>
					
				</div>
				
				<div id='stock'>
					<jsp:include page='<%=stock %>'/>
				</div>
			</div>
			
			<div id='guestbook'>
				<jsp:include page='<%=gb %>'/>
			</div>
			
		</div>
		<%@include file="footer.jsp" %>
	</div>
	
	<script>
		$('#border').load('${border}', 'job=search');
		//border의 영역에 servlet으로 불러온 결과를 load한다.
	</script>

</body>
</html>

<!-- 데이터베이스 테이블 정보
CREATE TABLE guestbook(
	serial int,
	mid varchar2(30),
	nal DATE,
	doc varchar2(500),
	bgcolor varchar2(10)
);

CREATE SEQUENCE seq_gb1;

INSERT INTO GUESTBOOK values(seq_gb1.nextval, 'a001', sysdate, '방가...1', '#ff8888');
INSERT INTO GUESTBOOK values(seq_gb1.nextval, 'b001', sysdate, '방가...2', '#88ff88');
INSERT INTO GUESTBOOK values(seq_gb1.nextval, 'c001', sysdate, '방가...3', '#ff88aa');
INSERT INTO GUESTBOOK values(seq_gb1.nextval, 'd001', sysdate, '방가...4', '#ffff00');
INSERT INTO GUESTBOOK values(seq_gb1.nextval, 'e001', sysdate, '방가...5', '#88ffff');
COMMIT;

SELECT seq_gb1.currval FROM dual;

/* poduct */
CREATE SEQUENCE seq_product;
DROP SEQUENCE seq_product;

CREATE TABLE product(
	serial NUMBER(20),
	gubun varchar(20),
	nal DATE,
	pCode varchar2(30),
	pName varchar2(100),
	ea number(10),
	price number(10),
	amt NUMBER(20),
	mid varchar(30)
);

/* sample data 5000건 */
DECLARE
BEGIN
	FOR i IN 1..5000 LOOP
	INSERT INTO product(serial, gubun, nal, pcode, pname, ea, price, amt, mid)
	values(seq_product.nextval, '입고', sysdate, 'a001', '컴퓨터', 100, 10000, 1000000, 'a001');
	END LOOP;
COMMIT;
END;

COMMIT;
SELECT count(serial) FROM product;
SELECT * FROM PRODUCT;

/* 페이징 처리를 위한 계층형 쿼리*/
SELECT * FROM(
	SELECT rownum rno, p.* FROM(
		SELECT * FROM PRODUCT
		WHERE pname='컴퓨터' AND gubun='출고'
	ORDER BY nal DESC
	)p
) WHERE rno>=11 AND rno<=20

DROP TABLE PRODUCT;

CREATE TABLE member(
	mid varchar(30),
	irum varchar(30),
	pwd varchar(30),
	phone varchar(30),
	post varchar(10),
	address varchar(100),
	address2 varchar(100),
	account varchar(50),
	host varchar(100),
	photo varchar(100)
);

ALTER TABLE MEMBER RENAME COLUMN ?? TO ??;
ALTER TABLE MEMBER ADD ??;

DECLARE
BEGIN
	FOR i IN 1..100 LOOP
	INSERT INTO member(mid, irum, pwd, phone, post, address, address2, account, host, photo)
	values('m00'||i, '홍길동'||i, '1111', '010-1111', '12-111', '종각', '동아빌딩', 'hong'||i, 'jobtc.kr', '');
	END LOOP;
COMMIT;
END;

CREATE TABLE board(
	serial integer,
	pSerial integer,
	hit integer,
	subject varchar(30),
	doc varchar(500),
	mid varchar(30),
	pwd varchar(30),
	mdate date
);

CREATE TABLE boardAtt(
	serial integer,
	pserial integer,
	oriAtt varchar(300),
	sysAtt varchar(300)
);


CREATE SEQUENCE seq_board;
CREATE SEQUENCE seq_boardAtt;

DECLARE
BEGIN
	FOR i IN 1..100 LOOP
		INSERT INTO board(serial, mid, pwd, subject, doc, hit, mdate)
		values(seq_board.nextval, 'a00'||i, '1111',
				'방가'||i, '내용'||i, 1000, sysdate);
	END LOOP;
END;
COMMIT;

INSERT INTO boardAtt(serial, pserial, oriAtt, sysAtt) values(seq_boardAtt.nextVal, 100, 'a.png', 'a.png');
INSERT INTO boardAtt(serial, pserial, oriAtt, sysAtt) values(seq_boardAtt.nextVal, 100, 'b.png', 'b.png');
INSERT INTO boardAtt(serial, pserial, oriAtt, sysAtt) values(seq_boardAtt.nextVal, 100, 'c.png', 'c.png');

INSERT INTO boardAtt(serial, pserial, oriAtt, sysAtt) values(seq_boardAtt.nextVal, 99, 'd.png', 'd.png');
INSERT INTO boardAtt(serial, pserial, oriAtt, sysAtt) values(seq_boardAtt.nextVal, 99, 'e.png', 'e.png');

INSERT INTO boardAtt(serial, pserial, oriAtt, sysAtt) values(seq_boardAtt.nextVal, 108, 'f.png', 'f.png');

COMMIT;
SELECT * FROM boardAtt;

 -->
