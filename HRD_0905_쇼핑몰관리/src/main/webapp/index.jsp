<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰관리 프로그램</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!-- dbconn.jsp(DB 연결) + style.css -->
	<section>
		<div id="bonobono">
			<h2>쇼핑몰관리 프로그램</h2>
			<p>쇼핑몰에서 회원정보, 매출정보, 등급정보 데이터베이스를 구축하고 회원관리와 회원조회 및 매출조회를 위한
				프로그램을 작성하는 프로그램이다.</p>
			<br>
			<p>프로그램 작성 순서</p>
			<br>
			<ol>
				<li>회원정보 테이블을 생성한다.</li>
				<li>매출정보 테이블을 생성한다.</li>
				<li>등급정보 테이블을 생성한다.</li>
				<li>회원정보 입력화면 프로그램응 작성한다.</li>
				<li>회원조회/수정 프로그램을 작성한다.</li>
				<li>매출조회 프로그램을 작성한다.</li>
			</ol>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
	<!-- DB 연결 해제 -->
</body>
</html>