<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생관리 프로그램</title>
</head>
<body>
<%@ include file = "header.jsp" %>
	<section>
		<div>
			<h2>수강생 조회/수정</h2>
		</div>
		<%
		sql = "select student_no, student_name, student_phone, to_char(student_birth, 'yyyy/mm/dd'),";
		sql += " student_email, student_id, student_pw, regSubject";
		sql += " from student_tbl_01 LEFT OUTER JOIN (select student_no, count(student_no) as regSubject";
		sql += " from register_tbl_01 group by student_no)";
		sql += " USING(student_no) order by regSubject asc";
			
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		
		ResultSetMetaData rsmd = rs.getMetaData();
		
		%>
		<table width="700" border="1">
		
			<tr>
				<th>수강생번호</th>
				<th>이름</th>
				<th>연락처</th>
				<th>생년월일</th>
				<th>메일주소</th>
				<th>아디</th>
				<th>비밀번호</th>
				<th>수강과목수</th>
			</tr>
			<%while(rs.next()) {%>
			<tr align="center">
				<%for(int i = 1; i <= rsmd.getColumnCount(); i++) { %>
					<%if(rsmd.getColumnName(i).equals("STUDENT_NO")) {%>	<!-- 주의 : getColumnName으로 리턴되는 컬럼명은 대문자로 출력됨 -->
						<td><a href="update.jsp?student_no=<%=rs.getString(i)%>"><%=rs.getString(i)%></a></td>
					<%} else if(rsmd.getColumnName(i).equals("REGSUBJECT") ) { %>
						<td><%=rs.getString(i) == null ? "0" : rs.getString(i)%></td><!-- "0"이유? 수강과목 수라서 -->
					<%} else { %>
						<td><%=rs.getString(i) == null ? "" : rs.getString(i)%></td> <!-- 예 : email -->
					<%} %>
				<%} %>
			</tr>
			<%} %>
		</table>
	</section>
<%@ include file = "footer.jsp" %>
</body>
</html>