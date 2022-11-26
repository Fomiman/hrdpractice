<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SelectScore</title>
</head>
<script type="text/javascript" src="function.js"></script>
<body>
	<%@ include file="header.jsp"%>
	<%
	sql = "";
	sql += " select studno , sname, m_subject1, m_subject2, m_subject3, ";
	sql += " s_subject1, s_subject2,";
	sql += " (m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2) as totalScore,";
	sql += " (m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2)/5 as avgScore";
	sql += " from STUDENT_TBL full outer join SCORE_TBL using(studno) order by 1";
	
	rs = stmt.executeQuery(sql);
	%>
	<section>
		<form action="selectScorePro.jsp" name="f" method="post">
			<div>
				<h2>재수강대상자</h2>
			</div>
			
			<table id="selectScoreTable" width="800px">
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>전공1</th>
					<th>전공2</th>
					<th>전공3</th>
					<th>교양1</th>
					<th>교양2</th>
					<th>학생총점</th>
					<th>학생평균</th>
				</tr>
				<%
				
				while(rs.next()){
				%>
				<tr align="center">
					<td><%= rs.getString(1)==null?" ":rs.getString(1) %></td>
					<td><%= rs.getString(2)==null?" ":rs.getString(2) %></td>
					<td><%= rs.getString(3)==null?" ":rs.getString(3) %></td>
					<td><%= rs.getString(4)==null?" ":rs.getString(4)  %></td>
					<td><%= rs.getString(5)==null?" ":rs.getString(5)  %></td>
					<td><%= rs.getString(6)==null?" ":rs.getString(6)  %></td>
					<td><%= rs.getString(7)==null?" ":rs.getString(7)  %></td>
					<td><%= rs.getString(8)==null?" ":rs.getString(8)  %></td>
					<td><%= rs.getString(9)==null?" ":rs.getString(9)  %></td>
				</tr>
				<%} 
				sql = "select studno,";
				sql+=" sum(m_subject1),sum(m_subject2),sum(m_subject3),sum(s_subject1),sum(s_subject2),";
				sql+=" avg(m_subject1),avg(m_subject2),avg(m_subject3),avg(s_subject1),avg(s_subject2)";
				sql+=" from STUDENT_TBL join SCORE_TBL using(studno) group by studno order by 1";
				/* 따로 만든 조인테이블이라서 총점과 평균을 따로 null처리 해줄 필요 없다. */
				rs = stmt.executeQuery(sql);
				rs.next();
				%>
				<tr align="center">
					<th colspan="2">과목 총점</th>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
					<td><%= rs.getString(4) %></td>
					<td><%= rs.getString(5) %></td>
					<td><%= rs.getString(6) %></td>
					<td colspan="2"></td>
				</tr>
				<tr align="center">
					<th colspan="2">과목 평균</th>
					<td><%= rs.getString(7) %></td>
					<td><%= rs.getString(8) %></td>
					<td><%= rs.getString(9) %></td>
					<td><%= rs.getString(10) %></td>
					<td><%= rs.getString(11) %></td>
					<td colspan="2"></td>
				</tr>
				
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>