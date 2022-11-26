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
	sql += " select * from(	select studno , sname, m_subject1, m_subject2, m_subject3, ";
	sql += " s_subject1, s_subject2,";		
	sql += " (m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2) as totalScore,";	
	sql += " round((m_subject1+ m_subject2+ m_subject3+ s_subject1+ s_subject2)/5) as avgScore";		
	sql += "	from STUDENT_TBL full outer join SCORE_TBL using(studno) ";	
	
	sql += "union all ";		
	
	sql += "　select  null,'과목 총점', ";	
	sql += " sum(m_subject1),sum(m_subject2),sum(m_subject3),sum(s_subject1),sum(s_subject2),";	
	sql += "　null, null ";	
	sql += "　from SCORE_TBL ";	
	
	sql += " 　union all";	
	
	sql += " select null, '과목 평균', ";	
	sql += " avg(m_subject1),avg(m_subject2),avg(m_subject3),avg(s_subject1),avg(s_subject2),";	
	sql += " null, null";	
	sql += " 	from SCORE_TBL )";
	sql += " order by studno asc";
	
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
					
					/*              0919[과제1] union all으로 출력              */
					if(rs.getString(1)!=null){
				%>
				<tr align="center">
					<%-- <td><%= rs.getInt(1)==null?" ":rs.getInt(1) %></td> 연산을 하려면--%>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2)==null?"":rs.getString(2) %></td> <!-- null?""O : " "X 떨어뜨리면 커서가 한칸 뒤로 밀려서 안된다. -->
					<td><%= rs.getString(3)==null?"":rs.getString(3) %></td>
					<td><%= rs.getString(4)==null?"":rs.getString(4)  %></td>
					<td><%= rs.getString(5)==null?"":rs.getString(5)  %></td>
					<td><%= rs.getString(6)==null?"":rs.getString(6)  %></td>
					<td><%= rs.getString(7)==null?"":rs.getString(7)  %></td>
					<td><%= rs.getString(8)==null?"":rs.getString(8)  %></td>
					<td><%= rs.getString(9)==null?"":rs.getString(9)  %></td>
				</tr>
				<%}else{%>	
					<tr align="center">
					<td colspan="2"><%= rs.getString(2)==null?"":rs.getString(2) %></td>
					<td><%= rs.getString(3)==null?"":rs.getString(3) %></td>
					<td><%= rs.getString(4)==null?"":rs.getString(4)  %></td>
					<td><%= rs.getString(5)==null?"":rs.getString(5)  %></td>
					<td><%= rs.getString(6)==null?"":rs.getString(6)  %></td>
					<td><%= rs.getString(7)==null?"":rs.getString(7)  %></td>
					<td colspan="2"><%= rs.getString(8)==null?"":rs.getString(8)  %></td>
					</tr>
					<%  }
				}//while%>
				
				
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>