--drop table student_tbl;
--drop table grade_tbl;
--drop table score_tbl;


-- 1. 학생정보 테이블
create table student_tbl(
studno number not null,
syear char(2) not null,
sname varchar2(20) not null,
address varchar2(100) not null,
gender char(1) not null,
tel varchar2(30) not null,
idnum char(14) not null unique, -- unique 따로 추가

constraint student_tbl_double_PK primary key(studno, syear) -- PK 두개
);

-- 1-1. 샘플데이터 insert sample1

insert into STUDENT_TBL values( 1001,  '04','김학생',  '경북 경산시 중방동', 'F', '010-1234-1001','970101-2000001');
insert into STUDENT_TBL values( 1002,  '04','이학생',  '경북 경산시 중산동', 'M', '010-1234-1002','970201-1000001');
insert into STUDENT_TBL values( 2001,  '03','최학생',  '경북 경산시 옥산동', 'M', '010-1234-1003','980301-1000001');
insert into STUDENT_TBL values( 2002,  '03','박학생',  '경북 경산시 삼북동', 'F', '010-1234-1004','980401-2000001');
insert into STUDENT_TBL values( 3001,  '02','유학생',  '대구 광역시 수성구', 'M', '010-1234-1005','990501-1000001');
insert into STUDENT_TBL values( 3002,  '02','전학생',  '대구 광역시 달서구', 'M', '010-1234-1006','990601-1000001');
insert into STUDENT_TBL values( 4001,  '01','남학생',  '대구 광역시 북구' , 'M', '010-1234-1007','000701-3000001');
insert into STUDENT_TBL values( 4002,  '01','여학생',  '대전 광역시 유성구', 'F', '010-1234-1008','000801-4000001');
insert into STUDENT_TBL values( 4003,  '01','정학생',  '경북 경산시 중앙동', 'F', '010-1234-1009','000901-4000001');


-- 2. 등급정보 테이블
create table grade_tbl(
grade char(1) not null,
loscore number not null,
hiscore number not null
);

-- 2-1. insert sample2
insert into grade_tbl values('A' , 90 , 100);
insert into grade_tbl values('B' , 80 , 89);
insert into grade_tbl values('C' , 70 , 79);
insert into grade_tbl values('D' , 60 , 69);
insert into grade_tbl values('F' , 0 , 59);


-- 3. 성적정보 테이블
CREATE table score_tbl (
studno number not null,
syear char(2) not null,
m_subject1 number check(m_subject1 between 0 and 100),
m_subject2 number check(m_subject2 between 0 and 100),
m_subject3 number check(m_subject3 between 0 and 100),
s_subject1 number check(s_subject1 between 0 and 100),
s_subject2 number check(s_subject2 between 0 and 100),

constraint score_tbl_double_PK primary key(studno, syear)
);


-- 3-1. insert sample3
insert into score_tbl values ( 1001, '04', 80, 90, 50, 20, 80);
insert into score_tbl values ( 1002, '04', 70, 80, 80, 70, 30);
insert into score_tbl values ( 2001, '03', 80, 80, 80, 70, 90);
insert into score_tbl values ( 2002, '03', 90, 80, 90, 70, 50);
insert into score_tbl values ( 3001, '02', 70, 60, 70, 70, 70);
insert into score_tbl values ( 3002, '02', 90, 50, 70, 80, 90);
insert into score_tbl values ( 4001, '01', 90, 80, 90, 90, 80);
insert into score_tbl values ( 4002, '01', 70, 60, 90, 50, 80);
insert into score_tbl values ( 4003, '01', 60, 80, 90, 50, 40);


-- 조회
select * from STUDENT_TBL;
select * from GRADE_TBL;
select * from SCORE_TBL;

--insertStudent.jsp
select nvl(max(studno),0)+1 from STUDENT_TBL;

-- selectScore.jsp
-- java로 null 처리
--성적 조회용 학생,성적 둘 다 입력해야 조회되게
select studno , sname, m_subject1, m_subject2, m_subject3, 
s_subject1, s_subject2,
(m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2) as totalScore,
round((m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2)/5) as avgScore
from STUDENT_TBL join SCORE_TBL using(studno) order by 1;

