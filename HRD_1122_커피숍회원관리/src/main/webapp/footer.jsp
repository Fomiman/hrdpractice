<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸터</title>
</head>
<body>
	<div class="footerdiv">
		<footer>HRD KOREA</footer>
	</div>
</body>
</html>

<%
try{
	if(con != null)	con.close();
	if(stmt != null) stmt.close();
	if(pstmt != null)	pstmt.close();
	if(rs != null)	rs.close();
}catch(Exception e){
	e.printStackTrace();
}



%>
