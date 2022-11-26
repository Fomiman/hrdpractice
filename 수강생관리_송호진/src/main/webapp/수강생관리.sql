--수강생관리 프로그램 SQL
--[1]수강생정보 명세서
--UNIQUE : 중복X -> 유일한 값=고유한 값 -> 고유키(암시적 index 자동 생성)
--			null('')값을 허용 동일한 값이 저장되는 것만은 허용하지 않음
--			(동일한 값 저장시 '무결성 제약조건'에 위배되어 저장안됨)
create table student_tbl_01 (
	student_no number primary key,	--수강생번호
	student_name varchar2(20) not null,
	student_addr varchar2(100),
	student_phone varchar2(14),
	student_birth date,
	student_email varchar2(50),
	student_id varchar2(12) unique,
	student_pw varchar2(50)
);

--수강생정보 샘플데이터 삽입
insert into student_tbl_01 values(201801, '이기자', '경산지 진량읍', '011222333', '01/09/26', 'abc@naver.com', null, null);
insert into student_tbl_01 values(201802, '김을동', '대구시 수성구 수성1가', '010444555', '97/05/19', 'asd@chol.net', null, null);
insert into student_tbl_01 values(201803, '김희선', '제주도 제주시 외나무골', '054111222', '02/09/06', 'qwe@gmail.com', null, null);

--주의: DML 명령어(update, insert, delete) 실행 후 commit을 습관적으로 해두는 것을 권장!
--Run SQL Command Line이나 SQL Developer와 같은 일부 프로그램에서는 수동으로 커밋해줘야 함.
commit;

--데이터 점검
select * from student_tbl_01;

--[2]과목정보 명세서
create table subject_tbl_01 (
	subject_seq varchar2(10) primary key,
	subject_startdate date,
	subject_enddate date,
	subject_name varchar2(50),
	subject_desc clob,
	subject_teacher varchar2(12)
);

--과목정보 샘플데이터 삽입
insert into subject_tbl_01 values('C001', '18/09/01', '18/09/21', '자바프로그래밍', null, 'p04');
insert into subject_tbl_01 values('C002', '18/09/05', '18/09/26', '안드로이드프로그래밍', null, 'p02');
insert into subject_tbl_01 values('D001', '18/10/01', '18/10/21', 'HTML/CSS', null, 'p04');
insert into subject_tbl_01 values('D002', '18/10/01', '18/10/10', '운영체제', null, 'p02');

--주의: DML 명령어(update, insert, delete) 실행 후 commit을 습관적으로 해두는 것을 권장!
commit;

--[3]수강신청정보 명세서
drop table register_tbl_01;
create table register_tbl_01 (
	register_seq number primary key,
	student_no number,
	subject_seq varchar2(10),
	register_date date,
	register_status char(1) default 0 CHECK(register_status in (0,1,2))
); 



--수강신청정보 샘플데이터 삽입
insert into register_tbl_01 values(1, 201801, 'C001', '18/08/30', '0');
insert into register_tbl_01 values(2, 201802, 'C001', '18/08/30', '0');
insert into register_tbl_01 values(3, 201801, 'D001', '18/09/02', '1');
insert into register_tbl_01 values(4, 201803, 'D001', '18/09/02', '2');
insert into register_tbl_01 values(5, 201803, 'D002', '18/09/03', '1');

--주의: DML 명령어(update, insert, delete) 실행 후 commit을 습관적으로 해두는 것을 권장!
commit;

--insertStudent.jsp (수강생등록페이지)
select MAX(NVL(student_no, 201800)) + 1 from student_tbl_01;

--selectStudent.jsp (수강생조회/수정)
select student_no, student_name, student_phone, to_char(student_birth, 'yyyy/mm/dd'),
student_email, student_id, student_pw, regSubject
from student_tbl_01 LEFT OUTER JOIN (select student_no, count(student_no) as regSubject
						  from register_tbl_01
						  group by student_no)
USING(student_no)
order by regSubject asc;

--update.jsp (수강생 수정)
select student_name, student_addr, student_phone,
to_char(student_birth, 'yymmdd') as student_birth, student_email, student_id, student_pw
from STUDENT_TBL_01;
where student_no = ?;

--insertRegister.jsp(수강신청)
select MAX(NVL(register_seq, 0)) + 1 from register_tbl_01;

select subject_seq, subject_name
from subject_tbl_01;

--등록된 수강생 번호만 입력할 수 있도록 제한★
select student_no from student_tbl_01;

