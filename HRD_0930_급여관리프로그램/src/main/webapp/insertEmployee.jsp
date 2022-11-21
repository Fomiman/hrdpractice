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
	
	<form action="insertEmployeePro.jsp" name="insertForm" method="post">
	<table class="insertEmpTable">
		<tr>
			<th>사원번호</th>
			<td>
				<input type="number" name="EMPLOYEE_NO" value="" size="20" maxlength="4"/>
			</td>
		</tr>
		<tr>
			<th>사원명</th>
			<td>
				<input type="text" name="EMPLOYEE_NAME" value="" size="20" maxlength="20"/>
			</td>
		</tr>
		<tr>
			<th>부서번호</th>
			<td>
				<input type="text" name="DEPT_NO" value="" size="20" maxlength="2"/>
			</td>
		</tr>
		<tr>
			<th>입사일자</th>
			<td>
				<input type="text" name="HIRE_DATE" value="" size="20" />
			</td>
		</tr>
		<tr>
			<th>사원상태</th>
			<td>
				<select name="EMPLOYEE_STATUS">
					<option value="1">입사</option>
					<option value="2">퇴사</option>
					<option value="3">휴직</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="buttontd">
				<input type="submit" name="insertSubmit" value="등록" onclick="insertSubmit1(); return false;"/>
				<input type="button" name="selectMember" value="조회" onclick="selectMember1();"/>
			</td>
		</tr>
	</table>
	</form>
<%@ include file="footer.jsp" %>
</body>
</html>