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

sql = "update USER_TBL_08 set user_name=?, user_pw=?, dept_no=?, user_gbn=?, reg_date=? where user_no="+user_no;
try {
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, user_name);
	pstmt.setInt(2, user_pw);
	pstmt.setString(3, dept_no);
	pstmt.setString(4, user_gbn);
	pstmt.setString(5, reg_date);

	int updateSuccess = pstmt.executeUpdate();
	if (updateSuccess > 0) {
%>
<script>
	alert("정보 수정이 정상적으로 완료 되었습니다.");
	location.href = "updateUser.jsp";
</script>
<%
	}
} catch (Exception e) {
	%>
	<script>
		alert("정보 수정이 실패했습니다.");
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