--selectRegister.jsp (수강신청 조회)---
--1.월별신청현황-----
--[1]
select register_date, count(*) as register_cnt
from (select to_char(register_date, 'yyyy/mm') as register_date
from register_tbl_01)
group by register_date;

--[2]
select to_char(register_date, 'yyyy/mm') as register_date, count(*) as register_cnt
from register_tbl_01
-- group by register_date -- '년월일' 전부를 하나의 그룹으로 (※주의)=> 결과가 달라짐
group by to_char(register_date, 'yyyy/mm') -- '년월'만 하나의 그룹으로
order by 1 asc;

--2.수강신청정보조회----
--수강신청정보테이블 + 수강생정보테이블 + 과목정보테이블 활용
select register_seq, student_no, subject_seq, register_date, register_status
from register_tbl_01;

select student_no, student_name
from student_tbl_01;

select subject_seq, subject_name
from subject_tbl_01;


--[1] 조인?
select register_seq, student_no, subject_seq, register_date, register_status
from register_tbl_01 JOIN (select student_no, student_name
from student_tbl_01)
USING(student_no);

--최종 조인 결과물
select register_seq, student_no, student_name, subject_seq, subject_name, register_date, register_status
from subject_tbl_01 JOIN (select register_seq, student_no, student_name, subject_seq, register_date, register_status
						from register_tbl_01 JOIN (select student_no, student_name
						from student_tbl_01)
						USING(student_no))
USING(subject_seq)
order by register_seq desc;

--최종 : SQL에서 student_no , student_name 연결
select register_seq, '(' || student_no || ') ' || student_name, subject_seq, subject_name, register_date, register_status
from subject_tbl_01 JOIN (select register_seq, student_no, student_name, subject_seq, register_date, register_status
						from register_tbl_01 JOIN (select student_no, student_name
						from student_tbl_01)
						USING(student_no))
USING(subject_seq)
order by register_seq desc;

--2. 수강신청정보조회-[방법-2] NATURAL JOIN 이용: register_status의 0,1,2rkqtdmf =>SQL값으로 처리("신청","완료","취소")
--DECODE 이용
--[1]
select * 
from student_tbl_01 natural join register_tbl_01 ; --수강생번호(student_no)로 자연조인

--[2]
select register_seq, student_no, student_name,  register_date, --"과목명" 추가해야됨,
decode(REGISTER_STATUS, '0','신청','1','완료','2','취소','이수여부 값이 잘못입력되었습니다.' ) as REGISTER_STATUS
from student_tbl_01 natural join register_tbl_01 ;

--[3] 과목명 추가 위해 과목정보 테이블과 조인
select register_seq, student_no, student_name, subject_name ,register_date, --"과목명" 추가해야됨,
decode(REGISTER_STATUS, '0','신청','1','완료','2','취소','이수여부 값이 잘못입력되었습니다.' ) as REGISTER_STATUS
from student_tbl_01 natural join register_tbl_01 --수강생번호(student_no)로 자연조인
					natural join subject_tbl_01 --조인된 결과 테이블과 자연조인(과목번호로 자연조인)
order by 1 desc;

--[4] 최종 : student_no와 student_name 연결
select register_seq, '('||STUDENT_NO||') '||STUDENT_NAME as STUDENT, subject_name ,register_date, --"과목명" 추가해야됨,
decode(REGISTER_STATUS, '0','신청','1','완료','2','취소','이수여부 값이 잘못입력되었습니다.' ) as REGISTER_STATUS
from student_tbl_01 natural join register_tbl_01 --수강생번호(student_no)로 자연조인
					natural join subject_tbl_01 --조인된 결과 테이블과 자연조인(과목번호로 자연조인)
order by 1 desc;


--2. 수강신청정보조회-[방법-3] register_status의 0,1,2rkqtdmf =>SQL값으로 처리("신청","완료","취소")
--case ~ end 이용
select register_seq, '('||STUDENT_NO||') '||STUDENT_NAME as STUDENT, subject_name ,register_date, --"과목명" 추가해야됨,
--decode(REGISTER_STATUS, '0','신청','1','완료','2','취소','이수여부 값이 잘못입력되었습니다.' ) as REGISTER_STATUS
CASE REGISTER_STATUS
when '0' then '신청' -- ,콤마 찍지않는다.
when '1' then '완료'
when '2' then '취소'
END as REGISTER_STATUS
from student_tbl_01 natural join register_tbl_01 --수강생번호(student_no)로 자연조인
					natural join subject_tbl_01 --조인된 결과 테이블과 자연조인(과목번호로 자연조인)
