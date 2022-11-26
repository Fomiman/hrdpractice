<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생목록조회/수정</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
sql="";
sql += " select student_no, student_name, student_phone, ";
sql += " to_char(student_birth, 'yyyy/mm/dd') as student_birth, student_email , student_id, student_pw,";
sql += " sum(case when register_status is not null then 1 end)";
sql += " from STUDENT_TBL_01 full outer join register_tbl_01";
sql += " using(student_no)";
sql += " group by student_no, student_name, student_phone, student_birth, student_email, student_id, student_pw order by 2";

rs = stmt.executeQuery(sql);


%>
	<section>
		<div><h2>수강생 조회/수정</h2></div>
		<table id="inquireStudentTable">
			<tr>
				<th>수강생번호</th>
				<th>이름</th>
				<th>연락처</th>
				<th>생년월일</th>
				<th>메일주소</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>수강과목수</th>
			</tr>
			<% while(rs.next()){ %>
			<tr>
				<td><a href="updateStudent.jsp?student_no=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
				<td><%=rs.getString(2)==null?"":rs.getString(2) %></td>
				<td class="alignLeft"><%=rs.getString(3)==null?"":rs.getString(3) %></td>
				<td><%=rs.getString(4)==null?"":rs.getString(4) %></td>
				<td class="alignLeft"><%=rs.getString(5)==null?"":rs.getString(5) %></td>
				<td><%=rs.getString(6)==null?"":rs.getString(6) %></td>
				<td><%=rs.getString(7)==null?"":rs.getString(7) %></td>
				<td class="alignRight"><%=rs.getString(8)==null?"":rs.getString(8) %></td>
			</tr>
			<%} %>
		</table>		
	</section>
<%@include file="footer.jsp" %>
</body>
</html>