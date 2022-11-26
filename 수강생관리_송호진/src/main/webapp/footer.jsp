<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer>
		HRDKOREA Copyright&copy; 2016 All right reserved. Human Resource Development Service of Korea.
	</footer>
</body>
</html>
<%
//반드시 DB연결 해제
try {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
	if(stmt != null) stmt.close();
}catch(Exception e) {
	
}

%>