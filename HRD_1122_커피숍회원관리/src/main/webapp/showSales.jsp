<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출정보조회</title>
</head>
<body>
<%@ include file="header.jsp" %>

	<section>
	<h2>매출정보조회</h2>
	<table class="salestbl">
	<tr>
		<th>상품명</th>
		<th>상품단가</th>
		<th>총매출수량</th>
		<th>총판매금액</th>
	</tr>
	
	<%try{
		sql ="select pname, pcode, pcost, sum(amount), to_char(sum(price), 'l999,999,999')  ";
		sql+=" from coffee_tbl join sale_tbl ";
		sql+=" using(pcode) ";
		sql+=" group by pname, pcode, pcost ";
		sql+=" order by pcost desc ";
		pstmt = con.prepareStatement(sql);
		rs= pstmt.executeQuery();
		while(rs.next()){
	%>
	<tr>
		<td>
			<%=rs.getString(1)%>
		</td>
		<td>
			<%=rs.getString(3) %>
		</td>
		<td>
			<%=rs.getInt(4) %>
		</td>
		<td style="text-align:right;">
			<%=rs.getString(5) %>
		</td>
	</tr>
	<%
			}
	}catch(Exception e){%>
	<tr>
		<td colspan="4">매출정보를 불러오지 못했습니다.</td>
	</tr>
	<%}%>
	
	</table>
	
</section>
<%@ include file="footer.jsp" %>
</body>
</html>