	--calendar sql
	--테이블 정의서 Number, E_NAME, START_DATE, END_DATE, ALLDAY
	drop table boat_Calendar cascade constraints purge;
SELECT * FROM MEMBER;
--dept empno추가 필요
create table boat_Calendar (
schedule_code varchar2 (500) primary key,
event_name varchar2 (55),
start_date varchar2  (55),
end_date varchar2	 (55),
allday varchar2(10) check (allday  in('true','false')),
empno varchar2(20),
color varchar2(20),
DEPT varchar2(15) CHECK (DEPT IN('홍보팀','개발팀','인사팀','기획팀','영업팀','개인일정','관리자'))
);
update boat_Calendar set empno = 'ADMIN';

update boat_Calendar set start_date ='2023-01-31 00:00:00' , end_date ='2023-02-01 00:00:00' where empno ='ADMIN' and event_name = '<기획팀>654' 


dept varchar2(10) CHECK (DEPT IN('홍보팀','개발팀','인사팀','기획팀','영업팀')),
delete from boat_Calendar;
delete from boat_Calendar where event_name = '<홍보팀>1313' and empno = ''
select * from boat_Calendar;

update boat_Calendar set start_date ='2023-02-12' end_date ='2023-02-12' where empno ='ADMIN'
update boat_Calendar set start_date ='2023-02-01 00:00:00' , end_date ='2023-02-02 00:00:00' where empno ='ADMIN' and event_name = '<인사팀>ㅁㄹㅇ'; 
create sequence cal_seq nocache;

insert into boat_Calendar 
	values(cal_seq.nextval,?,?,?,?);

	drop sequence cal_seq;
	
	
create sequence cal_seq nocache;

--  member table

drop table member cascade constraints purge;

create table MEMBER(
 EMPNO VARCHAR2(12) PRIMARY KEY,
 DEPT VARCHAR2(10)
 CONSTRAINT BOAT_DEPT_CK CHECK (DEPT IN('홍보팀','개발팀','인사팀','기획팀','영업팀')),
 DEPTNO NUMBER(2),
 CONSTRAINT BOAT_DEPTNO_CK CHECK (DEPTNO IN('10','20','30','40','50')),
 PASSWORD VARCHAR2(10),
 PWCHECK VARCHAR2(10),
 NAME VARCHAR2(15),
 JUMIN NUMBER(14),
 ADDRESS VARCHAR2(150),
 POST NUMBER(5),
 GENDER VARCHAR2(3),
 EMAIL VARCHAR2(30),
 PHONE NUMBER(11),
 MEMBERFILE VARCHAR2(50),
 IMGSRC VARCHAR2(150)
 );
 
  INSERT INTO member (EMPNO, DEPT, DEPTNO, PASSWORD,PWCHECK,NAME,JUMIN,ADDRESS,POST,GENDER,EMAIL,PHONE,MEMBERFILE,IMGSRC)
 VALUES('ADMIN','','','123456','123456','홍길동','8811221012345','서울특별시 종로구 율곡로10길 105 디아망', '12345','남','admin@boat.com','01012345678','안녕하세요 반갑습니다','/uploadImage/adminImage');
 
 SELECT * FROM MEMBER;
