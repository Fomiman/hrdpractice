<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer> HRDKOREA Copyright &copy; 2019 All reserved </footer>
	<!-- [ⓒ입력 방법-1] 한글 ㅇ입력 후 한자 [방법-2] 특수문자 : &copy; 사용 -->
</body>
</html>

<!-- ★★ DB연결 해제 -->
<!-- 변수에 빨간줄 오류 무시 : 향후 index.jsp에서 합쳐질때 사용됨 -->
<%
try{
	if(con != null) con.close();
	if(stmt != null) stmt.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}catch(Exception e) {
	e.printStackTrace();
}
%>
