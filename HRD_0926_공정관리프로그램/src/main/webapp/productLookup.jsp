<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<h1>제품조회</h1>
	
	<table class="LookupTable">
		<tr>
			<th>제품코드</th>
			<th>제품명</th>
			<th>제품규격</th>
			<th>제품구분</th>
			<th>제품단가</th>
		</tr>
		<% sql = "select  P_CODE, P_NAME, P_SIZE, P_TYPE, ";
			sql += " to_char(P_PRICE,'l999,999,999') from tbl_product"; /* l = local, 지역화폐단위 */
			ps  = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
		%><tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
		</tr>
		<%} %>
	
	
	</table>
	<%@ include file="footer.jsp" %>
</body>
</html>