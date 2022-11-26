<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고교성적관리 프로그램</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!-- dbconn.jsp(DB 연결) + style.css -->
	<section>
		<div>
			<h2>반별평균</h2>
		</div>
		<table class="select2table" width="700px">
			<tr>
				<th>학년</th>
				<th>반</th>
				<th>교사명</th>
				<th>국어총점</th>
				<th>영어총점</th>
				<th>수학총점</th>
				<th>국어평균</th>
				<th>영어평균</th>
				<th>수학평균</th>
			</tr>
			<%
		
	 		sql = "";
		
			sql += " select syear, sclass, tname, ";
			sql += " sum(kor),sum(eng),sum(math),";
			sql += " round(avg(kor),1),round(avg(eng),1), round(avg(math),1)";
			sql += " from (	select syear, sclass, sno, sname, nvl(kor,0) as kor, nvl(eng,0) as eng, nvl(math,0) as math";
			sql += " 		from EXAMTBL_1 full outer join EXAMTBL_3 ";
			sql += " 		using(syear, sclass, sno) ";
			sql += " 		order by 1 asc, 2 asc, sno asc)	left outer join EXAMTBL_2 ";
			sql += " USING(syear, sclass) ";
			sql += " group by syear, sclass, tname";
			sql += " order by syear asc, sclass asc";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				
			%>
			
			<tr>
				
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td> 
				<td><%=rs.getString(5) %></td> 
				<td><%=rs.getString(6) %></td> 
				<td><%=rs.getString(7) %></td> 
				<td><%=rs.getString(8) %></td> 
				<td><%=rs.getString(9) %></td> 
				
			</tr>
			
			<%} %>
			
		</table>
	</section>
	<%@ include file="footer.jsp"%> <!-- DB 연결 해제 -->
</body>
</html>