<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DB_connect.jsp" %>
<%
	try{
		sql  = "insert into movie_1 values(?,?,?,?,to_date(?,'yyyy/mm/dd'),?,?) ";
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("me_id"));
		ps.setString(2, request.getParameter("me_pass"));
		ps.setString(3, request.getParameter("me_name"));
		ps.setString(4, request.getParameter("gender"));
		ps.setString(5, request.getParameter("birth"));
		ps.setString(6, request.getParameter("address"));
		ps.setString(7, request.getParameter("tel"));
		
		ps.executeUpdate();
		
		
		
		
		%>
		<script>
			alert("회원등록 성공");
			history.back();
		</script>
		<%
	} catch(Exception e) {
		%>
		<script>
			alert("회원등록 실패");
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












