<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>

<%
int custno = Integer.parseInt(request.getParameter("custno"));
String custname =request.getParameter("custname");
String gender =request.getParameter("gender");
String phone =request.getParameter("phone");
String address =request.getParameter("address");
String joindate =request.getParameter("joindate");
String grade =request.getParameter("grade");
int city = Integer.parseInt(request.getParameter("city"));

try{
	sql="insert into member_tbl values(?,?,?,?,?,?,?,?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, custno);
	pstmt.setString(2, custname);
	pstmt.setString(3, gender);
	pstmt.setString(4, phone);
	pstmt.setString(5, address);
	pstmt.setString(6, joindate);
	pstmt.setString(7, grade);
	pstmt.setInt(8, city);
	
	int executeSuccess = pstmt.executeUpdate();
	
	if(executeSuccess > 0){
		%>
		<script>
		alert("회원등록이 완료되었습니다.");
		location="showMember.jsp";
		</script>
		<%
	}
	
}catch(Exception e){
	%>
	<script>
	alert("회원등록이 실패했습니다.");
	history.back();
	</script>
	<%
}finally{
	con.close();
	pstmt.close();
}






%>