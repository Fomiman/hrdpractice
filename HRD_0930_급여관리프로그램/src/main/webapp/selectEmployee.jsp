<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원목록조회/수정</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<% %>
	<h2>사원목록조회/수정</h2>
<form name="selectForm" method="post">
	<table class="selectEmpTable">
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>부서번호</th>
			<th>입사일자</th>
			<th>사원상태코드</th>
			<th>사원상태명</th>
		</tr>
		<%
		 sql = "";
		sql += " select  EMPLOYEE_NO, EMPLOYEE_NAME, DEPT_NO, ";
		sql += " to_char(HIRE_DATE, 'yyyy-mm-dd') as HIRE_DATE, ";
		sql += " EMPLOYEE_STATUS,";
		sql += " decode(EMPLOYEE_STATUS, '1','입사','2','퇴사','3','휴식') as EMPLOYEE_STATUS2";
		sql += " from EMPLOYEE_TBL_13 ";
		
		ps =con.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td>
				<a href="updateEmployee.jsp?EMPLOYEE_NO=<%=rs.getString(1) %>"><%=rs.getString(2)%></a>
			</td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
		</tr>
		<%} %>
	</table>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>