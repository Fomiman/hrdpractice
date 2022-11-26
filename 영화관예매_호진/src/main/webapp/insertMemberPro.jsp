<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<%
try {
	String me_id = request.getParameter("me_id");
	String me_pass = request.getParameter("me_pass");
	String me_name = request.getParameter("me_name");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	
	sql = "insert into movie_1 values(?,?,?,?,?,?,?)";
	
	ps = con.prepareStatement(sql);
	
	//?에 들어갈 값 설정
	ps.setString(1, me_id);
	ps.setString(2, me_pass);
	ps.setString(3, me_name);
	ps.setString(4, gender);
	ps.setString(5, birth);
	ps.setString(6, address);
	ps.setString(7, tel);
	
	//쿼리 실행
	ps.executeUpdate();
	
	//성공창
	%>
	<script>
		alert("회원등록이 완료되었습니다.");
		location.href = "insertMember.jsp";
	</script>
	<%
	
} catch(Exception e) {
	//실패창
	%>
	<script>
		alert("회원등록을 실패했습니다.");
		history.back();
	</script>
	<%
} finally { //작업 후 DB연결 해제
	try {
		if(con != null) con.close();
		if(stmt != null) stmt.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
	}catch (Exception e) {
		e.printStackTrace();
	}
}
%>