<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ include file="dbcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header+nav</title>
</head>

<link rel="stylesheet" type="text/css" href="style.css" >
<body>
	<header>
		<div id="headerTopDiv">
			<h2>대학교성적관리 프로그램</h2>
		</div>
		<nav>
			<a href="insertStudent.jsp" >학생등록</a>
			<a href="insertScore.jsp" >성적등록</a>
			<a href="selectScore.jsp" >성적조회</a>
			<a href="subjectToRetake.jsp" >재수강대상자</a>
			<a href="index.jsp" >홈으로</a>
		</nav>
	</header>

</body>
</html>