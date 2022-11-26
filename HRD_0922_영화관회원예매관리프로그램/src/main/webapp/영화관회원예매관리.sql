
--1. 회원정보 테이블
create table movie_1(
me_id varchar2(12) primary key, -- 1. 회원아이디
me_pass varchar2(15) not null, -- 2. 회원비밀번호
me_name varchar2(20) not null, -- 3. 회원이름
gender char(1),  -- 4. 성별
birth date, -- 5.생년월일
address varchar2(100), -- 6. 주소
tel varchar2(13) -- 7. 전화번호
);

--1-1.데이터 입력
insert into movie_1 values('kus1','sin1','김유신','M','2004-02-29','경북 경산시 중방동',	'010-1111-2222');
insert into movie_1 values('sgj2','joo2','신경주','M','2002-06-18','대구시 수성구 만촌동',	'010-2222-1111');
insert into movie_1 values('ymg3','me3','양미경','F','2000-01-01','경북 경산시 남천면',	'010-3333-4444');
insert into movie_1 values('kjs4','soo4','김지수','F','2005-11-22','경북 경산시 진량읍',	'010-4444-3333');
insert into movie_1 values('jsw5','jang5','장선우','M','1999-12-31','대구시 수성구 사월동',	'010-5555-6666');
insert into movie_1 values('gig6','go6','고인규','M','2002-06-24','경북 영천시 금호읍',	'010-6666-5555');
insert into movie_1 values('bsy7','year7','박시연','F','2008-08-28','경북 경산시 와촌읍',	'010-7777-9999');

--2. 영화예매 정보 테이블 생성
create table movie_2 (
me_id varchar2(12) not null, -- 1. 회원아이디
me_pass varchar2(15) not null, -- 2. 회원비밀번호
mo_name varchar2(50) not null, -- 3. 영화제목
rm_date date not null -- 4. 예매일시
);

--2-1.데이터 입력
insert into movie_2 values('kus1','sin1','겨울왕국2','2019-11-25');
insert into movie_2 values('kus1','sin1','늑대아이','2019-09-20');
insert into movie_2 values('sgj2','joo2','겨울왕국2','2019-11-24');
insert into movie_2 values('ymg3','me3','김복동','2019-08-15');
insert into movie_2 values('ymg3','me3','썸머 워즈','2019-08-22');
insert into movie_2 values('kjs4','soo4','겨울왕국2','2019-11-28');
insert into movie_2 values('jsw5','jang5','김복동','2019-08-14');
insert into movie_2 values('gig6','go6','늑대아이','2019-09-20');
insert into movie_2 values('bsy7','year7','늑대아이','2019-09-20');
insert into movie_2 values('bsy7','year7','시간을 달리는 소녀','2019-01-20');


-- 3. 영화정보 테이블
create table movie_3 (
mo_no number, -- 1. 영화번호
mo_name varchar2(50), -- 2. 영화제목
mo_poster varchar2(20), -- 3. 포스터
mo_limit varchar2(20) not null, -- 4. 시청등급
mo_date date, -- 5. 개봉일
mo_memo varchar2(100), -- 6. 영화소개

constraint movie_3_multie_PK primary key(mo_no, mo_name)
);

-- 3-1. 데이터 입력
insert into movie_3 values('1','겨울왕국2',	'겨울왕국.jsp',	'전체 관람가',		'2019-11-21','애니메이션 겨울왕국 2탄');
insert into movie_3 values('2','늑대아이',	'늑대아이.jsp',	'전체 관람가',		'2019-09-13','애니메이션 늑대아이');
insert into movie_3 values('3','김복동',		'김복동.jsp',		'12세 관람가',		'2019-08-08','위안부 피해자 고 김복동 할머니를 취재한 다큐멘터리');
insert into movie_3 values('4','시간을 달리는 소녀','시달소.jsp',	'전체 관람가',		'2019-01-14','애니메이션 시간을 달리는 소녀');
insert into movie_3 values('5','썸머 워즈',	'썸머워즈.jsp',	'전체 관람가',		'2019-08-13','애니메이션 썸머 워즈');
insert into movie_3 values('6','눈의 여왕4',	'눈여왕.jsp',		'전체 관람가',		'2019-12-24','애니메이션 눈의 여왕 4탄');

select * from MOVIE_1;
select * from MOVIE_2;
select * from MOVIE_3;



--ticketing.jsp
select mo_name, to_char(rm_date,'yyyy-mm-dd') as rm_date	
from MOVIE_2 join movie_3 using(mo_name);

select to_char(sysdate,'yyyy-mm-dd') from dual;

--ticketingPro.jsp
-- 아이디,비밀번호, 영화제목, 예매일시

select me_id, me_pass, count(me_id) from movie_1;
-- id와 pass 불러오고 반복횟수 정하는 용도로 count() 사용함


--inquireMember.jsp
--회원아이디, 회원이름, 영화제목, 시청등급, 예매횟수
--[1] 영화정보를 먼저 하나로 합친다 2,3 테이블 조인
select  ME_ID, MO_NAME, MO_LIMIT , count(*)--예매횟수 --추가 할거 : 회원이름,
from MOVIE_2 natural join MOVIE_3 
group by ME_ID, MO_NAME, MO_LIMIT;

--예매횟수 추가
insert into movie_2 values('kus1','sin1','겨울왕국2','2019-11-25');
insert into movie_2 values('kus1','sin1','겨울왕국2','2019-11-25');
insert into movie_2 values('gig6','go6','시간을 달리는 소녀','2019-09-20');

--[2] movie_1과 조인해서 회원이름 추가
select  ME_ID, me_name, MO_NAME, MO_LIMIT , count(*)--예매횟수 --추가 할거 : 회원이름,
from MOVIE_2 natural join MOVIE_3 
				natural join MOVIE_1
group by ME_ID, me_name,MO_NAME, MO_LIMIT
order by me_name;

--inquireMovie.jsp
-- 위의 결과를 이용해서 영화제목, 시청등급, 예매횟수만 사용
select  MO_NAME, MO_LIMIT , count(*)
from MOVIE_2 natural join MOVIE_3 natural join MOVIE_1
group by MO_NAME, MO_LIMIT
order by 3 desc;





--delete from MOVIE_2 where (me_id = 'gig6' and mo_name = '썸머 워즈') or (me_id = 'gig6' and mo_name = '겨울왕국2');


