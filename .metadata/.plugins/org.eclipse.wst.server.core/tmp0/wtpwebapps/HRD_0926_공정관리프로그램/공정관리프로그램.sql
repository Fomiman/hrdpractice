
-- 1. 제품정보 테이블
create table tbl_product(
p_code char(4) not null primary key, --1.제품코드
p_name varchar2(20), --2.제품명
p_size varchar2(40), --3.제품규격
p_type varchar2(20), --4.제품구분
p_price number(7) --5.제품단가
);

-- 샘플 데이터 입력
insert into tbl_product values('A001','A-1형 소형박스','100 x 110 x 50','A골판지','5000');
insert into tbl_product values('A002','A-2형 소형박스','100 x 110 x 70','A골판지','6000');
insert into tbl_product values('A003','A-3형 소형박스','100 x 110 x 100','A골판지','7000');
insert into tbl_product values('B001','B-1형 중형박스','150 x 130 x 50','B골판지','10000');
insert into tbl_product values('B002','B-2형 중형박스','150 x 130 x 70','B골판지','11000');
insert into tbl_product values('B003','B-3형 중형박스','150 x 130 x 100','B골판지','13000');
insert into tbl_product values('C001','C-1형 대형박스','180 x 150 x 50','C골판지','15000');
insert into tbl_product values('C002','C-2형 대형박스','180 x 150 x 70','C골판지','17000');
insert into tbl_product values('C003','C-3형 대형박스','180 x 150 x 100','C골판지','20000');

--2. 작업지시정보 테이블
create table tbl_worklist(
w_workno char(8) not null primary key, --1.작업지시번호
p_code char(4), --2.제품코드
w_quantity number(5), --3.수량
w_workdate date --4.작업시작일
);

-- 샘플 데이터 입력
insert into TBL_WORKLIST values('20190001','A001','100','19/11/01');
insert into TBL_WORKLIST values('20190002','A002','150','19/11/01');
insert into TBL_WORKLIST values('20190003','A003','200','19/11/01');
insert into TBL_WORKLIST values('20190004','B001','250','19/11/02');
insert into TBL_WORKLIST values('20190005','B002','100','19/11/02');
insert into TBL_WORKLIST values('20190006','B003','150','19/11/02');
insert into TBL_WORKLIST values('20190007','C001','100','19/11/03');
insert into TBL_WORKLIST values('20190008','C002','150','19/11/03');
insert into TBL_WORKLIST values('20190009','C003','200','19/11/03');

--3. 작업공정정보 테이블
create table tbl_process(
w_workno char(8) not null primary key, --1. 작업지시번호
p_p1 char(1), --2.준비
p_p2 char(1), --3.인쇄
p_p3 char(1), --4.코팅
p_p4 char(1), --5.합지
p_p5 char(1), --6.접합
p_p6 char(1), --7.포장
w_lastdate char(8), --8.최종공정일자
w_lasttime char(4) --9.최종공정시간
);

-- 샘플 데이터 입력
insert into tbl_process values('20190001','Y','Y','Y','Y','Y','Y','20191001','0930');
insert into tbl_process values('20190002','Y','Y','Y','Y','Y','Y','20191001','1030');
insert into tbl_process values('20190003','Y','Y','Y','Y','Y','Y','20191001','1130');
insert into tbl_process values('20190004','Y','Y','Y','Y','Y','N','20191002','1330');
insert into tbl_process values('20190005','Y','Y','Y','Y','Y','N','20191002','1430');
insert into tbl_process values('20190006','Y','Y','Y','Y','Y','N','20191002','1530');
insert into tbl_process values('20190007','Y','Y','Y','Y','N','N','20191003','1630');
insert into tbl_process values('20190008','Y','Y','Y','Y','N','N','20191003','1730');


--productLookup.jsp
select  P_CODE, P_NAME, P_SIZE, P_TYPE, 
to_char(P_PRICE,'l999,999,999') --형태 변환
from tbl_product;



--orderLookup.jsp
--작업지시번호 제품코드 제품명 제품규격 제품구분 수량 작업시작일 -- 테이블 1,2 필요
select w_workno, p_code, p_name, p_size, p_type, w_quantity, 
to_char(w_workdate, 'yyyy-mm-dd') as w_workdate
from tbl_product join tbl_worklist
using(p_code);


--workprocessLookup.jsp
--작업지시번호 제품코드 제품명 준비 인쇄 코팅 합지 접합 포장 최종공정일자 최종공정시간 --11개
-- 테이블 1, 3 필요하지만 조인 조건이 적합한게 없어서 2 이용하여 조인조건 만들어서 사용
-- 제품코드로 1,2 조인하고 작업지시번호로 연달아 조인

--sql로 처리 DECODE 이용
select  substr(w_workno, 1 , 4)||'-'||substr(w_workno, 5 , 4) as w_workno, 
p_code, p_name,
decode(p_p1,'Y','완료','N','~') as p_p1, 
decode(p_p2,'Y','완료','N','~') as p_p2, 
decode(p_p3,'Y','완료','N','~') as p_p3, 
decode(p_p4,'Y','완료','N','~') as p_p4, 
decode(p_p5,'Y','완료','N','~') as p_p5, 
decode(p_p6,'Y','완료','N','~') as p_p6, 
 substr(w_lastdate, 1 , 4)||'-'||substr(w_lastdate, 5 , 2)||'-'||substr(w_lastdate, 7 , 2) as w_lastdate, 
substr(w_lasttime, 1 , 2)||':'||substr(w_lasttime, 3 , 2) as w_lasttime  
from 
TBL_WORKLIST 
join tbl_product using(p_code)
join tbl_process using(w_workno)
order by 1 ;

--JAVA로 처리
select w_workno, 
p_code, p_name,
p_p1, p_p2, p_p3, p_p4, p_p5, p_p6, 
w_lastdate, 
 w_lasttime
from TBL_WORKLIST join tbl_product using(p_code)
join tbl_process using(w_workno)
order by 1;

select w_workno, p_code, p_name,
p_p1, p_p2, p_p3, p_p4, p_p5, p_p6
from TBL_WORKLIST full outer join tbl_product using(p_code);

select * from TBL_PROCESS;
select * from TBL_PRODUCT;
select * from TBL_WORKLIST;

select *
from TBL_PROCESS natural join TBL_PRODUCT natural join TBL_WORKLIST;

--delete from TBL_PROCESS where w_workno = '20220001';
delete from TBL_PROCESS
where w_workno = '20190009';
