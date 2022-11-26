<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 회원&amp;예매 관리 프로그램</title>
<script type="text/javascript">
	
</script>
</head>
<body>
<%@ include file = "header.jsp" %>
	<section>
		<div>
			<h2>회원별 예매정보 조회</h2>
		</div>
		<table border="1" width="650">
			<tr>
				<th>회원아이디</th>
				<th>회원이름</th>
				<th>영화제목</th>
				<th>시청등급</th>
				<th>예매횟수</th>
			</tr>
			<%
			sql = "select me_id, me_name, mo_name, mo_limit, count(me_id)";
			sql += " from movie_1 NATURAL JOIN movie_2";
			sql += " NATURAL JOIN movie_3";
			sql += " group by me_id, me_name, mo_name, mo_limit";
			sql += " order by me_name asc";

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			
			while(rs.next()) {
			%>
			<tr align="center">
				<%for(int i = 1; i <= rsmd.getColumnCount(); i++) {%>
				<td><%=rs.getString(i)%></td>
				<%} %>
			</tr>
			<%} %>
		</table>
	</section>
<%@ include file = "footer.jsp" %>
</body>
</html>