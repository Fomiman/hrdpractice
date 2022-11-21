
-- 1. 사원정보 테이블
create table EMPLOYEE_TBL_13(
EMPLOYEE_NO NUMBER NOT NULL PRIMARY KEY, --1. 사원번호
EMPLOYEE_NAME VARCHAR2(20) NOT NULL, --2. 사원명
DEPT_NO CHAR(2), --3. 부서번호
HIRE_DATE DATE, --4. 입사일자
EMPLOYEE_STATUS CHAR(1) --5. 사원상태
);

--샘플데이터
insert into EMPLOYEE_TBL_13 values(1001, '김을동', '10','18/02/10','1');
insert into EMPLOYEE_TBL_13 values(1002, '박기동', '10','18/02/10','2');
insert into EMPLOYEE_TBL_13 values(1003, '최순자', '20','18/02/11','1');
insert into EMPLOYEE_TBL_13 values(1004, '강하나', '20','18/02/11','1');
insert into EMPLOYEE_TBL_13 values(1005, '채시라', '30','18/03/10','1');


--2-1. 출퇴근정보 테이블-1(오전출근~오후퇴근)
create table WORK_TBL_13_1(
WORK_DATE CHAR(8) NOT NULL, --1. 근무일자
EMPLOYEE_NO NUMBER NOT NULL, --2. 사원번호
WORK_IN_TIME VARCHAR(4), --3. 출근시간
WORK_OUT_TIME VARCHAR(4), --4. 퇴근시간

CONSTRAINT WORK_TBL_1_PK PRIMARY KEY(WORK_DATE, EMPLOYEE_NO)
);

--샘플데이터
INSERT INTO WORK_TBL_13_1 values('20180901','1001','0910','1510');
INSERT INTO WORK_TBL_13_1 values('20180902','1001','0910','1510');
INSERT INTO WORK_TBL_13_1 values('20180903','1001','0910','1520');
INSERT INTO WORK_TBL_13_1 values('20180904','1001','0810','1610');
INSERT INTO WORK_TBL_13_1 values('20180907','1001','0910','1630');
INSERT INTO WORK_TBL_13_1 values('20180908','1001','0900','1500');
INSERT INTO WORK_TBL_13_1 values('20180909','1001','0930','1500');
INSERT INTO WORK_TBL_13_1 values('20180911','1001','0920','1540');
INSERT INTO WORK_TBL_13_1 values('20180912','1001','0900','1500');
INSERT INTO WORK_TBL_13_1 values('20180911','1003','1210','1710');
INSERT INTO WORK_TBL_13_1 values('20180912','1003','1210','1710');
INSERT INTO WORK_TBL_13_1 values('20180913','1003','1210','1720');
INSERT INTO WORK_TBL_13_1 values('20180914','1003','1210','1710');
INSERT INTO WORK_TBL_13_1 values('20180915','1003','1210','1730');
INSERT INTO WORK_TBL_13_1 values('20180916','1003','1200','1700');
INSERT INTO WORK_TBL_13_1 values('20180917','1003','1230','1700');
INSERT INTO WORK_TBL_13_1 values('20180918','1003','1220','1740');

--2-1. 출퇴근정보 테이블-2(오후출근~다음날오전퇴근)
create table WORK_TBL_13_2(
WORK_DATE CHAR(8) NOT NULL, --1. 근무일자
EMPLOYEE_NO NUMBER NOT NULL, --2. 사원번호
WORK_IN_TIME VARCHAR(4), --3. 출근시간
WORK_OUT_TIME VARCHAR(4), --4. 퇴근시간

CONSTRAINT WORK_TBL_2_PK PRIMARY KEY(WORK_DATE, EMPLOYEE_NO)
);

