<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<footer>HRDKOREA Copyright&copy;2019 All reserved.</footer>
</body>
</html>

<%
if (con != null) {
	con.close();
}
if (stmt != null) {
	stmt.close();
}
if (ps != null) {
	ps.close();
}
if (rs != null) {
	rs.close();
}
%>