--성적 조회용 학생,성적 둘 중 하나만 입력해도 조회되게
select studno , sname, m_subject1, m_subject2, m_subject3, 
s_subject1, s_subject2,
(m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2) as totalScore,
round((m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2)/5) as avgScore
from STUDENT_TBL full outer join SCORE_TBL using(studno) order by 1;

--총점,평균
select studno,
sum(m_subject1),sum(m_subject2),sum(m_subject3),sum(s_subject1),sum(s_subject2),
avg(m_subject1),avg(m_subject2),avg(m_subject3),avg(s_subject1),avg(s_subject2)
from STUDENT_TBL join SCORE_TBL using(studno) group by studno order by 1;

--selectScore_UNION.jsp 두 테이블 한번에 표시하는 법
--컬럼수와 타입 맞추기
--[1]
select studno , sname, m_subject1, m_subject2, m_subject3, 
s_subject1, s_subject2,
(m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2) as totalScore,
round((m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2)/5) as avgScore
from STUDENT_TBL full outer join SCORE_TBL using(studno) --order by 1

union all -- 중복제거 X

select null, '과목 총점',
sum(m_subject1),sum(m_subject2),sum(m_subject3),sum(s_subject1),sum(s_subject2),
null, null
from SCORE_TBL

union all

select null, '과목 평균',
avg(m_subject1),avg(m_subject2),avg(m_subject3),avg(s_subject1),avg(s_subject2),
null, null
from SCORE_TBL ;

--[2] 학번으로 정렬
select * from(	select studno , sname, m_subject1, m_subject2, m_subject3, 
				s_subject1, s_subject2,
				(m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2) as totalScore,
				round((m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2)/5) as avgScore
				from STUDENT_TBL full outer join SCORE_TBL using(studno) --order by 1
				
				union all -- 중복제거 X
				
				select null, '과목 총점',
				sum(m_subject1),sum(m_subject2),sum(m_subject3),sum(s_subject1),sum(s_subject2),
				null, null
				from SCORE_TBL
				
				union all
				
				select null, '과목 평균',
				avg(m_subject1),avg(m_subject2),avg(m_subject3),avg(s_subject1),avg(s_subject2),
				null, null
				from SCORE_TBL )
order by studno asc;

/*----------------------------------------------------------------------*/
--SUM()과 COUNT() 비교
/*
sum(컬럼명 반드시 타입=>number) : 컬럼에 해당하는 전체 합계 
count() : 테이블에 데이터가 몇 건이 존재하는지 확인 -> 컬럼 타입 상관없음
		※conunt(*)만 null 포함
 */

--drop table test;
create table test(
name varchar2(5),
salary number,
dept varchar2(2),
commission number
);

insert into test values('test1', 1000, 'd1', '');
insert into test values('test2', 1000, 'd1', '');
insert into test values('test3', 2000, '', '');
insert into test values('test4', 1000, 'd2', '');
insert into test values('test5', 2000, 'd2', '');
insert into test values('test6', '', 'd2', '');

select * from test;

select count(*), -- 6 테이블 전체 행수((*)만 null 포함)
count(dept), -- 5 : 컬럼에 대한 행수(null 제외)
count(nvl(dept,0)), -- 6 : null을 0으로 변경해서 카운트에 포함
count(distinct dept) -- 2 : 중복된 값을 제거(null 제외)
from test;

select --sum(*), -- ※ 실행불가 : sum(반드시 number 타입의 컬럼명 적어야함)
sum(salary), -- 7000 (null 제외)
sum(nvl(salary,0)), -- 7000 (null을 0으로 변경)
sum(distinct salary) -- 3000 : 중복된 값을 제거해서 더함 1000+2000=3000 (null 제외)
from test;

select 
count(commission), -- 0 
sum(commission) -- null
from test;

select 
--avg(*), -- ※ 실행불가 : avg(반드시 number 타입의 컬럼명 적어야함) 
avg(salary), -- 1400 (null 제외) 총합을 5로 나눈결과
avg(nvl(salary,0)), -- 1166.66666.... (null을 0으로 변경해서 계산에 포함)
avg(distinct salary) -- 1500 중복제거된 값들(1000,2000)의 평균(null 제외)
from test;

