<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰관리 프로그램</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!-- dbconn.jsp(DB 연결) + style.css -->
	<section>
		<div>
			<h2>회원조회</h2>
		</div>
		<table class="selecttable">
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>가입일</th>
				<th>성별</th>
				<th>전화번호</th>
				<TH>삭제</TH>
			</tr>
			<%
			sql = "select memno, name, address,";
			sql += " TO_CHAR(hiredate, 'yyyy.mm.dd'),";
			sql += " DECODE(gender, 'M','남','F','여'),";
/* 			sql += " DECODE(gender, 'M','남','F','여','성별미선택'),"; */
			sql += " tel1||'-'||tel2||'-'||tel3";
			sql += " from member";
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
			%>
			
			<tr  align="center">
				<td>
				<!-- 링크를 사용한 Get 방식으로 요청 시 : "요청url?파라미터이름1=파라미터값1 -->
				<a href="update.jsp?memno=<%=rs.getString(1) %>" ><%=rs.getString(1) %></a>
				<%-- <a href="update.jsp?memno=<%=rs.getString(1) %>&name=<%=rs.getString(2) %>" ><%=rs.getString(1) %></a> --%>
				</td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td> <!-- 가입일 : 자동입력 -->
				<td><%=rs.getString(5)==null?"":rs.getString(5) %></td>
				<td><%=rs.getString(6).equals("--")?"":rs.getString(6) %></td>
				<TD>
					<a href="deletePro.jsp?memno=<%=rs.getString(1) %>">
				 		<img alt="delete" src="./images/delete.jpg" width="30" height="30">
				 	</a>
				</TD>
			</tr>
			
			<%} %>
			
		</table>
	</section>
	<%@ include file="footer.jsp"%> <!-- DB 연결 해제 -->
</body>
</html>