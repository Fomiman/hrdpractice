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
			<h2>회원목록조회/수정</h2>
		</div>
		<table class="selecttable" width=900px>
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
			sql = "select CUSTNO,custname,PHONE,ADDRESS,TO_CHAR(joindate, 'yyyy-mm-dd') as joindate,";
			sql += " decode(GRADE, 'A', 'VIP', 'B', '일반', 'C', '직원'),";
			sql += " CITY from member_tbl_02";
			sql += " order by 1";
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
			%>
			
			<tr  align="center">
				<td>
				<!-- 링크를 사용한 Get 방식으로 요청 시 : "요청url?파라미터이름1=파라미터값1 -->
				<a href="updateDelete.jsp?custno=<%=rs.getString("custno") %>" class="linkToUpdate"><%=rs.getString("custno") %></a>
				</td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td> 
				<td><%=rs.getString(5)==null?"":rs.getString(5) %></td>
				<td><%=rs.getString(6)==null?"":rs.getString(6) %></td>
				<td><%=rs.getString(7)==null?"":rs.getString(7) %></td>
				
			</tr>
			
			<%} %>
			
		</table>
	</section>
	<%@ include file="footer.jsp"%> <!-- DB 연결 해제 -->
</body>
</html>