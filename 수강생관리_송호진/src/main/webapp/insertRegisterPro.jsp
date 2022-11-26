<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<%
try {
	String register_seq = request.getParameter("register_seq");
	String student_no = request.getParameter("student_no");
	
	sql = "select student_no from student_tbl_01";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	boolean studentNo_MatchCheck = false; //일치하는 수강생번호 체크 변수
	while(rs.next()) {
		if(student_no.equals(rs.getString("student_no")))
			studentNo_MatchCheck = true;
	}
	
	if(studentNo_MatchCheck) {
		String subject_seq = request.getParameter("subject_seq");
		//String register_date = request.getParameter("register_date");
		
		//수강상태 [0 : 신청, 1 : 완료, 2 : 취소]
		String register_status = request.getParameter("register_status");
		
		sql = "insert into register_tbl_01 values(?,?,?,sysdate,?)";
		
		ps = con.prepareStatement(sql);
		
		//?에 대입될 값 설정
		ps.setString(1, register_seq);
		ps.setString(2, student_no);
		ps.setString(3, subject_seq);
		//ps.setString(4, "sysdate"); //수강신청날짜엔 시분초가 들어가야함
		ps.setString(4, register_status);
	
		ps.executeUpdate(); //쿼리 실행(테이블 업데이트)
		
		//성공
		%>
		<script>
			alert("수강신청이 완료되었습니다.");
			location = "insertRegister.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("등록되지 않은 수강생번호입니다.");
			history.back();
		</script>
		<%
	}
	
}catch (Exception e) {
	//실패 %>
	<script>
		alert("수강신청을 실패했습니다.");
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