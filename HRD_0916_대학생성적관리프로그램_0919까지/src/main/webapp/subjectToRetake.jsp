<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SubjectToRetake</title>
</head>
<script type="text/javascript" src="function.js"></script>
<body>
	<%@ include file="header.jsp"%>
	<%
	sql = "";

	/* [혜나 방법]
	// 성적 우수자
	sql =  "select count(case when loscore<=m_subject1 and m_subject1<=hiscore then 1 end) as m_subject1,";
	sql += " count(case when loscore<=m_subject2 and m_subject2<=hiscore then 1 end) as m_subject2,";
	sql += " count(case when loscore<=m_subject3 and m_subject3<=hiscore then 1 end) as m_subject3,";
	sql += " count(case when loscore<=s_subject1 and s_subject1<=hiscore then 1 end) as s_subject1,";
	sql += " count(case when loscore<=s_subject2 and s_subject2<=hiscore then 1 end) as s_subject2";
	sql += " from score_tbl natural join (select * from grade_tbl where grade='A')"; 

	여기에 UNION으로 합치면 한 테이블로 끝낼 수 있다.

	// 재수강 대상자
	sql =  "select count(case when loscore<=m_subject1 and m_subject1<=hiscore then 1 end) as m_subject1,";
	sql += " count(case when loscore<=m_subject2 and m_subject2<=hiscore then 1 end) as m_subject2,";
	sql += " count(case when loscore<=m_subject3 and m_subject3<=hiscore then 1 end) as m_subject3,";
	sql += " count(case when loscore<=s_subject1 and s_subject1<=hiscore then 1 end) as s_subject1,";
	sql += " count(case when loscore<=s_subject2 and s_subject2<=hiscore then 1 end) as s_subject2";
	sql += " from score_tbl natural join (select * from grade_tbl where grade='F')"; 
	 */
	/* 내가 해온 누더기
	sql = " SELECT grade, count(st.m_subject1) FROM SCORE_TBL st full outer join GRADE_TBL gt on st.m_subject1 between gt.loscore and hiscore group by grade having grade='A'"; 
	rs = stmt.executeQuery(sql);
	rs.next();
	String m_subject1 = rs.getString(2);

	sql = "	SELECT grade, count(st.m_subject2) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.m_subject2 between gt.loscore and hiscore group by grade having grade='A'";
	rs = stmt.executeQuery(sql);
	rs.next();
	String m_subject2 = rs.getString(2);

	sql = " SELECT grade, count(st.m_subject3) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.m_subject3 between gt.loscore and hiscore group by grade having grade='A'";
	rs = stmt.executeQuery(sql);
	rs.next();
	String m_subject3 = rs.getString(2);

	sql = " SELECT grade, count(st.s_subject1) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.s_subject1 between gt.loscore and hiscore group by grade having grade='A'";
	rs = stmt.executeQuery(sql);
	rs.next();
	String s_subject1 = rs.getString(2);

	sql = " SELECT grade, count(st.s_subject2) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.s_subject2 between gt.loscore and hiscore group by grade having grade='A'";
	rs = stmt.executeQuery(sql);
	rs.next();
	String s_subject2 = rs.getString(2);

	sql = " SELECT grade, count(st.m_subject1) FROM SCORE_TBL st full outer join GRADE_TBL gt on st.m_subject1 between gt.loscore and hiscore group by grade having grade='F'"; 
	rs = stmt.executeQuery(sql);
	rs.next();
	String m_subject1F = rs.getString(2);

	sql = "	SELECT grade, count(st.m_subject2) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.m_subject2 between gt.loscore and hiscore group by grade having grade='F'";
	rs = stmt.executeQuery(sql);
	rs.next();
	String m_subject2F = rs.getString(2);

	sql = " SELECT grade, count(st.m_subject3) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.m_subject3 between gt.loscore and hiscore group by grade having grade='F'";
	rs = stmt.executeQuery(sql);
	rs.next();
	String m_subject3F = rs.getString(2);

	sql = " SELECT grade, count(st.s_subject1) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.s_subject1 between gt.loscore and hiscore group by grade having grade='F'";
	rs = stmt.executeQuery(sql);
	rs.next();
	String s_subject1F = rs.getString(2);

	sql = " SELECT grade, count(st.s_subject2) FROM SCORE_TBL st full outer join GRADE_TBL gt  on st.s_subject2 between gt.loscore and hiscore group by grade having grade='F'";
	rs = stmt.executeQuery(sql);
	rs.next();
	String s_subject2F = rs.getString(2);
	*/
	sql = " ";

	sql += " select '성적 우수자' as subject,";
	sql += " COUNT(CASE when m_subject1 between loscore and hiscore then 1 END) as m_subject1,";
	sql += " COUNT(CASE when m_subject2 between loscore and hiscore then 1 END) as m_subject2,";
	sql += " COUNT(CASE when m_subject3 between loscore and hiscore then 1 END) as m_subject3,";
	sql += " COUNT(CASE when s_subject1 between loscore and hiscore then 1 END) as s_subject1,";
	sql += " COUNT(CASE when s_subject2 between loscore and hiscore then 1 END) as s_subject2";
	sql += " from score_tbl natural join (select * from grade_tbl where grade='A')";

	sql += " UNION all";

	sql += " select '재수강 대상자' as subject,";
	sql += " COUNT(CASE when m_subject1 between loscore and hiscore then 1 END) as m_subject1,";
	sql += " COUNT(CASE when m_subject2 between loscore and hiscore then 1 END) as m_subject2,";
	sql += " COUNT(CASE when m_subject3 between loscore and hiscore then 1 END) as m_subject3,";
	sql += " COUNT(CASE when s_subject1 between loscore and hiscore then 1 END) as s_subject1,";
	sql += " COUNT(CASE when s_subject2 between loscore and hiscore then 1 END) as s_subject2 ";
	sql += " from score_tbl natural join (select * from grade_tbl where grade='F')";

	rs = stmt.executeQuery(sql);
	//rs.next();
	%>
	<section>
		<div>
			<h2>재수강대상자</h2>
		</div>

		<table id="subjectToRetakeTable" width="800px">
			<tr>
				<th>과목</th>
				<th>전공1</th>
				<th>전공2</th>
				<th>전공3</th>
				<th>교양1</th>
				<th>교양2</th>
			</tr>
			<%-- 
			<tr align="center">
				<th>성적 우수자</th>
				<td><%=m_subject1%>명</td>
				<td><%=m_subject2%>명</td>
				<td><%=m_subject3%>명</td>
				<td><%=s_subject1%>명</td>
				<td><%=s_subject2%>명</td>

			</tr>

			<tr align="center">
				<th>재수강 우수자</th>
				<td><%=m_subject1F%>명</td>
				<td><%=m_subject2F%>명</td>
				<td><%=m_subject3F%>명</td>
				<td><%=s_subject1F%>명</td>
				<td><%=s_subject2F%>명</td>
			</tr> --%>
			<%while(rs.next()) {%>
			
			<tr align="center">
				<th><%=rs.getString(1)%></th>
				<td><%=rs.getString(2)%>명</td>
				<td><%=rs.getString(3)%>명</td>
				<td><%=rs.getString(4)%>명</td>
				<td><%=rs.getString(5)%>명</td>
				<td><%=rs.getString(2)%>명</td>

			</tr>
			<%} %>
		</table>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>