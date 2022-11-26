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
			sql="select '성적우수자' as 과목,";
			sql+=" count(case when m_subject1 between loscore and hiscore then 1 end) as 전공1,";
			sql+=" count(case when m_subject2 between loscore and hiscore then 1 end) as 전공2,";	
			sql+=" count(case when m_subject3 between loscore and hiscore then 1 end) as 전공3,";
			sql+=" count(case when s_subject1  between loscore and hiscore then 1 end) as 교양1,";
			sql+=" count(case when s_subject2 between loscore and hiscore then 1 end) as 교양2";
			sql+=" from score_tbl natural join (select * from grade_tbl where grade='A')";
			sql+=" union all";
			sql+=" select '재수강대상자' as subject, ";
			sql+=" count(case when m_subject1 between loscore and hiscore then 1 end),";
			sql+=" count(case when m_subject2 between loscore and hiscore then 1 end),";
			sql+=" count(case when m_subject3 between loscore and hiscore then 1 end),";
			sql+=" count(case when s_subject1  between loscore and hiscore then 1 end),";
			sql+=" count(case when s_subject2 between loscore and hiscore then 1 end)";
			sql+=" from score_tbl natural join (select * from grade_tbl where grade='F')";
			
			rs=stmt.executeQuery(sql);
			
			ResultSetMetaData rsmd=rs.getMetaData(); //jsp 책 466P쯤 참고하기
			
			%>
			<table border="1" width="500">
			  <tr align="center">
                <%
                    for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                %>
                <th><%=rsmd.getColumnName(i)%></th>
         
                <%
                    }
                %>
            </tr>
           
             <%
             while(rs.next()){
             %>
             <tr align="center">
             	<%
             	 for (int i = 1; i <= rsmd.getColumnCount(); i++) {
             		if(i==1){
             	%>
             	<th><%=rs.getString(i) %></th>
             	<% 		i++; // i를 2로 만들고 바로 아래에 있는 td를 출력하고 이 if문은 다시 사용되지 않기때문에 if~else로 반복할 필요없이 끝낸다.
             		} %>
             		
           	  	<td><%=rs.getString(i) %>명</td><!-- td이고 "명" 출력 -->
          
          
                <%
                 }
                %>
           	 </tr>
            <%
            }%>
          
		</table>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>