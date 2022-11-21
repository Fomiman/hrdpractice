<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시서조회</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h1>작업지시서조회</h1>
	
	<table class="orderTable">
		<tr>
			<th>작업지시번호</th>
			<th>제품코드</th>
			<th>제품명</th>
			<th>제품규격</th>
			<th>제품구분</th>
			<th>수량</th>
			<th>작업시작일</th>
		</tr>
		<% sql = "select substr(w_workno, 1 , 4)||'-'||substr(w_workno, 5 , 4) as w_workno, p_code, p_name, p_size, p_type, w_quantity, ";
			sql += " to_char(w_workdate, 'yyyy-mm-dd') as w_workdate";
			sql += " from tbl_product join tbl_worklist ";
			sql += " using(p_code) ";
			
			ps  = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
		%><tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td class="alignRight"><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
		<%} %>
	
	
	</table>
	
	
	<%@ include file="footer.jsp" %>
</body>
</html>