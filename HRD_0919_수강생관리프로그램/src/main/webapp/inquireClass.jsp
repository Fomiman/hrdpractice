<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생목록조회/수정</title>
</head>
<body>
<%@include file="header.jsp" %>
	<%
	sql = "";
	
	sql += " select to_char(register_date, 'yyyy/mm') , count(register_date)"; 
	sql += " from REGISTER_TBL_01";
	sql += " group by to_char(register_date, 'yyyy/mm')";
	
	rs = stmt.executeQuery(sql);
	
	%>
	<section>
	<div>
		<table id="inquireClassTable1">
			<caption>■ 월별신청현황</caption>
			<tr>
				<td>신청년월</td><td>수강인원</td>
			</tr>
			<% while(rs.next()){ %>
			<tr>
				<td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td>
			</tr>
			<%} %>
		</table>
		
		<table id="inquireClassTable2">
			<caption>■ 수강신청정보조회</caption>
			<tr >
				<td>수강신청번호</td><td>수강생</td><td>과목명</td><td>신청일자</td><td>이수여부</td>
			</tr>
			<% 
			sql ="";
			sql +=" select REGISTER_SEQ, STUDENT, SUBJECT_NAME, REGISTER_DATE,"; 
			sql +=" decode(REGISTER_STATUS, '0','신청','1','완료','2','취소','이수여부 값이 잘못입력되었습니다.' ) as REGISTER_STATUS";
			sql +=" from SUBJECT_TBL_01 join (select REGISTER_SEQ,"; 
			sql +=" '('||STUDENT_NO||') '||STUDENT_NAME as STUDENT,";							 
			sql +=" REGISTER_DATE, REGISTER_STATUS , SUBJECT_SEQ ";	// SUBJECT_SEQ는 테이블2와 조인용으로 써준다.
			sql +=" from STUDENT_TBL_01 full outer join REGISTER_TBL_01";						
			sql +=" using(student_no))";						
			sql +=" using(SUBJECT_SEQ) order by REGISTER_SEQ desc";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){ %>
			<tr >
				<td><%=rs.getString(1) %></td>
				<td class="alignLeft"><%=rs.getString(2) %></td>
				<td class="alignLeft"><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
			</tr>
			<%} %>
		</table>	
		</div>	
	</section>
<%@include file="footer.jsp" %>
</body>
</html>