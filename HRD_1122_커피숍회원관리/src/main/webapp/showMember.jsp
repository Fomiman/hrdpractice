<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
</head>
<body>
<%@ include file="header.jsp" %>

	<section>
	<h2>회원목록조회/수정</h2>
	<table>
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>성별</th>
		<th>회원전화</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주도시</th>
	</tr>
	
	<%try{
		sql ="select * from member_tbl";
		pstmt = con.prepareStatement(sql);
		rs= pstmt.executeQuery();
		while(rs.next()){
	%>
	<tr>
		<td>
			<a href="updateMember.jsp?custno=<%=rs.getInt(1)%>"><%=rs.getInt(1)%></a>
		</td>
		<td>
			<%=rs.getString(2) %>
		</td>
		<td>
			<%=rs.getString(3) %>
		</td>
		<td>
			<%=rs.getString(4) %>
		</td>
		<td>
			<%=rs.getString(5) %>
		</td>
		<td>
			<%=rs.getString(6) %>
		</td>
		<td>
			<%=rs.getString(7) %>
		</td>
		<td>
			<%=rs.getString(8) %>
		</td>
	</tr>
	<%
			}
	}catch(Exception e){%>
	<tr>
		<td colspan="8">회원정보를 불러오지 못했습니다.</td>
	</tr>
	<%}%>
	
	</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>