<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생관리 프로그램</title>
</head>
<body>
<%@ include file = "header.jsp" %>
	<section>
		<div>
			<h3>■ 월별신청현황</h3>
		</div>
		
		<table width="250" border="1">
		<%
		sql = "select register_date, count(*) as register_cnt";
		sql += " from (select to_char(register_date, 'yyyy/mm') as register_date";
		sql += " from register_tbl_01)";
		sql += " group by register_date";
			
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		
		%>
			<tr>
				<th>신청년월</th>
				<th>수강인원</th>
			</tr>
			<%while(rs.next()) {%>
			<tr align="center">
				<td><%=rs.getString("register_date")%></td>
				<td align="right"><%=rs.getString("register_cnt")%></td>
			</tr>
			<%} %>
		</table>
		
		<div>
			<h3>■ 수강신청정보조회</h3>
		</div>
		<table width="650" border="1">
			<tr>
				<th>수강신청번호</th>
				<th>수강생</th>
				<th>과목명</th>
				<th>신청일자</th>
				<th>이수여부</th>
			</tr>
			<%
			sql = " select register_seq, '(' || student_no || ') ' || student_name as student_name, subject_seq, subject_name, register_date, register_status";
			sql += " from subject_tbl_01 JOIN (select register_seq, student_no, student_name, subject_seq, register_date, register_status";
			sql += " from register_tbl_01 JOIN (select student_no, student_name";
			sql += " from student_tbl_01) USING(student_no))";
			sql += " USING(subject_seq) order by register_seq desc";
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();	//메타데이터
			
			//총 컬럼 수만큼의 크기를 가진 배열객체 생성
			String[] regColName = new String[rsmd.getColumnCount()];
			
			//regColName에 컬럼 이름 기록
			for(int i = 1; i <= regColName.length; i++) {
				regColName[i-1] = rsmd.getColumnName(i);
			}
			
			String register_statusMsg = null; // 수강 이수여부
			
			while(rs.next()) {
				%>
				<tr>
				<%
				for(int i = 1; i <= regColName.length; i++) {
			%>
					
					<%if(!regColName[i-1].equalsIgnoreCase("subject_seq")) { %>
						<%if(!regColName[i-1].equalsIgnoreCase("register_status")) { %>
							<td <%=regColName[i-1].equalsIgnoreCase("register_seq") ||
							regColName[i-1].equalsIgnoreCase("register_date") ? "align='center'" : ""  %>>
							<%=rs.getString(i)%>
							</td>
						<%} else {
								switch(rs.getInt(i)) {	//수강이수여부 체크
								case 0:
									register_statusMsg = "신청";
									break;
								case 1:
									register_statusMsg = "완료";
									break;
								case 2:
									register_statusMsg = "취소";
									break;
									default:
									register_statusMsg = "오류";
								}
						%>
							<td align="center"><%=register_statusMsg %></td>
						<% } %>	
					<%} 
				}%>
				</tr>
			<%}	%>
				
		</table>
	</section>
<%@ include file = "footer.jsp" %>
</body>
</html>