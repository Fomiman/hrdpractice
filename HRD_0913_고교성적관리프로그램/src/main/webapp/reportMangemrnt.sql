--drop table examtbl_1;
--drop table examtbl_2;
--drop table examtbl_3;

--delete from examtbl_1 where sname='조용원';
--delete from examtbl_1 where sname is null;
-- delete from examtbl_3 where kor = '99';

-- 1. 학생 정보 테이블
create table EXAMTBL_1(
syear char(1) not null, -- 학년
sclass char(2) not null, -- 반
sno char(2) not null, -- 학생번호
sname varchar2(20), -- 학생이름
birth  char(8), -- 생년월일
gender char(1), -- 성별
tel1 char(3), -- 전화번호1
tel2 char(4), -- 전화번호2
tel3 char(4), -- 전화번호3

constraint exambl_1_multiple_PK primary key(syear, sclass, sno)
);
 

insert into EXAMTBL_1 values('1','01','01','김학생','20020101','F','010','1234','1001');
insert into EXAMTBL_1 values('1','01','02','이학생','20020201','M','010','1234','1002');
insert into EXAMTBL_1 values('1','01','03','박학생','20020301','M','010','1234','1003');
insert into EXAMTBL_1 values('1','02','01','조학생','20020401','M','010','1234','1004');
insert into EXAMTBL_1 values('1','02','02','유학생','20020501','M','010','1234','1005');
insert into EXAMTBL_1 values('1','02','03','여학생','20020601','M','010','1234','1006');
insert into EXAMTBL_1 values('1','03','01','남학생','20020701','F','010','1234','1007');
insert into EXAMTBL_1 values('1','03','02','황학생','20020801','F','010','1234','1008');
insert into EXAMTBL_1 values('1','03','03','전학생','20020901','F','010','1234','1009');


-- 2. 교사 정보 테이블
create table examtbl_2(
syear char(1) not null,
sclass char(2) not null,
tname varchar2(20),--교사명
primary key(syear,sclass)
);

insert into EXAMTBL_2 values('1','01','김교사');
insert into EXAMTBL_2 values('1','02','이교사');
insert into EXAMTBL_2 values('1','03','박교사');

-- 3. 점수 정보 테이블 
create table EXAMTBL_3(
syear char(1) not null,
sclass char(2) not null,
sno char(2) not null,
kor number(3) CHECK(kor between 0 and 100), -- 정수
eng number(3) CHECK(eng between 0 and 100), -- check() 조건을 사용하여 범위 외 값이 입력되면 오류
math number(3) CHECK(math between 0 and 100),
primary key(syear,sclass,sno)
);

-- number : 원래는 '' 안붙이지만 '' 붙여도 됨 (char:''반드시 붙여야됨)
insert into EXAMTBL_3 values('1','01','01','50','50','50');  
insert into EXAMTBL_3 values('1','01','02',60,40,100);
insert into EXAMTBL_3 values('1','01','03',70,70,70);
insert into EXAMTBL_3 values('1','02','01',80,80,80);
insert into EXAMTBL_3 values('1','02','02',50,50,50);
insert into EXAMTBL_3 values('1','02','03',40,90,80);
insert into EXAMTBL_3 values('1','03','01',80,60,90);
insert into EXAMTBL_3 values('1','03','02',90,80,70);
insert into EXAMTBL_3 values('1','03','03',70,70,70);


select * from EXAMTBL_1;
select * from EXAMTBL_2;
select * from EXAMTBL_3;

-- commit; 
-- 다른 프로그램에서 돌릴땐 저장 잘 해주기


--select.jsp
select syear||'-'||sclass||'-'||sno as id, sname, gender
from examtbl_1;

-- 조인을 해야되는데
select syear||'-'||sclass||'-'||sno as id , NVL(kor,0),NVL(eng,0),NVL(math,0)
from examtbl_3;

select  e1.syear||'-'||e1.sclass||'-'||e1.sno as id,
sname, decode(gender, 'M', '남','F','여'),
kor, eng, math,
(kor+ eng+ math) as totalscore,
round((kor+eng+math)/3,1) as avgScore

from examtbl_1 e1 full join examtbl_3 e3
on (e1.syear=e3.syear and e1.sclass = e3.sclass and e1.sno =e3.sno);

--총점합계,평균
select  sum(kor), sum(eng), sum(math),
round(avg(kor),1),round(avg(eng),1), round(avg(math),1)
from examtbl_3;


--select2.jsp --반별평균
select * from examtbl_2;
select * from examtbl_3;

