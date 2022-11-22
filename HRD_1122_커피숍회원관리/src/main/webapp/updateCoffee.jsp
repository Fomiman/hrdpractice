<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피목록 수정</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<%
	String pcode = request.getParameter("pcode");
	%>
	<section>
		<h2>커피목록 수정</h2>
		<form action="#" method="post" name="f">
			<table class="uctbl">
				<tr>
			<%
			try {
				sql = "select pcode, pname, pcost from coffee_tbl where pcode=\'"+ pcode+"\'";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
			%>
					<th>상품코드</th>
					<td><input type="text" name="pcode" value="<%=rs.getString(1)%>">4글자내로
						입력하세요. ex)A101</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="pname" value="<%=rs.getString(2)%>"></td>
				</tr>
				<tr>
					<th>상품단가</th>
					<td><input type="number" name="pcost" value="<%=rs.getInt(3)%>">가격만
						입력하시오. ex)6500
						</td>
						<%
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
				%>
				</tr>
				
			</table>
				
			<div class="btndiv" style="text-align: center;">
				<input type="button" value="수정" onclick="updateCoffee();" /> 
				<input type="button" value="삭제" onclick="deleteCoffee();">
			</div>
		</form>
		

	</section>
	<%@ include file="footer.jsp"%>	
</body>
</html>