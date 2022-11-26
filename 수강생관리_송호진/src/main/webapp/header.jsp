<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h2>학원수강관리</h2>
	</header>
	<nav>
		<a href="insertStudent.jsp">수강생등록</a>
		<a href="selectStudent.jsp">수강생목록조회/수정</a>
		<a href="insertRegister.jsp">수강신청</a>
		<a href="selectRegister.jsp">수강조회</a>
		<a href="index.jsp">홈으로.</a>
	</nav>
</body>
</html>