--샘플데이터
INSERT INTO WORK_TBL_13_2 values('20180901','1001','1910','0510');
INSERT INTO WORK_TBL_13_2 values('20180902','1001','1910','0510');
INSERT INTO WORK_TBL_13_2 values('20180903','1001','1910','0520');
INSERT INTO WORK_TBL_13_2 values('20180904','1001','1810','0610');
INSERT INTO WORK_TBL_13_2 values('20180907','1001','1910','0630');
INSERT INTO WORK_TBL_13_2 values('20180908','1001','1900','0500');
INSERT INTO WORK_TBL_13_2 values('20180909','1001','1930','0500');
INSERT INTO WORK_TBL_13_2 values('20180911','1001','1920','0540');
INSERT INTO WORK_TBL_13_2 values('20180912','1001','1900','0500');
INSERT INTO WORK_TBL_13_2 values('20180911','1003','1210','1710');
INSERT INTO WORK_TBL_13_2 values('20180912','1003','1210','1710');
INSERT INTO WORK_TBL_13_2 values('20180913','1003','1210','1720');
INSERT INTO WORK_TBL_13_2 values('20180914','1003','1210','1710');
INSERT INTO WORK_TBL_13_2 values('20180915','1003','1210','1730');
INSERT INTO WORK_TBL_13_2 values('20180916','1003','1200','1700');
INSERT INTO WORK_TBL_13_2 values('20180917','1003','1230','1700');
INSERT INTO WORK_TBL_13_2 values('20180918','1003','1220','1740');


-- 확인
select * from EMPLOYEE_TBL_13;
select * from WORK_TBL_13_1;
select * from WORK_TBL_13_2;


--selectEmployee.jsp
--사원번호, 사원명, 부서번호, 입사일자, 사원상태코드, 사원상태명
select  EMPLOYEE_NO, EMPLOYEE_NAME, DEPT_NO, 
to_char(HIRE_DATE, 'yyyy-mm-dd') as HIRE_DATE, 
EMPLOYEE_STATUS,
decode(EMPLOYEE_STATUS, '1','입사','2','퇴사','3','휴식') as EMPLOYEE_STATUS2
from EMPLOYEE_TBL_13;

-- updateEmployeePro.jsp
select  EMPLOYEE_NO, EMPLOYEE_NAME, DEPT_NO, HIRE_DATE, EMPLOYEE_STATUS
from EMPLOYEE_TBL_13 where EMPLOYEE_NAME='김을동';


--delete from EMPLOYEE_TBL_13 where EMPLOYEE_NAME='조용원';

--lookupSalary.jsp
--근무년월 사원번호 급여(시급9000 분당으로 계산)
--1. 아침~저녁 테이블
select *
from EMPLOYEE_TBL_13 natural join WORK_TBL_13_1;

--시간부분 잘라서 분으로 환산
select (substr(WORK_OUT_TIME,1,2)-substr(WORK_IN_TIME,1,2))*60
from EMPLOYEE_TBL_13 natural join WORK_TBL_13_1;

--분으로 환산한 시간부분과, 분을 합친뒤에 근무시간 계산 
select 
(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))- 
(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2)) as worktime --근무시간 분으로 환산
from EMPLOYEE_TBL_13 natural join WORK_TBL_13_1;

-- group by로 묶어줌
select substr(WORK_DATE,1,6) , EMPLOYEE_NO,
sum(
(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))
- 
(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2))
) as worktime --근무시간 분으로 환산 후 sum으로 합침
from EMPLOYEE_TBL_13 natural join WORK_TBL_13_1
group by substr(WORK_DATE,1,6), EMPLOYEE_NO;

-- 분급계산
select substr(WORK_DATE,1,6) , EMPLOYEE_NO,
sum(
(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))
- 
(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2))
)
*(9000/60) as salary --급여계산
from EMPLOYEE_TBL_13 natural join WORK_TBL_13_1
group by substr(WORK_DATE,1,6), EMPLOYEE_NO;

--2. 저녁~아침 테이블
select *
from EMPLOYEE_TBL_13 natural join WORK_TBL_13_2;

select 
case when
(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))- 
(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2)) 
<0 then 
(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))- 
(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2)) 
+24*60 else 
(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))- 
(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2)) 
+0 end
as worktime --근무시간 분으로 환산
from EMPLOYEE_TBL_13 natural join WORK_TBL_13_2;

-- 위 1.에서 나온 테이블 이용하여 
-- sum() 안에 case when~ then ~ end 사용하여
--WORK_OUT_TIME이 WORK_IN_TIME보다 작을때
--WORK_OUT_TIME에 24를 더해주어 시간차이 해결



select substr(WORK_DATE,1,6) , EMPLOYEE_NO,
sum( case when
(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))- 
(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2)) 
<0 then 
(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))- 
(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2)) 
+24*60 else 
(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))- 
(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2)) 
+0 end ) *(9000/60) as salary --급여계산
from EMPLOYEE_TBL_13 natural join WORK_TBL_13_2
group by substr(WORK_DATE,1,6), EMPLOYEE_NO;