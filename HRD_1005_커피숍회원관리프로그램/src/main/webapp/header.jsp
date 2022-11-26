<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="dbcon.jsp" %>
<script type="text/javascript" src="./script/function.js">
</script>
<!-- 스크립트는 앞에 scr 로 시작하니까 src -->
<link rel="stylesheet" href="./script/style.css"/>
<!-- rel : relation의 줄임말로 불러오는 링크가 이 파일과 무슨 관계인지 표시하는것 -->
<body>

	<header>
		<div>
			<h1>커피숍 회원관리</h1>
		</div>
		
		<nav>
			<a href="insertMember.jsp">회원등록</a>
			<a href="addCoffeeMenu.jsp">커피등록</a>
			<a href="memberList.jsp">회원목록조회/수정</a>
			<a href="salesInformation.jsp">매출현황조회</a>
			<a href="index.jsp">홈으로.</a>
		</nav>
	</header>

</body>
</html>