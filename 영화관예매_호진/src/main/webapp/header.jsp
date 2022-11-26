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
		<h2>영화관 회원&amp;예매 관리 프로그램</h2>
	</header>
	<nav>
		<a href="insertMember.jsp">회원등록</a>
		<!-- <a href="insertMovieBuy.jsp">영화예매</a> -->
		<a href="insertMovieBuy_multiple.jsp">영화예매</a>
		<a href="selectMemberMovieBuy.jsp">회원별예매조회</a>
		<a href="selectMovieBuyInfo.jsp">영화별예매조회</a>
		<a href="index.jsp">홈으로</a>
	</nav>
</body>
</html>