/*
	count(1, null, 1, null) -> count(1, 1) : 행수 2
	  sum(1, null, 1, null) ->   sum(1, 1) : 더하면 2
	
	count(3, null, 4, null) -> count(3, 4) : 행수 2
	  sum(3, null, 4, null) ->   sum(3, 4) : 더하면 7
	
	만약 모든 데이터가 null이면 
	count(null, null) -> 행수 0
	  sum(null, null) -> 더하면 null
	  
	★★ 따라서 아래 SQL문은 COUNT()대신 SUM()을 사용 가능
		그러나 SUM() 결과로 null 이 나올 수 있으므로 null 처리 해줘야함
*/

-- subjectToRetake.jsp
-- 테이블 3의 점수를 테이블 2의 점수 기준으로 정리해서 인원 수만 나오게한다.
--성적 우수자
SELECT grade, count(st.m_subject1)
FROM SCORE_TBL st full outer join GRADE_TBL gt 
on st.m_subject1 between gt.loscore and hiscore
group by grade having grade='A'; 

SELECT grade, count(st.m_subject2) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.m_subject2 between gt.loscore and hiscore group by grade having grade='A'; 
SELECT grade, count(st.m_subject3) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.m_subject3 between gt.loscore and hiscore group by grade having grade='A'; 
SELECT grade, count(st.s_subject1) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.s_subject1 between gt.loscore and hiscore group by grade having grade='A'; 
SELECT grade, count(st.s_subject2) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.s_subject2 between gt.loscore and hiscore group by grade having grade='A'; 

------재수강 대상자
SELECT grade, count(st.m_subject1) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.m_subject1 between gt.loscore and hiscore group by grade having grade='F'; 
SELECT grade, count(st.m_subject2) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.m_subject2 between gt.loscore and hiscore group by grade having grade='F'; 
SELECT grade, count(st.m_subject3) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.m_subject3 between gt.loscore and hiscore group by grade having grade='F'; 
SELECT grade, count(st.s_subject1) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.s_subject1 between gt.loscore and hiscore group by grade having grade='F'; 
SELECT grade, count(st.s_subject2) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.s_subject2 between gt.loscore and hiscore group by grade having grade='F'; 


--[혜나방법]************************************************************************************************
-- 성적 우수자
select count(case when loscore<=m_subject1 and m_subject1<=hiscore then 1 end) as m_subject1,
count(case when loscore<=m_subject2 and m_subject2<=hiscore then 1 end) as m_subject2,
count(case when loscore<=m_subject3 and m_subject3<=hiscore then 1 end) as m_subject3,
count(case when loscore<=s_subject1 and s_subject1<=hiscore then 1 end) as s_subject1,
count(case when loscore<=s_subject2 and s_subject2<=hiscore then 1 end) as s_subject2
from score_tbl natural join (select * from grade_tbl where grade='A'); 

-- 재수강 대상자
select count(case when loscore<=m_subject1 and m_subject1<=hiscore then 1 end) as m_subject1,
 count(case when loscore<=m_subject2 and m_subject2<=hiscore then 1 end) as m_subject2,
 count(case when loscore<=m_subject3 and m_subject3<=hiscore then 1 end) as m_subject3,
 count(case when loscore<=s_subject1 and s_subject1<=hiscore then 1 end) as s_subject1,
 count(case when loscore<=s_subject2 and s_subject2<=hiscore then 1 end) as s_subject2
 from score_tbl natural join (select * from grade_tbl where grade='F'); 
--************************************************************************************************

--DELETE FROM STUDENT_TBL where studno ='4004';
--DELETE FROM STUDENT_TBL where studno ='4005';
--DELETE FROM SCORE_TBL where studno ='4004';
--DELETE FROM SCORE_TBL where studno ='4005';


/*--------------------------------------------------------------------------------*/
-- subjectToRetake.jsp 선생님꺼
--[방법-1] 'grade 테이블' 사용안함---------------------------------------------------------
-- 성적 우수자 : 90점 이상
-- SUM 이용
--[1]
select 
CASE when m_subject1 >= 90 then 1 else 0 END,
CASE when m_subject2 >= 90 then 1 else 0 END,
CASE when m_subject3 >= 90 then 1 else 0 END,
CASE when s_subject1 >= 90 then 1 else 0 END,
CASE when s_subject2 >= 90 then 1 else 0 END
from score_tbl;

