<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div >
	<div>
		<h2>급여조회(아침출근-저녁퇴근)</h2>
	</div>
	<table class="salaryTable">
		<tr>
			<th>근무년월</th>
			<th>사원번호</th>
			<th>급여</th>
		</tr>
		<%
			sql ="";
			sql+= " select substr(WORK_DATE,1,6) , EMPLOYEE_NO,";
			sql+= " sum(";
			sql+= " (substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))";
			sql+= " - ";
			sql+= " (substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2))";
			sql+= " )*(9000/60) as worktime ";
			sql+= " from EMPLOYEE_TBL_13 natural join WORK_TBL_13_1";
			sql+= " group by substr(WORK_DATE,1,6), EMPLOYEE_NO ";
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
		</tr>
		<%} %>
	</table>
</div>

<div>
	<div>
		<h2>급여조회(저녁출근-새벽퇴근)</h2>
	</div>
	<table class="salaryTable">
		<tr>
			<th>근무년월</th>
			<th>사원번호</th>
			<th>급여</th>
		</tr>
		<%
			sql ="";
			sql+= " select substr(WORK_DATE,1,6) , EMPLOYEE_NO,";
			sql+= " 	sum( case when";
			sql+= " 		(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))- ";
			sql+= " 		(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2)) ";
			sql+= " 		<0 then ";
			sql+= " 		(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))- ";
			sql+= " 		(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2)) ";
			sql+= " 		+24*60 else ";
			sql+= " 		(substr(WORK_OUT_TIME,1,2)*60+substr(WORK_OUT_TIME,3,2))- ";
			sql+= " 		(substr(WORK_IN_TIME,1,2)*60+substr(WORK_IN_TIME,3,2)) ";
			sql+= " 		+0 end"; // --급여계산
			sql+= " 	) *(9000/60) as salary"; // --급여계산
			sql+= " from EMPLOYEE_TBL_13 natural join WORK_TBL_13_2";
			sql+= " group by substr(WORK_DATE,1,6), EMPLOYEE_NO ";
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
		</tr>
		<%} %>
	</table>
</div>



<%@ include file="footer.jsp" %>
</body>
</html>