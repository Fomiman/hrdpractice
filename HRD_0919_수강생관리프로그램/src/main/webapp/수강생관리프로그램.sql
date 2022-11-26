--drop table STUDENT_TBL_01;
--drop table SUBJECT_TBL_01;
--drop table REGISTER_TBL_01;

--UNIQUE : 중복 X -> 유일한 값=고유한 값 -> 고유키(임시적 index 자동생성)
--			null('')값을 허용 동일한 값이 저장되는 것만 허용하지 않음
--			(동일한 값 저장시 '무결성 제약조건'에 위배 되어 저장안됨)
-- 1. 수강생정보 테이블
CREATE table STUDENT_TBL_01(
student_no number primary key, -- 1.수강생번호
student_name varchar2(20) not null, -- 2.이름
student_addr varchar2(100), -- 3.주소
student_phone varchar2(14), -- 4.연락처
student_birth date, -- 5.생년월일
student_email varchar2(50), -- 6.메일주소
student_id varchar2(12) unique, -- 7.아이디
student_pw varchar2(50) -- 8.비밀번호
);

-- insert sample
insert into STUDENT_TBL_01 values(201801, '이기자','경산시 진량읍','011222333','2001/09/26','abc@naver.com','','');
insert into STUDENT_TBL_01 values(201802, '김을동','대구시 수성구 수성1가','011444555','1997/05/19','asd@chol.net','','');
insert into STUDENT_TBL_01 values(201803, '김희선','제주도 제주시 외나무골','054111222','2002/09/06','qwe@gmail.com','','');



-- 2. 과목정보 테이블
create table subject_tbl_01(
subject_seq varchar2(10) primary key, -- 1. 과목번호
subject_startdate date, -- 2. 시작일자
subject_enddate date, -- 3. 종료일자
subject_name varchar2(50), -- 4. 과목명
subject_desc clob, -- 5. 과목내용
subject_teacher varchar2(12) -- 6. 강사ID
);

-- insert sample
insert into SUBJECT_TBL_01 values('C001','2018/09/01','2018/09/21','자바프로그래밍','','P04');
insert into SUBJECT_TBL_01 values('C002','2018/09/05','2018/09/26','안드로이드프로그래밍','','P02');
insert into SUBJECT_TBL_01 values('D001','2018/10/01','2018/10/21','HTML/CSS','','P04');
insert into SUBJECT_TBL_01 values('D002','2018/10/01','2018/10/10','운영체제','','P02');


-- 3. 수강신청정보 테이블
create table REGISTER_TBL_01(
register_seq number primary key, -- 1. 수강신청번호
student_no number, -- 2. 수강생번호
subject_seq varchar2(10), -- 3. 과목번호
register_date date, -- 4. 신청일자
register_status char(1) -- 5. 이수여부
);

--create sequence REGISTER_SEQ
--start with 1
--increment by1
--minvalue 1;

--insert sample
insert into REGISTER_TBL_01 values('1','201801','C001','2018/08/30','0');
insert into REGISTER_TBL_01 values('2','201802','C001','2018/08/30','0');
insert into REGISTER_TBL_01 values('3','201801','D001','2018/09/02','1');
insert into REGISTER_TBL_01 values('4','201803','D001','2018/09/02','2');
insert into REGISTER_TBL_01 values('5','201803','D002','2018/09/03','1');


-- insertStudent.jsp
select nvl(max(student_no),0)+1 from STUDENT_TBL_01;

--inquireStudent.jsp
select student_no, student_name, student_phone, to_char(student_birth, 'yyyy/mm/dd') as student_birth, student_email
from STUDENT_TBL_01 natural join register_tbl_01

order by 2;

 select student_no, student_name, student_phone, 
to_char(student_birth, 'yyyy/mm/dd') as student_birth, 
student_email,student_id,student_pw,
 sum(case when register_status is not null then 1 end)
 from STUDENT_TBL_01 full outer join register_tbl_01
 using(student_no)
 group by student_no, student_name, student_phone, student_birth, student_email,student_id,student_pw order by 2;

--delete from STUDENT_TBL_01 where STUDENT_NAME = '조용원';
--delete from STUDENT_TBL_01 where STUDENT_NAME = '조용투';

----------------------------------------------------------
select sum(case when register_status = 0 then 1 end)
from STUDENT_TBL_01 natural join register_tbl_01;

select student_no, student_name, student_phone, 
to_char(student_birth, 'yyyy/mm/dd') as student_birth, student_email,
sum(case when register_status is not null then 1 end) as total_register_num
from STUDENT_TBL_01 natural join register_tbl_01
group by student_no, student_name, student_phone, student_birth, student_email 
order by 2;


--insertRegister.jsp
--과목 정보와 날짜넣기
select * from STUDENT_TBL_01;
select * from SUBJECT_TBL_01;
select * from REGISTER_TBL_01;

--delete from REGISTER_TBL_01 where REGISTER_SEQ=6;

select count(subject_name) from SUBJECT_TBL_01;

select to_char(sysdate, 'yyyy-mm-dd'), subject_name from SUBJECT_TBL_01;

select nvl(max(register_seq),0)+1 from REGISTER_TBL_01

--updateStudent.jsp
select student_no , student_name , student_addr , student_phone , 
to_char(student_birth, 'yyyy/mm/dd') ,
student_email , student_id , student_pw 
from student_tbl_01;


--inquireClass.jsp
--1.월별 신청 현황
select to_char(register_date, 'yyyy/mm') , count(register_date) 
from REGISTER_TBL_01
group by to_char(register_date, 'yyyy/mm');

--2.수강신청정보조회
--1수강신청번호(수강신청테이블), 2수강생{(수강생번호)수강생이름,(수강생테이블,수강신청테이블), 3과목명(과목테이블), 4신청일자, 5이수여부
--테이블 1,3 먼저 join해서 수강생{}부터 만들어줌
select REGISTER_SEQ, '('||STUDENT_NO||')'||STUDENT_NAME as STUDENT, REGISTER_DATE, REGISTER_STATUS , SUBJECT_SEQ --SUBJECT_SEQ는 테이블2와 조인용으로 써준다.
from STUDENT_TBL_01 full outer join REGISTER_TBL_01
using(student_no);

--테이블 2와 조인해서
select REGISTER_SEQ, STUDENT, SUBJECT_NAME, REGISTER_DATE, 
decode(REGISTER_STATUS, '0','신청','1','완료','2','취소','이수여부 값이 잘못입력되었습니다.' ) as REGISTER_STATUS
from SUBJECT_TBL_01 join (select REGISTER_SEQ, 
							'('||STUDENT_NO||') '||STUDENT_NAME as STUDENT, 
							REGISTER_DATE, REGISTER_STATUS , 
							SUBJECT_SEQ --SUBJECT_SEQ는 테이블2와 조인용으로 써준다.
							from STUDENT_TBL_01 full outer join REGISTER_TBL_01
							using(student_no))
using(SUBJECT_SEQ) order by REGISTER_SEQ desc;

