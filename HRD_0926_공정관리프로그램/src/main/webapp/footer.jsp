<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸터</title>
</head>
<body>
<footer>
	HRDKOREA Copyright&copy;2019 All reserved. Human Resource Development Service of Korea.
</footer>
</body>
</html>

<%
/* ※★☆ 필수 : DB연결 해제 */
try{
	if(con != null) con.close();
	if(stmt != null) stmt.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
	/* dbcon.jsp에서 만든 4가지 DB연결&이용하는 객체들 닫아준다. */
}catch(Exception e){ 
	e.printStackTrace();
	/* 기본적인 오류메세지로 설정해뒀다. 나중에 따로 뭔가를 써서 바꾸는지는 아직 모름*/
}

%>