drop table MEMBER cascade constraints purge;


create table MEMBER(
 EMPNO VARCHAR2(12) PRIMARY KEY,
 DEPT VARCHAR2(10)
 CONSTRAINT BOAT_DEPT_CK CHECK (DEPT IN('홍보팀','개발팀','인사팀','기획팀','영업팀')),
 DEPTNO NUMBER(2),
 CONSTRAINT BOAT_DEPTNO_CK CHECK (DEPTNO IN('10','20','30','40','50')),
 PASSWORD VARCHAR2(10),
 PWCHECK VARCHAR2(10),
 NAME VARCHAR2(15),
 JUMIN varchar2(15),
 ADDRESS VARCHAR2(150),
 POST NUMBER(5),
 GENDER VARCHAR2(3),
 EMAIL VARCHAR2(30),
 PHONE NUMBER(11),
 MEMBERFILE VARCHAR2(50),
 IMGSRC VARCHAR2(150)
 );
 
 update member set dept = 1, deptno = 1, name = 1, age = 1, post = 1, address = 1, gender = 1, email = 1, memberfile = 1, intro = 1 imgsrc = 1  where empno = 'ADMIN'
 update member set password = 1234;
 update member set MEMBERFILE = "";
 update member set password =123456 where empno ='ADMIN'
 
 INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('ADMIN','','','1','123456','홍길동','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','admin@boat.com','01012345678','안녕하세요 반갑습니다','/uploadImage/adminImage');
 
 
  INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('231001','홍보팀','10','123456','123456','홍길동','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','hgd123@boat.com','01012345678','안녕하세요 반갑습니다','/image/image_sample.png');
 
   INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('232001','개발팀','20','123456','123456','박길동','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','bgd123@boat.com','01012345678','안녕하세요 반갑습니다','/image/image_sample.png');
 
  INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('233001','인사팀','30','123456','123456','김길동','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','bgd123@boat.com','01012345678','안녕하세요 반갑습니다','/image/image_sample.png');
 
  INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('234001','기획팀','40','123456','123456','이길동','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','bgd123@boat.com','01012345678','안녕하세요 반갑습니다','/image/image_sample.png');
 
  INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('235001','영업팀','50','123456','123456','최길동','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','bgd123@boat.com','01012345678','안녕하세요 반갑습니다','/image/image_sample.png');
 
 
 
   INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('231002','홍보팀','10','123456','123456','홍동길','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','hgd123@boat.com','01012345678','안녕하세요 반갑습니다','/image/image_sample.png');
 
    INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('232002','개발팀','20','123456','123456','박동길','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','bgd123@boat.com','01012345678','안녕하세요 반갑습니다','/image/image_sample.png');
 
  INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('233002','인사팀','30','123456','123456','김동길','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','bgd123@boat.com','01012345678','안녕하세요 반갑습니다','/image/image_sample.png');
 
   INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('234002','기획팀','40','123456','123456','이동길','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','bgd123@boat.com','01012345678','안녕하세요 반갑습니다','/image/image_sample.png');
 
  INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('235002','영업팀','50','123456','123456','최동길','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','bgd123@boat.com','01012345678','안녕하세요 반갑습니다','/image/image_sample.png');
 
 select * from member;
 
 
INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,GENDER,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('ADMIN','','','123456','123456','홍길동','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','남','admin@boat.com','01012345678','안녕하세요 반갑습니다','/uploadImage/adminImage');

