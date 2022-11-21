<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
</head>

<%@ include file="dbcon.jsp" %>
<link rel="stylesheet" href="./script/style.css">
<script type="text/javascript" src="./script/function.js"></script>
<!-- DB, style, function 연동 헤더에 한번 하면 끝 -->
<body>
	<header>
		<div><!-- nav와 공간구분용 h1으로만 사용해도 됨 -->
			<h1>급여관리</h1>
		</div>
		<nav>
			<a href="insertEmployee.jsp">사원등록</a>
			<a href="selectEmployee.jsp">사원목록조회/수정</a>
			<a href="lookupSalary.jsp">급여조회</a>
			<a href="index.jsp">홈으로</a>
		</nav>
	</header>
	

</body>
</html>