<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB해제용 페이지 이름만 푸터</title>
</head>
<body>
	
	<!-- 내용 없는 DB해제용 푸터 -->

</body>
</html>

<% 
try{
	if(con != null) con.close();
	if(stmt != null) stmt.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();

}catch(Exception e){

	e.printStackTrace();
	
}

%>