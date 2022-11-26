<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원 관리</title>
</head>
<body>
<%@ include file = "header.jsp" %>

	<%
	sql = "select custno, custname, phone, address,";
	sql += " TO_CHAR(joindate, 'yyyy-mm-dd'),";
	sql += " DECODE(grade, 'A', 'VIP', 'B', '일반', 'C', '직원'), city";
	sql += " from member_tbl_02";
	sql += " order by custno";
	
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	%>
	<section>
		<div>
			<h2>회원목록조회/수정</h2>
		</div>
		<table width="700" border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%
			while(rs.next()) {
			
			%>
			<tr align="center">
				<td><a href="updateDelete.jsp?custno=<%=rs.getString("custno")%>"><%=rs.getString(1)%></a></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
			</tr>
			<% } %>
		</table>
	</section>

<%@ include file = "footer.jsp" %>
</body>
</html>