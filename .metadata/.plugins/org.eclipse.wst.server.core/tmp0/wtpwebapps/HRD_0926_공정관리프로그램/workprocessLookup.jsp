<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업공정조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<h1>작업공정조회</h1>
	
	<table class="orderTable">
		<tr>
			<th>작업지시번호</th>
			<th>제품코드</th>
			<th>제품명</th>
			<th>준비</th>
			<th>인쇄</th>
			<th>코팅</th>
			<th>합지</th>
			<th>접합</th>
			<th>포장</th>
			<th>최종공정일자</th>
			<th>최종공정시간</th>
		</tr>
		<% sql = "";
			sql += " select substr(w_workno, 1 , 4)||'-'||substr(w_workno, 5 , 4) as w_workno, ";
			sql += " p_code, p_name, ";
			sql += " p_p1, p_p2, p_p3, p_p4, p_p5, p_p6, ";
			sql += " substr(w_lastdate, 1 , 4)||'-'||substr(w_lastdate, 5 , 2)||'-'||substr(w_lastdate, 7 , 2) as w_lastdate, ";
			sql += " substr(w_lasttime, 1 , 2)||':'||substr(w_lasttime, 3 , 2) as w_lasttime  ";
			sql += " from TBL_WORKLIST join tbl_product using(p_code) ";
			sql += " join tbl_process using(w_workno) order by 1";
			
			ps  = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4).equals("Y")?"완료":"~" %></td>
			<td><%=rs.getString(5).equals("Y")?"완료":"~" %></td>
			<td><%=rs.getString(6).equals("Y")?"완료":"~" %></td>
			<td><%=rs.getString(7).equals("Y")?"완료":"~" %></td>
			<td><%=rs.getString(8).equals("Y")?"완료":"~" %></td>
			<td><%=rs.getString(9).equals("Y")?"완료":"~" %></td>
			<td><%=rs.getString(10) %></td>
			<td><%=rs.getString(11) %></td>
		</tr>
		<%} %>
	
	
	</table>
	
<%@ include file="footer.jsp" %>
</body>
</html>