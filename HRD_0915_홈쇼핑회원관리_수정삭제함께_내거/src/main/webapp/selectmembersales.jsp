<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원관리</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!-- dbconn.jsp(DB 연결) + style.css -->
	<section>
		<div>
			<h2>회원매출조회</h2>
		</div>
		<table class="select2table" width=700px>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
			sql = "";
			sql += " select custno , custname,";
			sql += " decode(GRADE, 'A', 'VIP', 'B', '일반', 'C', '직원') as grade, ";
			sql += " sum(price)";
			sql += " from member_tbl_02 join MONEY_TBL_02";
			sql += " using(custno)";
			sql += " group by custno, custname, grade";
			sql += " order by 4 desc";

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
			%>

			<tr align="center">
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<%-- <td><%=rs.getString("grade") %></td> 별칭 사용으로 적어두면 덜 헷갈린다.--%>
				<td><%=rs.getString(4)%></td>
			</tr>

			<%
			}
			%>

		</table>
	</section>
	<%@ include file="footer.jsp"%>
	<!-- DB 연결 해제 -->
</body>
</html>