order by 1 desc;

--2. 수강신청정보조회-[방법-4] JOIN ~ USING() 이용: register_status의 0,1,2rkqtdmf =>SQL값으로 처리("신청","완료","취소")
--case ~ end 이용
select register_seq, '('||STUDENT_NO||') '||STUDENT_NAME as STUDENT, subject_name ,register_date, --"과목명" 추가해야됨,
decode(REGISTER_STATUS, '0','신청','1','완료','2','취소','이수여부 값이 잘못입력되었습니다.' ) as REGISTER_STATUS
from student_tbl_01  join register_tbl_01 USING(STUDENT_NO)--수강생번호(student_no)로 조인
					 join subject_tbl_01 USING(subject_seq)--조인된 결과 테이블과 과목번호로 조인
order by 1 desc;

/* 세개 이상의 조인을 할때 이렇게 서브쿼리 없이 연속적으로 조인이 가능하다. */

----------------------------------------------------------------------------------------------------

--★★ REGEXP_SUBSTR('문자열','[^구분자]+',시작인덱스,가져올 순번,'i')
--String의 split("구분자")와 비슷한 (예)String.split("@") 리턴타입 String[]
-- i : 구분자가 문자일때 대소문자를 구분할 필요가 없다면 'i' 옵션 사용을 지정, 대소문자 구분 필요시 생략

select REGEXP_SUBSTR('A|B|C|D|E','[^|]+','1','3','i') from dual;

select REGEXP_SUBSTR('A@B@C@D@E','[^@]+','1','1') from dual; -- A
select REGEXP_SUBSTR('A@B@C@D@E','[^@]+','1','2') from dual; -- B
select REGEXP_SUBSTR('A@B@C@D@E','[^@]+','1','3') from dual; -- C

-- i : "구분자" 대소문자로 구분하지 않으려면(구분자 : B 또는 b 로 뒀을 때)
select REGEXP_SUBSTR('!B@b#','[^B]+','1','1','i') from dual; 
select REGEXP_SUBSTR('!B@b#','[^B]+','1','2','i') from dual; 
select REGEXP_SUBSTR('!B@b#','[^B]+','1','3','i') from dual; 

select REGEXP_SUBSTR('!B@b#','[^B]+','1','2') from dual; 


--update2.jsp
-- 이외는 null값 처리 해줘야함 : nvl() 이용
select student_no,
NVL(student_addr, ' '),-- ''은 null임
to_char(student_birth, 'yymmdd') as student_birth,

nvl(REGEXP_SUBSTR(student_email, '[^@]+',1,1),' ') as student_email_id,
nvl(REGEXP_SUBSTR(student_email, '[^@]+',1,2),'naver.com') as student_email_server,

student_id,
student_pw
from student_tbl_01
where student_no = 201803;


-- [방법-2] SUBSTR()+INSTR()
--SQL의 INDEX는 1부터 시작한다. (※ JAVA는 0부터 시작)

--1. SUBSTR() == JAVA의 String의 substring("문자열",시작index,끝index+1)과 비슷
--함수 SUBSTR('문자열',시작위치,길이) 시작위치~길이만큼 자른다.
--함수 SUBSTR('문자열',시작위치) 시작위치~끝까지 자른다.

--2. INSTR() == JAVA의 String의 indexOf("java","va")의 결과로 '위치인 index번호 2'를 리턴
--	 INSTR('문자열','검색할 문자', 시작지점, n번째검색단어) 함수는 찾는 문자의 위치를 반환
--	 찾는 문자가 없으면 0을 반환함(java는 -1을 반환)
-- 	 찾는 단어의 앞글자의 index번호를 반환
--	 기본으로 왼쪽부터 시작하여 우측방향으로 스캔함
--	 시작지점에 음수를 쓸경우 우측에서 시작하기 때문에 스캔방향이 좌측방향임

select student_no,
NVL(student_addr, ' ') as student_addr,-- ''은 null임
student_phone,
to_char(student_birth, 'yymmdd') as student_birth,

nvl(SUBSTR(student_email, 1, INSTR(student_email,'@', 1)-1), ' ') as student_email_id,
nvl(SUBSTR(student_email, INSTR(student_email,'@', 1)+1),'naver.com') as student_email_server,

student_id,
student_pw
from student_tbl_01
where student_no = 201803;





