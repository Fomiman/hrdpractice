<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<h2>사원등록</h2>
	
	<%System.out.print("updatepro");
	
	String EMPLOYEE_NO = request.getParameter("EMPLOYEE_NO");
	
	sql = "select  EMPLOYEE_NO, EMPLOYEE_NAME, DEPT_NO, to_char(HIRE_DATE, 'yyyy-mm-dd') as HIRE_DATE, EMPLOYEE_STATUS ";
	sql += " from EMPLOYEE_TBL_13 where EMPLOYEE_NO='"+EMPLOYEE_NO+"'";
	
	ps =con.prepareStatement(sql);
	rs = ps.executeQuery();
	rs.next();
	%>
	<form action="updateEmployeePro.jsp" name="updateForm" method="post">
	<table class="insertEmpTable">
		<tr>
			<th>사원번호</th>
			<td>
				<input type="number" name="EMPLOYEE_NO" value="<%=rs.getString(1) %>" size="20" maxlength="4"/>
			</td>
		</tr>
		<tr>
			<th>사원명</th>
			<td>
				<input type="text" name="EMPLOYEE_NAME" value="<%=rs.getString(2) %>" size="20" maxlength="20"/>
			</td>
		</tr>
		<tr>
			<th>부서번호</th>
			<td>
				<input type="text" name="DEPT_NO" value="<%=rs.getString(3) %>" size="20" maxlength="2"/>
			</td>
		</tr>
		<tr>
			<th>입사일자</th>
			<td>
				<input type="text" name="HIRE_DATE" value="<%=rs.getString(4) %>" size="20" />
			</td>
		</tr>
		<tr>
			<th>사원상태</th>
			<td>
				<select name="EMPLOYEE_STATUS">
					<option value="1" <%=rs.getString(5).equals("1")?"selected":""%> >입사</option>
					<option value="2" <%=rs.getString(5).equals("2")?"selected":""%> >퇴사</option>
					<option value="3" <%=rs.getString(5).equals("3")?"selected":""%> >휴직</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="buttontd">
				<input type="submit" name="updateSubmit" value="수정" onclick="toUpdatePage(); return false;"/>
				<input type="button" name="selectMember" value="조회" onclick="selectMember1();"/>
			</td>
		</tr>
	</table>
	</form>
<%@ include file="footer.jsp" %>
</body>
</html>