<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DB_connect.jsp" %>
<%
	try{
		String mo_name[] = request.getParameterValues("mo_name");
		
		for(int i = 0; i < mo_name.length; i++) {
			sql  = "insert into movie_2 values(?,?,?,to_date(?,'yyyy/mm/dd')) ";
			ps = con.prepareStatement(sql);
			ps.setString(1, request.getParameter("me_id"));
			ps.setString(2, request.getParameter("me_pass"));
			ps.setString(3, mo_name[i]);
			ps.setString(4, request.getParameter("rm_date"));
			
			ps.executeUpdate();
		}
		
		
		
		%>
		<script>
			alert("영화 예매가 완료되었습니다.");
			history.back();
		</script>
		<%
	} catch(Exception e) {
		%>
		<script>
			alert("영화 예매 실패");
			history.back();
		</script>
		<%
	} 	
	finally {
		try{
			if(con != null) {
				con.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(ps != null) {
				ps.close();
			}
			if(rs != null) {
				rs.close();
			}
		}
		catch(Exception e){
			
		}
	
	}


%>












