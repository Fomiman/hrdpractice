<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피목록조회</title>
</head>
<body>
<%@ include file="header.jsp" %>

	<section>
	<h2>커피목록조회</h2>
	<table class="coffeetbl">
	<tr>
		<th>상품코드</th>
		<th>상품명</th>
		<th>상품단가</th>
	</tr>
	
	<%try{
		sql ="select * from coffee_tbl";
		pstmt = con.prepareStatement(sql);
		rs= pstmt.executeQuery();
		while(rs.next()){
			String pcode = rs.getString(1);
	%>
	<tr>
		<td>
			<a href="updateCoffee.jsp?pcode=<%=pcode%>"><%=pcode%></a>
		</td>
		<td>
			<%=rs.getString(2) %>
		</td>
		<td>
			<%=rs.getInt(3) %>
		</td>
	</tr>
	<%
			}
	}catch(Exception e){%>
	<tr>
		<td colspan="3">커피를 불러오지 못했습니다.</td>
	</tr>
	<%}%>
	
	</table>
	<h2>커피목록조회(수정된 커피 가격)</h2>
	<table class="coffeetbl">
	<tr>
		<th>상품코드</th>
		<th>상품명</th>
		<th>상품단가</th>
	</tr>
	
	<%try{
		sql ="select pcode,pname,pcost from coffee_tbl2 ";
		sql +="	minus ";
		sql +=" select pcode,pname,pcost from coffee_tbl";
		pstmt = con.prepareStatement(sql);
		rs= pstmt.executeQuery();
		while(rs.next()){
	%>
	<tr>
		<td>
			<%=rs.getString(1)%>
		</td>
		<td>
			<%=rs.getString(2) %>
		</td>
		<td>
			<%=rs.getInt(3) %>
		</td>
	</tr>
	<%
			}
	}catch(Exception e){%>
	<tr>
		<td colspan="3">커피를 불러오지 못했습니다.</td>
	</tr>
	<%}%>
	
	</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>