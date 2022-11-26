-- 가) 회원정보 테이블 
create table member(
memno char(4) primary key,
name varchar2(30) not null,
address varchar2(100) not null,
hiredate date,
gender char(1),
tel1 char(3),
tel2 char(4),
tel3 char(4)
);

--[문제]에서 sequence 생성하라고 나오면-------------------------------------------------------------------

create sequence member_seq
start with 1001
increment by 1
minvalue 1001;

insert into member values('1001', '김고객', '경북 경산시 중방동', '02/01/01', 'F', '010','1234','1001');
insert into member values('1002', '이고객', '경북 경산시 삼북동', '02/02/01', 'M', '010','1234','1002');
insert into member values('1003', '박고객', '경북 경산시 옥산동', '02/03/01', 'M', '010','1234','1003');
insert into member values('1004', '조고객', '대구 광역시 달서구', '02/04/01', 'M', '010','1234','1004');
insert into member values('1005', '유고객', '대전 광역시 유성구', '02/05/01', 'M', '010','1234','1005');
insert into member values('1006', '여고객', '대구 광역시 구성구', '02/06/01', 'M', '010','1234','1006');
insert into member values('1007', '남고객', '충남 금산군 중도리', '02/07/01', 'F', '010','1234','1007');
insert into member values('1008', '황고객', '서울 특별시 관악구', '02/08/01', 'F', '010','1234','1008');
insert into member values('1009', '전고객', '서울 특별시 강서구', '02/09/01', 'F', '010','1234','1009');

select * from member;
--delete from MEMBER where name='조용원';
-- delete from MEMBER where address ='asd';

--insert.jsp
--회원번호
select NVL(max(memno), 0)+1 AS memno from member;
--가입일
select TO_CHAR(SYSDATE ,'yyyy-mm-dd') AS hiredate from dual; -- ※MySQL : now()
--회원번호 + 가입일 => 가장 빠른 방법
select NVL(max(memno), 0)+1 AS memno ,
TO_CHAR(SYSDATE ,'yyyy/mm/dd') AS hiredate
from member;

--※ dual 가상테이블 사용이유? 결과값이 1개만 나오므로...
select sysdate from member; -- sysdate가 9줄이나 나옴 쓸데없이
select sysdate from dual; --1줄만 깔끔하게

--select.jsp
--[방법-1] DECODE() 함수
select memno, name, address,
TO_CHAR(hiredate, 'yyyy.mm.dd') as 가입일,
DECODE(gender, 'M','남','F','여','성별미선택') as 성별,
--DECODE(gender, 'M','남','F','여') , --원래는 null값 안되니까 이렇게 해야된다.
tel1||'-'||tel2||'-'||tel3 as 전화번호
from member;

--[방법-2] CASE ~ END
select memno, name, address,
TO_CHAR(hiredate, 'yyyy.mm.dd') as 가입일,

CASE gender when 'M' then'남' else '여' END,

tel1||'-'||tel2||'-'||tel3 
from member;


--update.jsp
select memno, name, address,
TO_CHAR(hiredate, 'yyyy-mm-dd') as hiredate,
gender, -- 값을 그대로 가져와야 한다.(이유? html에서 value="M","F"로 값 비교 후 selected해야하므로)
tel1||'-'||tel2||'-'||tel3 as tel
from member
where memno = '1007';


--나) 등급정보 테이블
create table grade(
memgrade number(1) not null,
loprice number(30) not null,
hiprice number(30) not null
);

insert into grade values ( 1, 150001, 500000);
insert into grade values ( 2, 100001, 150000);
insert into grade values ( 3, 50001, 100000);
insert into grade values ( 4, 1, 50000);

select * from grade;


-- 다) 매출정보 테이블
create table buy(
memno char(4),
prodno char(4),
product varchar2(20) not null,
price number(30),
bno number(30),

primary key(memno, prodno)
);

insert into buy values ('1009', '0001', '긴 바지', 30000, 4);
insert into buy values ('1009', '0002', '점퍼', 100000, 1);
insert into buy values ('1006', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values ('1006', '0002', '점퍼', 100000, 1);
insert into buy values ('1005', '0003', '반팔 셔츠', 20000, 3);
insert into buy values ('1002', '0003', '반팔 셔츠', 20000, 2);
insert into buy values ('1002', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values ('1001', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values ('1001', '0005', '긴팔 후드티', 23000, 2);


select * from buy;   


--select2.jsp [내 방법]
select *
from member  join buy 
using(memno);

select memno, sum(price*bno) ,name
from (select *
from member  join buy 
using(memno))    
group by memno, name
order by 2 desc;



select 
DECODE(memgrade, 1, 'VIP', 2, 'Gold', 3, 'Silver', 4, 'Normal') as memgrade, 
memno, 
name, 
TO_CHAR(totalprice, '999,999,999,999') as totalprice1
from (select memno, sum(price*bno) as totalprice, name 
		from (	select * 
				from member join buy 
				using(memno)) 
				group by memno, name) 
join grade on totalprice between loprice and hiprice
order by totalprice1 desc;

--select2.jsp [방법-1 : join~on, 방법-2: , ~ where ※주의:조인조건과 검색조건을 괄호로 잘 구분해줘야한다.]--------------------
-- [순서-1]
select memno, name, price, bno
from MEMBER natural join BUY; -- 회원번호로 조인 : 중복 제거되어 별칭사용 안함


select memno, name, SUM(price*bno) as totalprice
from MEMBER natural join BUY
group by memno, name;

-- [순서-2] memgrade에 대해 자바로 처리
--비등가 조인(join~on)
select memgrade,  -- memgrade에 대해 자바로 처리 : switch문으로 "VIP"~"Normal"
memno, name, TO_CHAR(totalprice , 'L999,999,999') -- 지역화폐 단위 "L"+천단위 구분 쉼표
from GRADE join (select memno, name, SUM(price*bno) as totalprice
					from MEMBER natural join BUY
					group by memno, name)
on (loprice <= totalprice  and  totalprice<= hiprice)
order by 4 desc;



-- [순서-2] memgrade에 대해 SQL로 처리 : DECODE() 사용
--비등가 조인(join~on)
select DECODE(memgrade, 1, 'VIP', 2,'Gold' ,3, 'Silver',4,'Normal')
, memno, name, 
TO_CHAR(totalprice , 'L999,999,999') -- 지역화폐 단위 "L"+천단위 구분 쉼표
from GRADE join (select memno, name, SUM(price*bno) as totalprice
					from MEMBER natural join BUY
					group by memno, name)
on totalprice between loprice and hiprice
order by 4 desc;

-- [순서-2] memgrade에 대해 SQL로 처리 : CASE ~ END 사용 ( <, > 연산자를 사용할 때는 CASE~END를 사용해야한다.)
--비등가 조인(join~on)
select 
CASE	when memgrade= 1 then 'VIP' 
		when memgrade= 2 then 'Gold' 
		when memgrade= 3 then 'Silver' 
		when memgrade= 4 then 'Normal' 
		END as 등급,
memno as 회원번호, name as 이름, 
TO_CHAR(totalprice , 'L999,999,999') as 구입액 -- 지역화폐 단위 "L"+천단위 구분 쉼표
from GRADE join (select memno, name, SUM(price*bno) as totalprice
					from MEMBER natural join BUY
					group by memno, name)
on totalprice between loprice and hiprice
order by 4 desc;

--TO_CHAR(totalprice , 'FML999,999,999') 
-- 왼쪽 공백제거(FM)+지역화폐 단위 "L"+천단위 구분 쉼표






