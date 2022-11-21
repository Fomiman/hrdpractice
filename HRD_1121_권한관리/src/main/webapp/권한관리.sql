--권한관리

--테이블 1
create table USER_TBL_08 (
	user_no char(5) not null , --pk
	user_name varchar(50) not null,
	user_pw varchar(50) ,
	dept_no char(3),
	user_gbn char(2),
	reg_date date,
	
	primary key(user_no)
	
);

--테이블 1 샘플데이터
insert into USER_TBL_08 values(10001, '홍길동', 1111 , 'A01', 'U1' ,'18/01/10');
insert into USER_TBL_08 values(10002, '김유신', 1111 , 'A02', 'U1' ,'18/02/10');
insert into USER_TBL_08 values(10003, '이순신', 1111 , null, 'U2' ,'18/03/10');


select * from USER_TBL_08;

-- 테이블 2
create table dept_auth_tbl_08 (
	dept_no char(3) not null,
	menu_no number not null,
	
	primary key(dept_no, menu_no)
);

--테이블2 샘플데이터
insert into dept_auth_tbl_08 values('A01',10);
insert into dept_auth_tbl_08 values('A01',11);
insert into dept_auth_tbl_08 values('A02',12);
insert into dept_auth_tbl_08 values('A02',13);


select * from dept_auth_tbl_08;

--테이블 3 
create table user_auth_tbl_08 (
	user_no char(5) not null,
	menu_no number not null,
	
	primary key(user_no,menu_no)
);

--테이블 3 샘플 데이터
insert into user_auth_tbl_08 values(10001,12);
insert into user_auth_tbl_08 values(10003,13);


select * from user_auth_tbl_08;

---------------------------------------------------------------------------------
select max(user_no)+1 from USER_TBL_08;

select user_no, user_name, 
nvl(decode(dept_no, 'A01', '인사', 'A02','개발','B01','총무','B02','회계' ),' '), 
user_gbn, reg_date from USER_TBL_08; 



select user_no, user_name, menu_no, 
nvl(decode(menu_no, 10,'부서관리',11,'사원관리',12,'기초정보관리',13,'급여계산'), ' ') 
from USER_TBL_08 u , dept_auth_tbl_08 d , user_auth_tbl_08 a
where (u.user_no = a.user_no(+)) and (u.dept_no = d.dept_no(+))
;

select *
from USER_TBL_08 u , dept_auth_tbl_08 d
where (u.dept_no = d.dept_no(+))
;

select u.user_no, u.user_name, d.menu_no, 
nvl(decode(d.menu_no, 10,'부서관리',11,'사원관리',12,'기초정보관리',13,'급여계산'), ' ') 
from USER_TBL_08 u , dept_auth_tbl_08 d , user_auth_tbl_08 a
where (u.user_no = a.user_no(+)) and (u.dept_no = d.dept_no(+))
;

select u.user_no, u.user_name, d.menu_no, 
nvl(decode(d.menu_no, 10,'부서관리',11,'사원관리',12,'기초정보관리',13,'급여계산'), ' ') 
from USER_TBL_08 u full outer join dept_auth_tbl_08 d full outer join user_auth_tbl_08 a
;

select u.user_no, u.user_name, d.menu_no, 
nvl(decode(d.menu_no, 10,'부서관리',11,'사원관리',12,'기초정보관리',13,'급여계산'), ' ')  
from USER_TBL_08 u 
full outer join dept_auth_tbl_08 d 
on u.dept_no = d.dept_no
full outer join user_auth_tbl_08 a
on (u.user_no = a.user_no);

select *  
from USER_TBL_08 u 
full outer join dept_auth_tbl_08 d 
on u.dept_no = d.dept_no
full outer join user_auth_tbl_08 a
on (u.user_no = a.user_no);

select u.user_no, u.user_name, d.menu_no, 
nvl(decode(d.menu_no, 10,'부서관리',11,'사원관리',12,'기초정보관리',13,'급여계산'), ' ') as menu_name
from USER_TBL_08 u , dept_auth_tbl_08 d
where (u.dept_no = d.dept_no(+))

union all

select u.user_no, u.user_name, a.menu_no, 
nvl(decode(a.menu_no, 10,'부서관리',11,'사원관리',12,'기초정보관리',13,'급여계산'), ' ') as menu_name
from USER_TBL_08 u , user_auth_tbl_08 a
where (u.user_no = a.user_no(+));


select *
from dept_auth_tbl_08 d full outer join user_auth_tbl_08 a
on d.MENU_NO = a.MENU_NO;

select menu_no from dept_auth_tbl_08
union all
select menu_no from user_auth_tbl_08;


select u.user_no, u.user_name, d.menu_no, 
nvl(decode(d.menu_no, 10,'부서관리',11,'사원관리',12,'기초정보관리',13,'급여계산'), ' ') as menu_name
from USER_TBL_08 u join dept_auth_tbl_08 d
on (u.dept_no = d.dept_no)

union

select u.user_no, u.user_name, a.menu_no, 
nvl(decode(a.menu_no, 10,'부서관리',11,'사원관리',12,'기초정보관리',13,'급여계산'), ' ') as menu_name
from USER_TBL_08 u join user_auth_tbl_08 a
on (u.user_no = a.user_no);