--조인
select e3.syear,e3.sclass,tname, 
sum(kor) as sumKor,sum(eng) as sumEng,sum(math) as sumMath, 
round(avg(kor),1) as avgKor, 
round(avg(eng),1) as avgEng,
round(avg(math),1) as avgMath
from examtbl_2 e2 full join examtbl_3 e3
on (e2.syear=e3.syear and e2.sclass = e3.sclass)
group by e3.syear,e3.sclass, tname order by 2;


--update.jsp


------------------------------------------------------------------------------------------------------------------
-- select.jsp-[문제-1] 학생등록 후 성적등록 안하면 '성적조회 안되도록 함' , ※총점수합계, 총점수평균 따로
-- [방법-1] , where(중복 제거 안함 -> 별칭 사용 ) : syear(학년), slcass(반), sno(번호)로 조인
--[1]
select  e1.syear, e1.sclass, e1.sno, sname, gender, kor, eng, math
from examtbl_1 e1 , examtbl_3 e3
where (e1.syear=e3.syear and e1.sclass = e3.sclass and e1.sno =e3.sno);

--[2]
select  e1.syear||'-'||e1.sclass||'-'||e1.sno , sname, 
decode(gender, 'M', '남', 'F', '여') as decodeGender, 
kor, eng, math,
SUM(kor+eng+math) as totalSum,
round(SUM(kor+eng+math)/3, 1) as totalAvg
from examtbl_1 e1 , examtbl_3 e3
where (e1.syear=e3.syear and e1.sclass = e3.sclass and e1.sno =e3.sno)
GROUP BY  e1.syear, e1.sclass, e1.sno, sname, gender , kor, eng, math
order by e1.syear, e1.sclass, e1.sno;

--select.jsp : ※총점수 합계, 총점수 평균 따로
select sum(kor),sum(eng),sum(math),
round(avg(kor, 1)),round(avg(eng, 1)),round(avg(math, 1))
from examtbl_3;

-- [방법-2] natural join : 중복 제거함 -> 별칭 사용안함, 조인조건 필요없음
--[1]
select  syear, sclass, sno, sname, gender, kor, eng, math
from examtbl_1 natural join examtbl_3;

--[2]
select  syear, sclass, sno , sname, 
decode(gender, 'M', '남', 'F', '여') as decodeGender, 
kor, eng, math,
SUM(kor+eng+math) as totalSum,
round(SUM(kor+eng+math)/3, 1) as totalAvg
from examtbl_1 e1 natural join examtbl_3 e3
GROUP BY  syear, sclass, sno, sname, gender , kor, eng, math
order by syear, sclass, sno;

--select.jsp : ※총점수 합계, 총점수 평균 따로
select sum(kor),sum(eng),sum(math),
round(avg(kor, 1)),round(avg(eng, 1)),round(avg(math, 1))
from examtbl_3;

------------------------------------------------------------------------------------------------------------------
-- select.jsp-[문제-2] 학생등록 후 성적등록 안해도 '성적조회 되도록 함' , ※총점수합계, 총점수평균 따로
-- [방법-1] , where(중복 제거 안함 -> 별칭 사용 ) : syear(학년), slcass(반), sno(번호)로 조인
--[1]
select  e1.syear, e1.sclass, e1.sno, sname, gender, kor, eng, math
from examtbl_1 e1 , examtbl_3 e3
where (e1.syear=e3.syear and e1.sclass = e3.sclass and e1.sno =e3.sno);

--[2] (+) 이용 외부조인 : 빠르게 해결가능, left와 right만 가능 (*full 안됨)
select  e1.syear||'-'||e1.sclass||'-'||e1.sno , sname, 
decode(gender, 'M', '남', 'F', '여') as decodeGender, 
kor, eng, math,
SUM(kor+eng+math) as totalSum,
round(SUM(kor+eng+math)/3, 1) as totalAvg
from examtbl_1 e1 , examtbl_3 e3
where (e1.syear=e3.syear(+) and e1.sclass = e3.sclass(+) and e1.sno =e3.sno(+))
GROUP BY  e1.syear, e1.sclass, e1.sno, sname, gender , kor, eng, math
order by e1.syear, e1.sclass, e1.sno;

--[방법-2] LEFT OUTER JOIN~ON : 중복 제거 안함 => 별칭 필요 , 조인조건 필요
select  e1.syear||'-'||e1.sclass||'-'||e1.sno , sname, 
decode(gender, 'M', '남', 'F', '여') as decodeGender, 
kor, eng, math,
SUM(kor+eng+math) as totalSum,
round(SUM(kor+eng+math)/3, 1) as totalAvg
from examtbl_1 e1 LEFT OUTER JOIN examtbl_3 e3
ON (e1.syear=e3.syear and e1.sclass = e3.sclass and e1.sno =e3.sno)
GROUP BY  e1.syear, e1.sclass, e1.sno, sname, gender , kor, eng, math
order by e1.syear, e1.sclass, e1.sno;

