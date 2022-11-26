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
			<h2>매출조회</h2>
		</div>
		<table class="select2table" width="700px">
			<tr>
				<th>등급</th>
				<th>회원번호</th>
				<th>이름</th>
				<th>구입일</th>
			</tr>
			<%
			sql = "";
			
			sql = "select ";
			//sql += " memgrade,"; //memgrade에 대해 자바로 처리 : switch문으로 "VIP"~"Normal"
			sql += " DECODE(memgrade, 1, 'VIP', 2,'Gold' ,3, 'Silver',4,'Normal') as memgrade,"; // memgrade에 대해 SQL로 처리
			sql += " memno, name, TO_CHAR(totalprice, 'L999,999,999,999') as totalprice1";
			sql += " from (select memno, sum(price*bno) as totalprice, name";
			sql += "  from member  join buy using(memno)" ;
			sql += " group by memno, name order by 2 desc)";    
			sql += " join grade on totalprice between loprice and hiprice";
			sql += " order by 4 desc";
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				/* String grade = "";
				switch(rs.getString("memgrade")){
				case "1" : grade = "VIP"; break;
				case "2" : grade = "Gold"; break;
				case "3" : grade = "Silver"; break;
				case "4" : grade = "Normal"; break;
				} */
			%>
			
			<tr>
				<%-- <td><%= grade %></td> --%>
				<td><%=rs.getString("memgrade") %></td>
				<td><%=rs.getString("memno") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("totalprice1") %></td> <!-- 가입일 : 자동입력 -->
				
			</tr>
			
			<%} %>
			
		</table>
	</section>
	<%@ include file="footer.jsp"%> <!-- DB 연결 해제 -->
</body>
</html>