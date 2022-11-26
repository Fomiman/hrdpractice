<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbcon.jsp" %>

<%
try {
	System.out.println("성공1");
		
	String me_id = request.getParameter("me_id");
	String me_pass = request.getParameter("me_pass");
	String mo_name = request.getParameter("mo_name");
	String rm_date = request.getParameter("rm_date");
	
	sql = " select me_id, me_pass from movie_1 where me_id='"+me_id+"'";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	if(!rs.next()){
		%><script> 
		alert("아이디를 확인해주세요.");
		history.back();
		</script>
		<%
	}else if(!me_pass.equalsIgnoreCase(rs.getString(2))){
		%><script> 
		alert("비밀번호를 확인해주세요.");
		history.back();
		</script>
		<%
	}else{
	
		String sql2 = "insert into movie_2 values(?, ?, ?, ?)";
		PreparedStatement ps2 = con.prepareStatement(sql2);
		
		//?에 대입될 값 설정
		ps2.setString(1, me_id);
		ps2.setString(2, me_pass);
		ps2.setString(3, mo_name);
		ps2.setString(4, rm_date);
		
		ps2.executeUpdate(); //쿼리 실행(테이블 업데이트)
	}
	//성공
	%>
	<script>
		alert("예매가 완료되었습니다.");
		location = "inquireMember.jsp";
	</script>
	<%
	
}catch (Exception e) {
	//실패 %>
	<script>
		alert("예매를 실패했습니다.");
		history.back();
	</script>
	<%
} finally { //마지막 DB연결 해제
	try {
		if(con != null) con.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
	}catch(Exception e) {
		
	}
}
%>