--[방법-3] LEFT OUTER JOIN~USING : 중복 제거 => 별칭 필요X , 조인조건 필요
select  syear||'-'||sclass||'-'||sno as id , sname, 
decode(gender, 'M', '남', 'F', '여') as decodeGender, 
kor, eng, math,
SUM(kor+eng+math) as totalSum,
round(SUM(kor+eng+math)/3, 1) as totalAvg
from examtbl_1 LEFT OUTER JOIN examtbl_3
USING(syear, sclass, sno) -- 조인조건
GROUP BY  syear, sclass, sno, sname, gender , kor, eng, math
order by syear, sclass, sno;

------------------<!-- 여기까지는 [JAVA로 null 처리] -->-----------------------------

--------------------------- SQL로 null 처리 ---------------------------------
--[방법-3] LEFT OUTER JOIN~USING : 중복 제거 => 별칭 필요X , 조인조건 필요
-- SQL로 null 처리 : NVL() 함수 이용
select  syear||'-'||sclass||'-'||sno as id , sname, 
decode(gender, 'M', '남', 'F', '여') as decodeGender, 
NVL(kor,0) ,
NVL(eng,0) ,
NVL(math,0),
SUM(NVL(kor,0)+NVL(eng,0)+NVL(math,0)) as totalSum,
round(SUM(NVL(kor,0)+NVL(eng,0)+NVL(math,0))/3, 1) as totalAvg
from examtbl_1 LEFT OUTER JOIN examtbl_3
USING(syear, sclass, sno) -- 조인조건
GROUP BY  syear, sclass, sno, sname, gender , kor, eng, math
order by syear, sclass, sno;


------------------------------------------------------------------------------------------------------------------
--선생님 select2.jsp : syear, sclass 로 
select syear,sclass,tname, 
sum(kor) as sumKor,sum(eng) as sumEng,sum(math) as sumMath, 
round(avg(kor),1) as avgKor, 
round(avg(eng),1) as avgEng,
round(avg(math),1) as avgMath
from examtbl_2 natural join examtbl_3
group by syear,sclass, tname order by 1, 2;

--select * from examtbl_3;

-- ※ AVG()함수는 null값을 제외하고 연산한다.
--null값을 포함하여 계산해야 할때는 NVL()함수를 사용하여 값을 구한다.
select syear,sclass,tname, 
sum(NVL(kor,0)) as sumKor,sum(NVL(eng,0)) as sumEng,sum(NVL(math,0)) as sumMath, 
round(avg(NVL(kor,0)),1) as avgKor, 
round(avg(NVL(eng,0)),1) as avgEng,
round(avg(NVL(math,0)),1) as avgMath
from examtbl_2 natural join examtbl_3
group by syear,sclass, tname order by 1, 2;


--
select syear, sclass, tname,
round(avg(NVL(kor,0)),1) as avgKor, 
round(avg(NVL(eng,0)),1) as avgEng,
round(avg(NVL(math,0)),1) as avgMath
from(

select  syear, sclass, 
NVL(kor,0) as kor ,NVL(eng,0) as eng ,NVL(math,0) as math
from examtbl_1 e1 full join examtbl_3 e3
using(syear, sclass, sno)

) full outer join examtbl_2
using(syear, sclass)
group by (syear, sclass, tname);

select  syear, sclass, decode(gender, 'M', '남','F','여'),
NVL(kor,0) as kor ,NVL(eng,0) as eng ,NVL(math,0) as math,
(kor+ eng+ math) as totalscore,
round((kor+eng+math)/3,1) as avgScore
from examtbl_1 e1 full join examtbl_3 e3
using(syear, sclass, sno);

select  syear, sclass, 
NVL(kor,0) as kor ,NVL(eng,0) as eng ,NVL(math,0) as math
from examtbl_1 e1 full join examtbl_3 e3
using(syear, sclass, sno);

/*********************************************************************/
--select [문제-1] NVL(kor,' '), --오류 해결

