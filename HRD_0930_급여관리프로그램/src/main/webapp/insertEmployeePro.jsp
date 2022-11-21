<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="dbcon.jsp" %>

<%
try{
	sql = "insert into EMPLOYEE_TBL_13 values(?, ?, ?, ?, ?)";
	
	ps = con.prepareStatement(sql);

	ps.setString(1, request.getParameter("EMPLOYEE_NO"));
	ps.setString(2, request.getParameter("EMPLOYEE_NAME"));
	ps.setString(3, request.getParameter("DEPT_NO"));
	ps.setString(4, request.getParameter("HIRE_DATE"));
	ps.setString(5, request.getParameter("EMPLOYEE_STATUS"));
	
	ps.executeUpdate();
	
	%>
	<script>
	alert("성공적으로 등록되었습니다.");
	location.href="selectEmployee.jsp";
	</script>
<%
}catch(Exception e){
	%>
	<script>
	alert("등록이 실패했습니다.");
	history.back();
	</script>
<%
}finally{
	try{
		if(con != null) con.close();
		if(stmt != null) stmt.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();

	}catch(Exception e){

		e.printStackTrace();
		
	}	
}
%>