--[2]
select 
sum(CASE when m_subject1 >= 90 then 1 else 0 END) as m_subject1,
sum(CASE when m_subject2 >= 90 then 1 else 0 END) as m_subject2,
sum(CASE when m_subject3 >= 90 then 1 else 0 END) as m_subject3,
sum(CASE when s_subject1 >= 90 then 1 else 0 END) as s_subject1,
sum(CASE when s_subject2 >= 90 then 1 else 0 END) as s_subject2
from score_tbl;

--[2-2]
select 
sum(CASE when m_subject1 >= 90 then 1  END) as m_subject1,
sum(CASE when m_subject2 >= 90 then 1  END) as m_subject2,
sum(CASE when m_subject3 >= 90 then 1  END) as m_subject3,
sum(CASE when s_subject1 >= 90 then 1  END) as s_subject1,
sum(CASE when s_subject2 >= 90 then 1  END) as s_subject2
from score_tbl;
 -- sum은 null을 자동으로 제외하기 때문에 모든 값이 null 인 경우를 제외하고는 else 0을 안써도 문제가 없긴하다.
 -- 그러나 모든 값이 null일 경우가 없는건 아니기 때문에 else 0을 반드시 넣어주고 사용한다. 

-- COUNT 이용 : 반드시 else 0을 제거(★★이유? count( 0, 1 ) -> 행수 2)
-- 'else 0 제거' 이유? SUM대신에 COUNT 이용하면 행의 수를 구하므로 잘못된결과(전부 9로 표시)
--[1]
select 
CASE when m_subject1 >= 90 then 1 else 0 END,
CASE when m_subject2 >= 90 then 1 else 0 END,
CASE when m_subject3 >= 90 then 1 else 0 END,
CASE when s_subject1 >= 90 then 1 else 0 END,
CASE when s_subject2 >= 90 then 1 else 0 END
from score_tbl;

--[2]  ★★주의 : 
select 
COUNT(CASE when m_subject1 >= 90 then 1  END) as m_subject1,
COUNT(CASE when m_subject2 >= 90 then 1  END) as m_subject2,
COUNT(CASE when m_subject3 >= 90 then 1  END) as m_subject3,
COUNT(CASE when s_subject1 >= 90 then 1  END) as s_subject1,
COUNT(CASE when s_subject2 >= 90 then 1  END) as s_subject2
from score_tbl;

-- 재수강 대상자 : 60점 미만 -----------------------------------------------------------
-- SUM 이용
--[1]
select 
CASE when m_subject1 < 60 then 1 else 0 END,
CASE when m_subject2 < 60 then 1 else 0 END,
CASE when m_subject3 < 60 then 1 else 0 END,
CASE when s_subject1 < 60 then 1 else 0 END,
CASE when s_subject2 < 60 then 1 else 0 END
from score_tbl;

--[2]
select 
sum(CASE when m_subject1 < 60 then 1 else 0 END) as m_subject1,
sum(CASE when m_subject2 < 60 then 1 else 0 END) as m_subject2,
sum(CASE when m_subject3 < 60 then 1 else 0 END) as m_subject3,
sum(CASE when s_subject1 < 60 then 1 else 0 END) as s_subject1,
sum(CASE when s_subject2 < 60 then 1 else 0 END) as s_subject2
from score_tbl;

--[2-2]
select 
sum(CASE when m_subject1 < 60 then 1  END) as m_subject1,
sum(CASE when m_subject2 < 60 then 1  END) as m_subject2,
sum(CASE when m_subject3 < 60 then 1  END) as m_subject3,
sum(CASE when s_subject1 < 60 then 1  END) as s_subject1,
sum(CASE when s_subject2 < 60 then 1  END) as s_subject2
from score_tbl;
 -- sum은 null을 자동으로 제외하기 때문에 모든 값이 null 인 경우를 제외하고는 else 0을 안써도 문제가 없긴하다.
 -- 그러나 모든 값이 null일 경우가 없는건 아니기 때문에 else 0을 반드시 넣어주고 사용한다. 

