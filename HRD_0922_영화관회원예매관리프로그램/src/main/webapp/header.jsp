<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="dbcon.jsp" %>
<link rel="stylesheet" href="./script/style.css">
<body>
	<header>
		<div>
			<h2>영화관 회원&예매 관리 프로그램</h2>
		</div>
		<nav>
			
				<a href="insertMember.jsp">회원등록</a>
				<a href="ticketing.jsp">영화예매</a>
				<a href="inquireMember.jsp">회원별예매조회</a>
				<a href="inquireMovie.jsp">영화별예매조회</a>
				<a href="index.jsp">홈으로</a>
			
		</nav>
	</header>
</body>
</html>