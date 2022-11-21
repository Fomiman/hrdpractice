<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>
<%
int user_no = Integer.parseInt(request.getParameter("user_no"));
String user_name = request.getParameter("user_name");
int user_pw = Integer.parseInt(request.getParameter("user_pw"));
String dept_no = request.getParameter("dept_no");
String user_gbn = request.getParameter("user_gbn");
String reg_date = request.getParameter("reg_date");

sql = "insert into USER_TBL_08 values(?, ?, ?, ?, ?, ?)";
try {
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, user_no);
	pstmt.setString(2, user_name);
	pstmt.setInt(3, user_pw);
	pstmt.setString(4, dept_no);
	pstmt.setString(5, user_gbn);
	pstmt.setString(6, reg_date);

	int updateSuccess = pstmt.executeUpdate();
	if (updateSuccess > 0) {
%>
<script>
	alert("사용자 등록이 정상적으로 완료 되었습니다.");
	location.href = "updateUser.jsp";
</script>
<%
	}
} catch (Exception e) {
	%>
	<script>
		alert("사용자 등록이 실패했습니다.");
		history.back();
	</script>
	<%
} finally {
	try{
		if(con != null) con.close();
		if(stmt != null) stmt.close();
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
	}catch(Exception e){ 
		e.printStackTrace();
	}
}
%>