-- COUNT 이용 : 반드시 else 0을 제거(★★이유? count( 0, 1 ) -> 행수 2)
-- 'else 0 제거' 이유? SUM대신에 COUNT 이용하면 행의 수를 구하므로 잘못된결과(전부 9로 표시)
--[1]
select 
CASE when m_subject1 < 60 then 1 else 0 END,
CASE when m_subject2 < 60 then 1 else 0 END,
CASE when m_subject3 < 60 then 1 else 0 END,
CASE when s_subject1 < 60 then 1 else 0 END,
CASE when s_subject2 < 60 then 1 else 0 END
from score_tbl;

--[2]  ★★주의 : 
select 
COUNT(CASE when m_subject1 < 60 then 1  END) as m_subject1,
COUNT(CASE when m_subject2 < 60 then 1  END) as m_subject2,
COUNT(CASE when m_subject3 < 60 then 1  END) as m_subject3,
COUNT(CASE when s_subject1 < 60 then 1  END) as s_subject1,
COUNT(CASE when s_subject2 < 60 then 1  END) as s_subject2
from score_tbl;

/*--------------------------------------------------------------------------------*/
-- subjectToRetake.jsp 선생님꺼
--[방법-1] 'grade 테이블' 사용함 SQL로 처리---------------------------------------------------------

--1.COUNT() 사용
-- 성적 우수자 : 90점 이상 ( grade='A') , 재수강 대상자 : 60점 미만
--[1]
select * from grade_tbl where grade='A';

--[2]
--[2-1] NATURAL JOIN 이유? 같은 타입의 컬럼명이 없으면 그냥 CROSS JOIN 된다.
select *
from score_tbl natural join (select * from grade_tbl where grade='A'); --

--[2-2] CROSS JOIN 
select *
from score_tbl CROSS join (select * from grade_tbl where grade='A'); --

--[2-3] , ~ where
select *
from score_tbl , grade_tbl;  -- 10x5=50 -> cross join과 같은 결과

select *
from score_tbl , grade_tbl
WHERE grade ='A'; -- 조인이자 검색조건

--[2-4] join ~ on
select *
from score_tbl CROSS join grade_tbl;  -- 10x5=50

select *
from score_tbl join grade_tbl; -- 그냥 join에는 반드시 ON이 있어야 한다.

select *
from score_tbl join grade_tbl -- (1).여기서 cross join처럼 합쳐지고
on grade ='A'; -- 조인조건이자 검색조건으로 사용 --(2).그 다음 grade가 A인 것만 검색해서 보여줌
--테이블에 별칭 붙이는 이유? 같은 컬럼명이 두 테이블에 존재하기 때문에 구분위해 별칭 사용
-- 같은 컬럼명이 없는데 두 테이블을 조인하고 싶다면 그냥 검색 조건으로 사용해도 된다.


--[3]
select 
--COUNT(CASE when loscore<=m_subject1 and m_subject1<= hiscore then 1 END) as m_subject1, 
COUNT(CASE when m_subject1 between loscore and hiscore then 1 END) as m_subject1,
COUNT(CASE when m_subject2 between loscore and hiscore then 1 END) as m_subject2,
COUNT(CASE when m_subject3 between loscore and hiscore then 1 END) as m_subject3,
COUNT(CASE when s_subject1 between loscore and hiscore then 1 END) as s_subject1,
COUNT(CASE when s_subject2 between loscore and hiscore then 1 END) as s_subject2
from score_tbl natural join (select * from grade_tbl where grade='A');
-- from score_tbl CROSS join (select * from grade_tbl where grade='A'); 결과는 같다.

--재수강 대상자 : 60 미만
--[1]
select * from grade_tbl where grade='A';

--[2] NATURAL JOIN 이유? 같은 타입의 컬럼명이 없으면 그냥 CROSS JOIN 된다.
select *
from score_tbl natural join (select * from grade_tbl where grade='A'); --

--[3]
select 
--COUNT(CASE when loscore<=m_subject1 and m_subject1<= hiscore then 1 END) as m_subject1, 
COUNT(CASE when m_subject1 between loscore and hiscore then 1 END) as m_subject1,
COUNT(CASE when m_subject2 between loscore and hiscore then 1 END) as m_subject2,
COUNT(CASE when m_subject3 between loscore and hiscore then 1 END) as m_subject3,
COUNT(CASE when s_subject1 between loscore and hiscore then 1 END) as s_subject1,
COUNT(CASE when s_subject2 between loscore and hiscore then 1 END) as s_subject2
from score_tbl natural join (select * from grade_tbl where grade='F');


