--drop table member_tbl_02;
--drop table money_tbl_02;

-- 회원정보 테이블
create table member_tbl_02 (
custno number(6) primary key,
custname varchar2(20),
phone varchar2(13),
address varchar2(60),
joindate date,
grade char(1),
city char(2)
);

insert into member_tbl_02 values ( 100001 ,  '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202','A', '01');
insert into member_tbl_02 values ( 100002 ,  '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206','B', '01');
insert into member_tbl_02 values ( 100003 ,  '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001','B', '30');
insert into member_tbl_02 values ( 100004 ,  '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151113','A', '30');
insert into member_tbl_02 values ( 100005 ,  '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225','B', '60');
insert into member_tbl_02 values ( 100006 ,  '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211','C', '60');


--회원매출정보 테이블 
create table money_tbl_02 (
custno number(6) ,
salenol number(8) ,
pcost  number(8),
amount  number(4),
price  number(8),
pcode varchar2(4),
sdate date,
constraint money_tbl_02_group_PK primary key(custno,salenol)
);

insert into money_tbl_02 values ( 100001, 20160001, 500 , 5, 2500 , 'A001', '20160101');
insert into money_tbl_02 values ( 100001, 20160002, 1000 , 4, 4000 , 'A002', '20160101');
insert into money_tbl_02 values ( 100001, 20160003, 500 , 3, 1500 , 'A008', '20160101');
insert into money_tbl_02 values ( 100002, 20160004, 2000 , 1, 2000 , 'A004', '20160102');
insert into money_tbl_02 values ( 100002, 20160005, 500 , 1, 500 , 'A001', '20160103');
insert into money_tbl_02 values ( 100003, 20160006, 1500 , 2, 3000 , 'A003', '20160103');
insert into money_tbl_02 values ( 100004, 20160007, 500 , 2, 1000 , 'A001', '20160104');
insert into money_tbl_02 values ( 100004, 20160008, 300 , 1, 300 , 'A005', '20160104');
insert into money_tbl_02 values ( 100004, 20160009, 600 , 1, 600 , 'A006', '20160104');
insert into money_tbl_02 values ( 100004, 20160010, 3000 , 1, 3000 , 'A007', '20160106');


-- selectmemberlist.jsp
select CUSTNO,custname,PHONE,ADDRESS,JOINDATE,
decode(GRADE, 'A', 'VIP', 'B', '일반', 'C', '직원') as grade,
CITY from member_tbl_02;

-- selectmembersales.jsp
select * from member_tbl_02;
select * from money_tbl_02;

--조인
select custno , custname,
 decode(GRADE, 'A', 'VIP', 'B', '일반', 'C', '직원') as grade,
 price
from member_tbl_02 join MONEY_TBL_02
using(custno);

select custno , custname, 
decode(GRADE, 'A', 'VIP', 'B', '일반', 'C', '직원') as grade, 
sum(price)
from member_tbl_02 join MONEY_TBL_02
using(custno)
group by custno, custname, grade;

-- 문법적인 설명 추가 
select custno , custname,
 decode(GRADE, 'A', 'VIP', 'B', '일반', 'C', '직원') as decodegrade,
 sum(price) as totalprice
-- to_char(sum(price), 'L999,999,999,999) as totalprice -- L 지역통화 =>  ￦ 
-- to_char(sum(price), '$999,999,999,999) as totalprice -- $ 달러 표시
from member_tbl_02 natural join money_tbl_02 -- 회원번호로 자연조인
-- group by custno , custname, decodegrade -- 오류 : invalid identified column
group by custno , custname, GRADE -- 여기서는 select에서 설정한 별칭 사용불가
order by decodegrade; -- ORDER BY 는 제일 마지막 순서라서 select에서 설정한 별칭 사용 가능


/****************************************************/
--오라클 쿼리 실행 순서
--FROM - WHERE - GROUP BY - HAVING - SELECT - ORDER BY 
--※ 뒷순서에서 설정한 별칭은 앞에서 사용할수 없다.
-- select에서 설정한 별칭은 order by에서만 사용할 수 있다.
--★★ 단, 아래 sql문은 where절에 별칭 사용가능
--select * from (select salary as "급여" from employee);
--from에서 불러온 서브쿼리에서 미리 별칭을 사용했기 때문에 이후 순서에서 별칭으로 불러오는 것이 가능하다.
/****************************************************/


--update.jsp
select custno, custname, phone,address,
TO_CHAR(joindate, 'yyyy-mm-dd') as joindate,
decode(GRADE, 'A', 'VIP', 'B', '일반', 'C', '직원') as grade,
city
from member_tbl_02
where custno = '100001';

--delete from member_tbl_02 where custname ='조용원';