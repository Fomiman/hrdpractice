<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="dbcon.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<link rel="stylesheet" type="text/css" href="./script/style.css">
<script type="text/javascript" src="./script/function.js"></script>
<body>
	<header>
		<div>
			<h2>학원수강관리</h2>
		</div>
		<nav>
			<a href="insertStudent.jsp">수강생등록</a>
			<a href="inquireStudent.jsp">수강생목록조회/수정</a>
			<a href="insertRegister.jsp">수강신청</a>
			<a href="inquireClass.jsp">수강조회</a>
			<a href="index.jsp">홈으로.</a>
		</nav>
	</header>
</body>
</html>