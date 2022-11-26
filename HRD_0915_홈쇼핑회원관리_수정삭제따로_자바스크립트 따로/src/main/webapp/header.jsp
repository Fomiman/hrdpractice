<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="dbconn.jsp" %><!-- ※DB 연결파일 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
 <div id="headerdiv">
 	<h2>쇼핑몰 회원관리 ver 1.0</h2>
 	 </div>
 	<nav>
 	<a href="insertmember.jsp">회원등록</a>
 	<a href="select.jsp">회원목록조회/수정</a>
 	<a href="selectmembersales.jsp">회원매출조회</a>
 	<a href="index.jsp">홈으로.</a>
 	</nav>

</body>
</html>
