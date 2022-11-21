<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="dbconn.jsp" %>
<link href="./css/style.css" rel="stylesheet">
<script type="text/javascript" src="./js/script.js"></script>
</head>
<body>
	<header>

		<div class="headtop">
			<h3>권한관리</h3>
		</div>

		<nav class="headnav">
			<ul>
				<li><a href="insertUser.jsp">사용자등록</a></li>
				<li><a href="updateUser.jsp">사용자목록조회/수정</a></li>
				<li><a href="showRights.jsp">권한조회</a></li>
				<li><a href="index.jsp">홈으로.</a></li>
			</ul>
		</nav>

	</header>


</body>
</html>