--[4] 성적 우수자 + 재수강 대상자 : 두 쿼리문 union
select '성적 우수자' as subject,
COUNT(CASE when m_subject1 between loscore and hiscore then 1 END) as m_subject1,
COUNT(CASE when m_subject2 between loscore and hiscore then 1 END) as m_subject2,
COUNT(CASE when m_subject3 between loscore and hiscore then 1 END) as m_subject3,
COUNT(CASE when s_subject1 between loscore and hiscore then 1 END) as s_subject1,
COUNT(CASE when s_subject2 between loscore and hiscore then 1 END) as s_subject2
from score_tbl natural join (select * from grade_tbl where grade='A')

UNION all

select '재수강 대상자' as subject,
COUNT(CASE when m_subject1 between loscore and hiscore then 1 END) as m_subject1,
COUNT(CASE when m_subject2 between loscore and hiscore then 1 END) as m_subject2,
COUNT(CASE when m_subject3 between loscore and hiscore then 1 END) as m_subject3,
COUNT(CASE when s_subject1 between loscore and hiscore then 1 END) as s_subject1,
COUNT(CASE when s_subject2 between loscore and hiscore then 1 END) as s_subject2
from score_tbl natural join (select * from grade_tbl where grade='F');

--[4-2] 성적 우수자 + 재수강 대상자 : 두 쿼리문 union
select '성적 우수자' as subject,
COUNT(CASE when m_subject1 between loscore and hiscore then 1 END) as m_subject1,
COUNT(CASE when m_subject2 between loscore and hiscore then 1 END) as m_subject2,
COUNT(CASE when m_subject3 between loscore and hiscore then 1 END) as m_subject3,
COUNT(CASE when s_subject1 between loscore and hiscore then 1 END) as s_subject1,
COUNT(CASE when s_subject2 between loscore and hiscore then 1 END) as s_subject2
from score_tbl join grade_tbl --  다른방법1: join 대신 ,
on grade='A' -- 다른방법1: on 대신 where

UNION all

select '재수강 대상자' as subject,
COUNT(CASE when m_subject1 between loscore and hiscore then 1 END) as m_subject1,
COUNT(CASE when m_subject2 between loscore and hiscore then 1 END) as m_subject2,
COUNT(CASE when m_subject3 between loscore and hiscore then 1 END) as m_subject3,
COUNT(CASE when s_subject1 between loscore and hiscore then 1 END) as s_subject1,
COUNT(CASE when s_subject2 between loscore and hiscore then 1 END) as s_subject2
from score_tbl join grade_tbl 
on grade='F';

--1.SUM() 사용 : SUM 결과로 null 나올 수 있으므로 null 처리해줘야함
--null 처리 방법 : else 0 추가 (1. count()와 다른점)
-- 성적 우수자 : 90점 이상 ( grade='A') , 재수강 대상자 : 60점 미만
--[1]
select * from grade_tbl where grade='A';

--[2] NATURAL JOIN 이유? 같은 타입의 컬럼명이 없으면 그냥 CROSS JOIN 된다.
select *
from score_tbl natural join (select * from grade_tbl where grade='A'); --

--[3]
select 
--SUM(CASE when loscore<=m_subject1 and m_subject1<= hiscore then 1 else 0  END) as m_subject1, 
SUM(CASE when m_subject1 between loscore and hiscore then 1 else 0  END) as m_subject1,
SUM(CASE when m_subject2 between loscore and hiscore then 1 else 0  END) as m_subject2,
SUM(CASE when m_subject3 between loscore and hiscore then 1 else 0  END) as m_subject3,
SUM(CASE when s_subject1 between loscore and hiscore then 1 else 0  END) as s_subject1,
SUM(CASE when s_subject2 between loscore and hiscore then 1 else 0  END) as s_subject2
from score_tbl natural join (select * from grade_tbl where grade='A');
-- from score_tbl CROSS join (select * from grade_tbl where grade='A'); 결과는 같다.

