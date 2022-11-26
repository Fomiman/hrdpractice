<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="Header.jsp" %>
	<%
		sql  = " select mo_name, mo_limit, BookN from movie_3 join  ";
		sql += " (select mo_name, count(mo_name) as BookN from movie_2 ";
		sql += " group by mo_name) using (mo_name) order by BookN desc ";
		rs = stmt.executeQuery(sql);
	%>
	<section>
		<h1>영화별 예매 정보 조회</h1>
		<table class="memberSelectTable">
			<tr>
				<th>영화제목</th>
				<th>시청등급</th>
				<th>예매횟수</th>
			</tr>
			<%
			while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
				</tr>
				<%
			}
			%>
		</table>
	
		
	</section>
	<%@include file="Footer.jsp" %>
</body>
</html>