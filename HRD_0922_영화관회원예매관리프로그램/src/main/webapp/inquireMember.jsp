<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
		<div>
			<h2>회원별 예매정보 조회</h2>
		</div>
		
		<form action="" name="fim" method="post">
			<table width="600px">
				<tr>
					<th>회원아이디</th>
					<th>회원이름</th>
					<th>영화제목</th>
					<th>시청등급</th>
					<th>예매횟수</th>
				</tr>
				<%
				sql = "";
				sql += " select  ME_ID, me_name, MO_NAME, MO_LIMIT , count(*)";
				sql += " from MOVIE_2 natural join MOVIE_3 natural join MOVIE_1";
				sql += " group by ME_ID, me_name,MO_NAME, MO_LIMIT";
				sql += " order by me_name";
				
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				
				while(rs.next()){%>
				<tr class="alignMiddle">
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
				</tr>
				<%} %>
			</table>
		</form>
		
	</section>
<%@ include file="footer.jsp" %>
</body>
</html>