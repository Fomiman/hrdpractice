<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 회원&amp;예매 관리 프로그램</title>
<script type="text/javascript">
	
</script>
</head>
<body>
<%@ include file = "header.jsp" %>
	<section>
		<div>
			<h2>영화별 예매정보 조회</h2>
		</div>
		<table border="1" width="650">
			<tr>
				<th>영화제목</th>
				<th>시청등급</th>
				<th>예매횟수</th>
			</tr>
			<%
			//예매된 영화의 제목과 시청등급
			sql = "select distinct mo_name, mo_limit";
			sql += " from movie_2 JOIN movie_3";
			sql += " USING(mo_name) order by mo_name asc";
			
			rs = stmt.executeQuery(sql);		//Statement 구문객체로 쿼리(ResultSet 에 저장)

			ResultSetMetaData rsmd = rs.getMetaData();	//쿼리 결과로 메타데이터 얻음
			
			ResultSet rs2 = null; //새 결과셋 
			
			while(rs.next()) {
			%>
			<tr align="center">
				<%for(int i = 1; i <= rsmd.getColumnCount(); i++) {%>
				<td><%=rs.getString(i)%></td>
				<%} %>
				<%
				//영화 예매횟수 계산
				sql = "select count(*)";	
				sql += " from movie_2";
				sql += " where mo_name = ?";
				
				ps = con.prepareStatement(sql);
				ps.setString(1, rs.getString("mo_name"));  //예매리스트에서 영화제목을 쿼리문에 셋팅
				rs2 = ps.executeQuery(); //예매횟수 카운트하는 쿼리 실행
				
				rs2.next();
				%>
				<td><%=rs2.getString(1)%></td> <!-- 예매횟수 -->
			</tr>
			<%} try{ if(rs2 != null) rs2.close();} catch(Exception e){e.printStackTrace();}%>
		</table>
	</section>
<%@ include file = "footer.jsp" %>
</body>
</html>