--재수강 대상자 : 60 미만
--[1]
select * from grade_tbl where grade='A';

--[2] NATURAL JOIN 이유? 같은 타입의 컬럼명이 없으면 그냥 CROSS JOIN 된다.
select *
from score_tbl natural join (select * from grade_tbl where grade='A'); --

--[3]
select 
--SUM(CASE when loscore<=m_subject1 and m_subject1<= hiscore then 1 else 0  END) as m_subject1, 
SUM(CASE when m_subject1 between loscore and hiscore then 1 else 0  END) as m_subject1,
SUM(CASE when m_subject2 between loscore and hiscore then 1 else 0  END) as m_subject2,
SUM(CASE when m_subject3 between loscore and hiscore then 1 else 0  END) as m_subject3,
SUM(CASE when s_subject1 between loscore and hiscore then 1 else 0  END) as s_subject1,
SUM(CASE when s_subject2 between loscore and hiscore then 1 else 0  END) as s_subject2
from score_tbl natural join (select * from grade_tbl where grade='F');


--[4] 성적 우수자 + 재수강 대상자 : 두 쿼리문 union
select '성적 우수자' as subject,
SUM(CASE when m_subject1 between loscore and hiscore then 1 else 0  END) as m_subject1,
SUM(CASE when m_subject2 between loscore and hiscore then 1 else 0  END) as m_subject2,
SUM(CASE when m_subject3 between loscore and hiscore then 1 else 0  END) as m_subject3,
SUM(CASE when s_subject1 between loscore and hiscore then 1 else 0  END) as s_subject1,
SUM(CASE when s_subject2 between loscore and hiscore then 1 else 0  END) as s_subject2
from score_tbl natural join (select * from grade_tbl where grade='A')

UNION all

select '재수강 대상자' as subject,
SUM(CASE when m_subject1 between loscore and hiscore then 1 else 0  END) as m_subject1,
SUM(CASE when m_subject2 between loscore and hiscore then 1 else 0  END) as m_subject2,
SUM(CASE when m_subject3 between loscore and hiscore then 1 else 0  END) as m_subject3,
SUM(CASE when s_subject1 between loscore and hiscore then 1 else 0  END) as s_subject1,
SUM(CASE when s_subject2 between loscore and hiscore then 1 else 0  END) as s_subject2
from score_tbl natural join (select * from grade_tbl where grade='F');


-- 0919[과제2]************************************************************************************************
-- subjectToRetake.jsp [방법-2] 'grade 테이블' 사용함 java로 처리---------------------------------------------------------
-- '성적 우수자', '재수강 대상자' 따로 or 함께 출력 원하는대로
-- java.sql.ResultSetMetaData 클래스 이용
-- 메타데이터란? 저장된 데이터 그 자체는 아니지만 해당 데이터에 대한 정보를 가지고 있는 데이터를 의미한다.
-- 즉, DB 내의 데이터에 대한 데이터의 소유, 데이터의 크기에 관련된 정보들이다.

--ResultSetMetaData는 SQL로 받아온 데이터의 정보를 조회/출력하는 용도로 사용된다.
--ResultSet 인터페이스 객체의 getMetaData()를 호출하여 ResultSetMetaData 인터페이스 객체를 얻으면
-- 해당 ResultSet과 관련된 메타 데이터를 얻을 수 있다.

--String sql = "select 필드명 from 테이블명";
--ResultSet rs = stmt.executeQuery(sql);
--ResultSetMetaData resultSetMetaData = rs.getMetaData();
--//ResultSetMetaData의 주요메서드를 통해 JAVA로 처리

--java의 ResultSetMetaData 사용 -- selectScore_MetaData2.jsp에 정리
--성적 우수자
select count(*)
from score_tbl join grade_tbl -- 비등가조인
ON(m_subject1 BETWEEN loscore and hiscore)
where grade='A';

select count(*)
from score_tbl join grade_tbl -- 비등가조인
ON(m_subject2 BETWEEN loscore and hiscore)
where grade='A'; -- s_subject2까지 모두 써야하는것을 java의 for문을 사용하여 처리하는것

--재수강 대상자
select count(*)
from score_tbl join grade_tbl -- 비등가조인
ON(m_subject1 BETWEEN loscore and hiscore)
where grade='F';
