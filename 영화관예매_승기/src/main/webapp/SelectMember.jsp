<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="Header.jsp" %>
	<%
		sql  = " select me_id, me_name, mo_name, mo_limit, BookN from movie_3 join ";
		sql += " (select me_id, mo_name, count(mo_name) as BookN from movie_2 ";
		sql += " group by (me_id, mo_name)) using (mo_name) ";
		sql += " join (select * from movie_1) using(me_id) order by me_name asc ";
		rs = stmt.executeQuery(sql);
	%>
	<section>
		<h1>회원별 예매정보 조회</h1>
		<table class="memberSelectTable">
			<tr>
				<th>회원아이디</th>
				<th>회원이름</th>
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
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
				</tr>
				<%
			}
			%>
		</table>
	
		
	</section>
	<%@include file="Footer.jsp" %>
</body>
</html>