/* 커피숍 회원관리 프로그램 */

--1. 회원정보테이블
create table member_tbl(
custno number not null primary key, --1. 회원번호
custname varchar2(20), --2. 회원성명
gender char(1), --3. 성별 
phone varchar2(13), --4. 회원전화
address varchar2(60), --5. 주소
joindate date, --6. 가입일자
grade char(1), --7. 고객등급
city char(2) --8. 거주도시
);

--샘플데이터 입력
insert into MEMBER_TBL  values('100001','김행복','F','010-1111-2222','서울 동대문구 휘경1동','2015-12-02','A','01');
insert into MEMBER_TBL  values('100002','이축복','M','010-1111-3333','서울 동대문구 휘경2동','2015-12-06','B','01');
insert into MEMBER_TBL  values('100003','장믿음','F','010-1111-4444','울릉군 울릉읍 독도1리','2015-10-01','B','30');
insert into MEMBER_TBL  values('100004','최사랑','M','010-1111-5555','울릉군 울릉읍 독도2리','2015-11-13','A','30');
insert into MEMBER_TBL  values('100005','진평화','F','010-1111-6666','제주도 제주시 외나무골','2015-12-25','B','60');
insert into MEMBER_TBL  values('100006','차공단','M','010-1111-7777','제주도 제주시 감나무골','2015-12-11','C','60');
insert into MEMBER_TBL  values('100007','전진주','M','010-1111-8888','대구 수성구 고산1동','2015-11-03','A','90');
insert into MEMBER_TBL  values('100008','중고차','M','010-1111-9999','대구 수성구 고산2동','2015-09-23','A','90');
insert into MEMBER_TBL  values('100009','상수리','F','010-2222-0000','대구 수성구 고산3동','2015-12-03','B','90');
insert into MEMBER_TBL  values('100010','외다리','F','010-2222-1111','대구 수성구 사월동','2015-10-30','C','90');

--확인
select * from MEMBER_TBL;


--2. 매출정보 테이블
create table sale_tbl(
custno number not null, --1 회원번호
saleno number not null primary key, --2 판매번호
amount number, --3 판매수량
price number, --4 판매가격
pcode varchar2(4), --5 상품코드
sdate date --6 판매일자
);

--샘플데이터 입력
insert into sale_tbl values ('100001','1001','5','15000','A001','2019-01-01');
insert into sale_tbl values ('100002','1002','5','20000','A002','2019-01-02');
insert into sale_tbl values ('100003','1003','5','30000','A003','2019-01-03');
insert into sale_tbl values ('100004','1004','4','20000','A004','2019-01-04');
insert into sale_tbl values ('100005','1005','5','15000','A001','2019-01-05');
insert into sale_tbl values ('100006','1006','1','4000','A002','2019-01-06');
insert into sale_tbl values ('100001','1007','2','12000','A003','2019-01-07');
insert into sale_tbl values ('100002','1008','3','15000','A004','2019-01-08');
insert into sale_tbl values ('100003','1009','4','12000','A001','2019-01-09');
insert into sale_tbl values ('100004','1010','5','20000','A002','2019-01-10');
insert into sale_tbl values ('100005','1011','6','36000','A003','2019-01-11');
insert into sale_tbl values ('100006','1012','7','35000','A004','2019-01-12');

--확인
select * from sale_tbl;

--3. 커피정보 테이블
create table coffee_tbl(
pcode varchar2(4) not null, --1 상품코드
pname varchar2(60) not null, --2 상품명
pcost number --3 상품단가
);

--샘플데이터
insert into coffee_tbl values('A001','아메리카노','3000');
insert into coffee_tbl values('A002','카푸치노','4000');
insert into coffee_tbl values('A003','카페모카','6000');
insert into coffee_tbl values('A004','카라멜마끼야또','5000');

--확인 
select * from coffee_tbl;

--3. 변경된 커피가격 정보 테이블
create table coffee_tbl2(
pcode varchar2(4) not null, --1 상품코드
pname varchar2(60) not null, --2 상품명
pcost number --3 상품단가
);

--샘플데이터
insert into coffee_tbl2 values('A001','아메리카노','3000');
insert into coffee_tbl2 values('A002','카푸치노','4000');
insert into coffee_tbl2 values('A003','카페모카','6000');
insert into coffee_tbl2 values('A004','카라멜마끼야또','5000');

--확인 
select * from coffee_tbl2;


select pcode,pname,pcost from coffee_tbl2 

minus

select pcode,pname,pcost from coffee_tbl;

select pname, pcost from coffee_tbl where pcode ='A001';

--delete from coffee_tbl where pcode='A007';
--delete from coffee_tbl2 where pcode='A007';
--
--insert into coffee_tbl values('A007','test','7000');
--insert into coffee_tbl2 values('A007','test','7000');

select pname, pcode, pcost, sum(amount), sum(price) 
from coffee_tbl join sale_tbl
using(pcode)
group by pname, pcode, pcost
order by pcost desc;



select * from coffee_tbl;

select * from sale_tbl;

select *
from coffee_tbl join sale_tbl
using(pcode);



select pname, pcode, pcost, sum(amount), to_char(sum(price), 'l999,999,999') 
from coffee_tbl join sale_tbl
using(pcode)
group by pname, pcode, pcost
order by pcost desc;




