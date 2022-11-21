<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
</head>

<%@ include file="dbcon.jsp" %> <!-- DB연결 및 사용하기 위한 페이지를 연결해둔다 -->
<link rel="stylesheet" href="./script/style.css"> <!-- 스타일CSS 파일을 연동 -->
<script type="text/javascript" src="./script/function.js"></script><!-- 펑션넣은 js파일 -->
<!-- 차후 만드는 페이지는 모두 header를 body에 포함하기 때문에 
위 세가지를 header에 연결시켜두면 페이지마다 따로 연결해줄 필요가 없다. -->


<body>
<header>
	<div id="headDiv">
		<h2>(과정평가형 정보처리산업기사)스마트공장 공정관리 프로그램 ver 2019-09</h2>
	</div>
	<nav>
		<a href="productLookup.jsp">제품조회</a>
		<a href="orderLookup.jsp">작업지시서조회</a>
		<a href="insertWorkprocess.jsp">작업공정등록</a>
		<a href="workprocessLookup.jsp">작업공정조회</a>
		<a href="index.jsp">홈으로</a>
	</nav>
</header>
</body>
</html>