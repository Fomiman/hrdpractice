<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<section>
	
		<div class="sectiontitle">권한관리프로그램</div>
		
		<div class="sectiontext">
		국제학교 포탈에서 사용자 정보 권한 정보 데이터 베이스를 구축하고 권한관리 프로그램을 작성하는 프로그램이다.<br>
		프로그램 작성 순서
		</div>
		
		<ul class="sectionul">
			<li>사용자정보 테이블을 생성한다.</li>
			<li>부서별권한정보 테이블을 생성한다.</li>
			<li>사용자별 권한정보 테이블을 생성한다.</li>
			<li>사용자정보, 부서별권한정보, 사용자별정보 테이블에 제시된 문제자의 참조 데잍터를 추가 생성한다.</li>
			<li>사용자정보 입력 화면프로그램을 작성한다.</li>
			<li>사용자정보, 조회/수정 프로그램을 작성한다.</li>
			<li>권한 정보 조회 프로그램을 작성한다.</li>
		</ul>
		
	</section>


	<%@ include file="footer.jsp"%>
</body>
</html>