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
			<h2>성적조회</h2>
		</div>
		<table class="selecttable">
			<tr>
				<th>학년-반-번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<TH>총점</TH>
				<TH>평균</TH>

			</tr>
			<%
			// UNION사용 총점수합계,평균 같이
			sql = "select  syear||'-'||sclass||'-'||sno as id , sname, ";
			sql += " decode(gender, 'M', '남', 'F', '여') as decodeGender, ";		
			sql += " kor, eng, math,";		
			sql += " SUM(kor+eng+math) as totalSum,";		
			sql += " round(SUM(kor+eng+math)/3, 1) as totalAvg";		
			sql += " from examtbl_1 left OUTER JOIN examtbl_3";		
			sql += " USING(syear, sclass, sno)";		
			sql += " GROUP BY  syear, sclass, sno, sname, gender , kor, eng, math";		

			sql += " UNION";

			sql += " select null, null, '총점수합계',sum(kor), sum(eng), sum(math), null, null";		
			sql += " from examtbl_3";		

			sql += " UNION";		

			sql += " select null, null, '총점수평균', round(avg(kor),1),round(avg(eng),1), round(avg(math),1), null, null";		
			sql += " from examtbl_3 order by 1, 2, 3 desc";		
			
			
			rs = stmt.executeQuery(sql);
			
		
			while(rs.next()){
			%>

			<tr align="center">
				<%-- <td><%=rs.getString(1) %></td> --%>
				<td><a href="update.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1)==null?" ":rs.getString(1) %></a>
				<td><%=rs.getString(2)==null?" ":rs.getString(2) %></td>
				<td><%=rs.getString(3)==null?" ":rs.getString(3) %></td>
				<!-- [java로 null 처리] -->
				<td><%=rs.getString(4)==null?" ":rs.getString(4) %></td>
				<td><%=rs.getString(5)==null?" ":rs.getString(5) %></td>
				<td><%=rs.getString(6)==null?" ":rs.getString(6) %></td>
				<td><%=rs.getString(7)==null?" ":rs.getString(7) %></td>
				<td><%=rs.getString(8)==null?" ":rs.getString(8) %></td>

			</tr>

			<%} %>
		</table>
	</section>
	<%@ include file="footer.jsp"%>
	<!-- DB 연결 해제 -->
</body>
</html>