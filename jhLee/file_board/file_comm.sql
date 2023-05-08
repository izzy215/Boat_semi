drop table FILE_COMMENT cascade constraints purge;

update FILE_COMMENT set F_COMMENT_NUM =16
where F_COMMENT_NUM =18;

select F_C_NUM, FILE_COMMENT.F_C_ID,
F_CONTENT, F_COMMENT_DATE, F_COMMENT_RE_LEV,
F_COMMENT_RE_SEQ, F_COMMENT_RE_REF, member.memberfile 
from FILE_COMMENT join member on 
FILE_COMMENT.F_C_ID = member.empno 
where F_COMMENT_NUM = 27 order by F_COMMENT_RE_REF asc, 		
F_COMMENT_RE_SEQ asc

select count(*) from FILE_COMMENT
				where F_COMMENT_NUM = 29

select * from member;


update FILE_COMMENT set f_c_id = 'ADMIN'

create table FILE_COMMENT (
F_C_NUM number primary key,
F_C_ID varchar2(30) references member(empno),
F_CONTENT varchar2(200),
F_COMMENT_DATE date,
F_COMMENT_NUM NUMBER references file_board(FILE_NUM) on delete cascade,
F_COMMENT_RE_LEV number check(f_comment_re_lev in(0,1,2)),
F_COMMENT_RE_SEQ number(38), 
F_COMMENT_RE_REF number(38) 
);
select * from member;
create sequence filecom nocache;

drop sequence filecom;

select * from FILE_COMMENT;
select * from file_board;


update file_board set FILE_DATE = '2023-02-01'
where file_num = 8;





























create table file_board (
	FILE_NUM NUMBER(5) primary key,
	FILE_NAME VARCHAR2(30), 
	FILE_PASS NUMBER(30),
	FILE_SUBJECT VARCHAR2(300),	
	FILE_CONTENT VARCHAR2(4000),		
	FILE_FILE VARCHAR2(50),
	FILE_FILE2 VARCHAR2(50),		
	FILE_RE_REF NUMBER(5),	
	FILE_RE_LEV NUMBER(5),	
	FILE_RE_SEQ NUMBER(5),
	FILE_READCOUNT NUMBER(5),
	FILE_DATE DATE );

	
insert into FILE_COMMENT (F_C_NUM,F_C_ID,F_CONTENT,F_COMMENT_DATE,F_COMMENT_NUM,F_COMMENT_RE_LEV,F_COMMENT_RE_SEQ,F_COMMENT_RE_REF)
values (filecom.nextval,231001,1,sysdate,18,0,0,0);

insert into FILE_COMMENT (F_C_NUM,F_C_ID,F_CONTENT,F_COMMENT_DATE,F_COMMENT_NUM,F_COMMENT_RE_LEV,F_COMMENT_RE_SEQ,F_COMMENT_RE_REF)
values (filecom.nextval,232001,1,sysdate,18,1,1,0);

insert into FILE_COMMENT (F_C_NUM,F_C_ID,F_CONTENT,F_COMMENT_DATE,F_COMMENT_NUM,F_COMMENT_RE_LEV,F_COMMENT_RE_SEQ,F_COMMENT_RE_REF)
values (filecom.nextval,233001,1,sysdate,18,0,0,0);

insert into FILE_COMMENT (F_C_NUM,F_C_ID,F_CONTENT,F_COMMENT_DATE,F_COMMENT_NUM,F_COMMENT_RE_LEV,F_COMMENT_RE_SEQ,F_COMMENT_RE_REF)
values (4,231001,1,sysdate,1,0,0,0);

select * from FILE_COMMENT;
select * from file_board;

--정렬의 댓글 순 쿼리

 select FILE_NUM, FILE_NAME, FILE_SUBJECT, FILE_FILE, FILE_FILE2, FILE_RE_REF , FILE_RE_LEV , FILE_RE_SEQ , FILE_READCOUNT , FILE_DATE  , CNT 
from file_board left outer join 

  				(select F_COMMENT_NUM ,count(*) "CNT" from FILE_COMMENT group by F_COMMENT_NUM
					order by  CNT desc)
 					--댓글 숫자 가져옴
on FILE_NUM = F_COMMENT_NUM
where dept = '개발팀'
and FILE_NAME = '이지현';      -- searchval


 select FILE_NUM, FILE_NAME, FILE_SUBJECT, FILE_FILE, FILE_FILE2, FILE_RE_REF , FILE_RE_LEV , FILE_RE_SEQ , FILE_READCOUNT , FILE_DATE  , CNT 
