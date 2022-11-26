<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbcon.jsp" %>
<%
try {
	System.out.println("성공1");
		
	String me_id = request.getParameter("me_id");
	String me_pass = request.getParameter("me_pass");
	String me_name = request.getParameter("me_name");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel"); //메일주소 select 콤보박스 value 가져옴
	
	sql = "insert into movie_1 values(?,?,?,?,?,?,?)";
	
	ps = con.prepareStatement(sql);
	
	//?에 대입될 값 설정
	ps.setString(1, me_id);
	ps.setString(2, me_pass);
	ps.setString(3, me_name);
	ps.setString(4, gender);
	ps.setString(5, birth);
	ps.setString(6, address);
	ps.setString(7, tel);
	
	ps.executeUpdate(); //쿼리 실행(테이블 업데이트)
	
	//성공
	%>
	<script>
		alert("회원등록이 완료되었습니다.");
		location = "insertStudent.jsp";
	</script>
	<%
	
}catch (Exception e) {
	//실패 %>
	<script>
		alert("회원등록을 실패했습니다.");
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