select  e1.syear||'-'||e1.sclass||'-'||e1.sno as id, sname, 
decode(gender, 'M', '남', 'F', '여') as decodeGender, 
NVL(kor,0), NVL(eng,0), NVL(math,0),
SUM(NVL(kor,0)+NVL(eng,0)+NVL(math,0)) as totalSum,
round(SUM(NVL(kor,0)+NVL(eng,0)+NVL(math,0))/3, 1) as totalAvg 
from examtbl_1 e1 , examtbl_3 e3
where (e1.syear=e3.syear(+) and e1.sclass = e3.sclass(+) and e1.sno =e3.sno(+))
GROUP BY  e1.syear, e1.sclass, e1.sno, sname, gender , kor, eng, math
order by e1.syear, e1.sclass, e1.sno;

select  e1.syear||'-'||e1.sclass||'-'||e1.sno as id, sname, 
decode(gender, 'M', '남', 'F', '여') as decodeGender, 
NVL(to_char(kor),' '), 
NVL(to_char(eng),' '), 
NVL(to_char(math),' '),
SUM(NVL(kor,0)+NVL(eng,0)+NVL(math,0)) as totalSum,
round(SUM(NVL(kor,0)+NVL(eng,0)+NVL(math,0))/3, 1) as totalAvg 
from examtbl_1 e1 , examtbl_3 e3
where (e1.syear=e3.syear(+) and e1.sclass = e3.sclass(+) and e1.sno =e3.sno(+))
GROUP BY  e1.syear, e1.sclass, e1.sno, sname, gender , kor, eng, math
order by e1.syear, e1.sclass, e1.sno;

/*********************************************************************/
--select [문제-2] 학생등록 후 성적등록 안해도 '성적조회되도록 함' -- 총점수 합계 평균 같이
-- union은 컬럼수와 타입이 같아야한다.
-- order by 는 가장 마지막에
select  syear||'-'||sclass||'-'||sno as id , sname, 
decode(gender, 'M', '남', 'F', '여') as decodeGender, 
kor, eng, math,
SUM(kor+eng+math) as totalSum,
round(SUM(kor+eng+math)/3, 1) as totalAvg
from examtbl_1 left OUTER JOIN examtbl_3
USING(syear, sclass, sno) -- 조인조건
GROUP BY  syear, sclass, sno, sname, gender , kor, eng, math
--order by syear, sclass, sno

UNION

select  -- "총점수합계" : SQL에서는 아래에 ""큰따옴표 사용하면 오류
null, null, '총점수합계',sum(kor), sum(eng), sum(math), null, null
from examtbl_3

UNION

select  -- "총점수평균" 
null, null, '총점수평균', round(avg(kor),1),round(avg(eng),1), round(avg(math),1), null, null
from examtbl_3;




/*********************************************************************/
--select [문제-3] 
-- (학생등록 후 성적등록 안하거나 성적등록 후 학생등록 안해도) 둘 중 하나가 등록 안되어 있어도 '성적조회되도록 함' 
-- 총점수 합계 평균 따로
select  syear||'-'||sclass||'-'||sno as id , sname, 
decode(gender, 'M', '남', 'F', '여') as decodeGender, 
NVL(to_char(kor),' '), 
NVL(to_char(eng),' '), 
NVL(to_char(math),' '),
SUM(kor+eng+math) as totalSum,
round(SUM(kor+eng+math)/3, 1) as totalAvg
from examtbl_1 full OUTER JOIN examtbl_3
USING(syear, sclass, sno) -- 조인조건
GROUP BY  syear, sclass, sno, sname, gender , kor, eng, math
order by syear, sclass, sno;

--select.jsp : ※총점수 합계, 총점수 평균 따로
select sum(kor),sum(eng),sum(math),
round(avg(kor, 1)),round(avg(eng, 1)),round(avg(math, 1))
from examtbl_3;


-- [과제-5]
--[1]
select syear, sclass, sno, sname , kor , eng, math
from EXAMTBL_1 full outer join EXAMTBL_3 -- 학생정보 테이블과 성적정보 테이블
using(syear, sclass, sno) -- 조인조건 : using = 중복제거
order by 1 asc, 2 asc;

--[2]
select syear, sclass, tname,
sum(kor),sum(eng),sum(math),
round(avg(kor),1),round(avg(eng),1), round(avg(math),1)
from (	select syear, sclass, sno, sname , nvl(kor,0) as kor ,  nvl(eng,0) as eng, nvl(math,0) as math 
		from EXAMTBL_1 full outer join EXAMTBL_3 -- 학생정보 테이블과 성적정보 테이블
		using(syear, sclass, sno) -- 조인조건 : using = 중복제거
		order by 1 asc, 2 asc, sno asc)	left outer join EXAMTBL_2 --반정보
USING(syear, sclass) -- 조인조건
group by syear, sclass, tname
order by syear asc, sclass asc;

--delete from EXAMTBL_3 where sno in('04','05');