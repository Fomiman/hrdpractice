--[1]회원정보 테이블 명세서 생성
create table movie_1 (
	me_id varchar2(12) not null primary key,
	me_pass varchar2(15) not null,
	me_name varchar2(20) not null,
	gender char(1),
	birth date,
	address varchar2(100),
	tel varchar2(13)
);

--회원정보 조회
select * from movie_1;

--회원정보 테이블 명세서 샘플 데이터 삽입
insert into movie_1 values('kus1', 'sin1', '김유신', 'M', '2004-02-29', '경북 경산시 중방동', '010-1111-2222');
insert into movie_1 values('sgj2', 'joo2', '신경주', 'M', '2002-06-18', '대구시 수성구 만촌동', '010-2222-1111');
insert into movie_1 values('ymg3', 'me3', '양미경', 'F', '2000-01-01', '경북 경산시 남천면', '010-3333-4444');
insert into movie_1 values('kjs4', 'soo4', '김지수', 'F', '2005-11-22', '경북 경산시 진량읍', '010-4444-3333');
insert into movie_1 values('jsw5', 'jang5', '장선우', 'M', '1999-12-31', '대구시 수성구 사월동', '010-5555-6666');
insert into movie_1 values('gig6', 'go6', '고인규', 'M', '2002-06-24', '경북 영천시 금호읍', '010-6666-5555');
insert into movie_1 values('bsy7', 'year7', '박시연', 'F', '2008-08-28', '경북 경산시 와촌읍', '010-7777-9999');


--[2]영화예매 정보 테이블 명세서 생성
create table movie_2 (
	me_id varchar2(12) not null,
	me_pass varchar2(15) not null,
	mo_name varchar2(50) not null,
	rm_date date not null
);

--영화예매 정보 샘플 데이터 삽입
insert into movie_2 values('kus1', 'sin1', '겨울왕국2', '2019-11-25');
insert into movie_2 values('kus1', 'sin1', '늑대아이', '2019-09-20');
insert into movie_2 values('sgj2', 'joo2', '겨울왕국2', '2019-11-24');
insert into movie_2 values('ymg3', 'me3', '김복동', '2019-08-15');
insert into movie_2 values('ymg3', 'me3', '썸머 워즈', '2019-08-22');
insert into movie_2 values('kjs4', 'soo4', '겨울왕국2', '2019-11-28');
insert into movie_2 values('jsw5', 'jang5', '김복동', '2019-08-14');
insert into movie_2 values('gig6', 'go6', '늑대아이', '2019-09-20');
insert into movie_2 values('bsy7', 'year7', '늑대아이', '2019-09-20');
insert into movie_2 values('bsy7', 'year7', '시간을 달리는 소녀', '2019-01-20');

--insert 후 커밋
commit;

--영화예매 정보 데이터 조회
select * from movie_2;

--[3] 영화정보 테이블명 명세서 생성
create table movie_3 (
	mo_no number not null,
	mo_name varchar2(50) not null,
	mo_poster varchar2(20),
	mo_limit varchar2(20) not null,
	mo_date date,
	mo_memo varchar2(100),
	primary key(mo_no, mo_name) --테이블 레벨 기본키 지정
);

--영화 정보 샘플 데이터
insert into movie_3 values(1, '겨울왕국2', '겨울왕국.jsp', '전체 관람가', '2019-11-21', '애니메이션 겨울왕국 2탄');
insert into movie_3 values(2, '늑대아이', '늑대아이.jsp', '전체 관람가', '2019-09-13', '애니메이션 늑대아이');
insert into movie_3 values(3, '김복동', '김복동.jsp', '12세 관람가', '2019-08-08', '위안부 피해자 고 김복동 할머니를 취재한 다큐멘터리');
insert into movie_3 values(4, '시간을 달리는 소녀', '시달소.jsp', '전체 관람가', '2019-1-14', '애니메이션 시간을 달리는 소녀');
insert into movie_3 values(5, '썸머 워즈', '썸머워즈.jsp', '전체 관람가', '2019-08-13', '애니메이션 썸머 워즈');
insert into movie_3 values(6, '눈의 여왕4', '눈여왕.jsp', '전체 관람가', '2019-12-24', '애니메이션 눈의 여왕 4탄');


----insertMovieBuy.jsp

--영화제목 가져오는 SQL
select mo_name from movie_3;

----selectMemberMovieBuy.jsp--------
--회원별 예매조회 화면
--예매를 하지않는 회원은 조회되지 않음.

----필요한 정보-----
--회원아이디, 회원이름, 영화제목, 시청등급, 예매횟수
select me_id, me_name
from movie_1; --회원정보 테이블

select mo_no, mo_name, mo_limit
from movie_3; --영화정보 테이블

select me_id, mo_name, count(*)
from movie_2 --영화예매정보 테이블
group by me_id, mo_name;

---[1]SQL에서 전부 조인하는 방안 (서브쿼리)
select me_id, me_name, mo_name, mo_limit, buyCnt
from movie_1 JOIN (select me_id, mo_name, mo_limit, buyCnt
					from movie_3 JOIN (select me_id, mo_name, count(*) as buyCnt
									from movie_2
									group by me_id, mo_name)
					USING(mo_name))
USING(me_id)
order by me_name asc;
--[2]SQL 조인 방안 -2
select me_id, me_name, mo_name, mo_limit, count(me_id)
from movie_1 NATURAL JOIN movie_2
			 NATURAL JOIN movie_3
group by me_id, me_name, mo_name, mo_limit
order by me_name asc;



--selectMovieBuyInfo.jsp(영화별 예매조회)----
--필요한 정보 정리
--영화명, 시청등급, 예매횟수
select mo_name
from movie_2;

select mo_name, mo_limit
from movie_3;

----[1]JAVA에서 테이블 관계 처리
select distinct mo_name, mo_limit
from movie_2 JOIN movie_3
USING(mo_name)
order by mo_name asc;

select count(*)
from movie_2
where mo_name = '겨울왕국2'; --비교 시 바뀌는 부분