from file_board left outer join 

  				(select F_COMMENT_NUM ,count(*) "CNT" from FILE_COMMENT group by F_COMMENT_NUM
					order by  CNT desc)
 					--댓글 숫자 가져옴(댓글순)
on FILE_NUM = F_COMMENT_NUM
where dept = '개발팀'    --()
and FILE_NAME = '이지현'      
order by FILE_DATE desc
, FILE_READCOUNT asc;

=================================댓글순==============
원문의 최신순========
조회수=======



 select FILE_NUM, FILE_NAME, FILE_SUBJECT, FILE_FILE, FILE_FILE2, FILE_RE_REF , FILE_RE_LEV , FILE_RE_SEQ , FILE_READCOUNT , FILE_DATE  , CNT 
from file_board left outer join 

  				(select F_COMMENT_NUM ,count(*) "CNT" from FILE_COMMENT group by F_COMMENT_NUM
					order by  CNT)
 					--댓글 숫자de가져옴(댓글순)
on FILE_NUM = F_COMMENT_NUM
where dept = '개발팀'    --()
and FILE_NAME = '이지현'      
order by FILE_RE_REF desc
, FILE_READCOUNT desc;  --바꿀값

================================================
1. 댓글순
 select FILE_NUM, FILE_NAME, FILE_SUBJECT, FILE_RE_REF , FILE_RE_LEV , FILE_RE_SEQ , FILE_READCOUNT , nvl(CNT ,0) CNT,dept
from file_board left outer join 
  				(select F_COMMENT_NUM ,count(*) "CNT" from FILE_COMMENT group by F_COMMENT_NUM
					order by  CNT desc)
 					--댓글 숫자 가져옴(댓글순)
on FILE_NUM = F_COMMENT_NUM
--where dept = '개발팀'    --()
--and FILE_NAME = '1'    
order by 
CNT desc,--댓글많은순
FILE_RE_REF desc
, FILE_RE_SEQ asc,

2. 조회순
 select FILE_NUM, FILE_NAME, FILE_SUBJECT, FILE_RE_REF , FILE_RE_LEV , FILE_RE_SEQ , FILE_READCOUNT , nvl(CNT ,0) CNT,dept
from file_board left outer join 
  				(select F_COMMENT_NUM ,count(*) "CNT" from FILE_COMMENT group by F_COMMENT_NUM
					order by  CNT desc)
 					--댓글 숫자 가져옴(댓글순)
on FILE_NUM = F_COMMENT_NUM
order by 
FILE_READCOUNT desc;

3.최신순
 select FILE_NUM, FILE_NAME, FILE_SUBJECT, FILE_RE_REF , FILE_RE_LEV , FILE_RE_SEQ , FILE_READCOUNT , nvl(CNT ,0) CNT,dept
from file_board left outer join 
  				(select F_COMMENT_NUM ,count(*) "CNT" from FILE_COMMENT group by F_COMMENT_NUM
					order by  CNT desc)
 					--댓글 숫자 가져옴(댓글순)
on FILE_NUM = F_COMMENT_NUM
order by 
FILE_RE_REF desc
, FILE_RE_SEQ asc;

--최종

 select FILE_NUM, FILE_NAME, FILE_SUBJECT, FILE_RE_REF , FILE_RE_LEV , FILE_RE_SEQ , FILE_READCOUNT , nvl(CNT ,0) CNT,dept
from file_board left outer join 
  				(select F_COMMENT_NUM ,count(*) "CNT" from FILE_COMMENT group by F_COMMENT_NUM
					order by  CNT desc)
on FILE_NUM = F_COMMENT_NUM
order by 
CNT desc,
FILE_RE_REF desc
, FILE_RE_SEQ asc;

select * from FILE_BOARD order by FILE_DATE desc;


select file_board.*  ,memberfile 
from file_board inner join MEMBER
--on member.EMPNO = file_board.empno
on member.NAME = file_board.FILE_NAME
where FILE_NUM= 1
order by FILE_RE_REF asc, FILE_RE_SEQ asc;


FILE_NAME file_board



  select * from 			
  (select b.*, rownum rnum from 			
  (select file_board.* , nvl(CNT ,0) CNT 	
  from file_board left outer join  			
  (select F_COMMENT_NUM,count(*) CNT 			
  from FILE_COMMENT 							
  group by F_COMMENT_NUM						
  order by CNT desc) 				
  on FILE_NUM = F_COMMENT_NUM 			
  where FILE_SUBJECT like '%지%' 			
  order by  FILE_DATE desc  )b 			
  where rownum<= 10 ) 			
  where rnum>= 1 and rnum<= 10 






