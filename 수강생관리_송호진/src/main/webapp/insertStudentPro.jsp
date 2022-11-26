<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<%
try {
	System.out.println("성공1");
	/* [방법-2] */ 
	// 수강생 등록을 하려면 PK키의 값(=수강생 번호)이 있어야 하므로
	
		sql = "select MAX(NVL(student_no, 201800)) + 1 from student_tbl_01";
			
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		
		rs.next();
		//String student_no = rs.getString(1); //수강생번호
		int student_no = rs.getInt(1);
		
	//[방법-1] String student_no = request.getParameter("student_no");
	String student_name = request.getParameter("student_name");
	String student_addr = request.getParameter("student_addr");
	String student_phone = request.getParameter("student_phone");
	String student_birth = request.getParameter("student_birth");
	String student_email = request.getParameter("student_email");
	String student_email_sub = request.getParameter("student_email_sub"); //메일주소 select 콤보박스 value 가져옴
	String student_id = request.getParameter("student_id");
	String student_pw = request.getParameter("student_pw");
	
	sql = "insert into student_tbl_01 values(?,?,?,?,?,?,?,?)";
	
	ps = con.prepareStatement(sql);
	
	//?에 대입될 값 설정
	//[방법-1] ps.setString(1, student_no);
	ps.setInt(1, student_no); //[방법-2]
	ps.setString(2, student_name);
	ps.setString(3, student_addr);
	ps.setString(4, student_phone);
	ps.setString(5, student_birth);
	
	if(student_email.isEmpty()) { //이메일 입력하지 않은 경우 뒤에 오는 메일서버 주소 무시
		ps.setString(6, student_email);
	} else {	//이메일주소 입력된 경우 select 콤보박스에서 지정한(student_email_sub) 메일서버 주소 포함
		ps.setString(6, student_email + "@" + student_email_sub);
	}
	
	ps.setString(7, student_id);
	
	ps.setString(8, student_pw);
	
	ps.executeUpdate(); //쿼리 실행(테이블 업데이트)
	
	//성공
	%>
	<script>
		alert("수강생등록이 완료되었습니다.");
		location = "insertStudent.jsp";
	</script>
	<%
	
}catch (Exception e) {
	//실패 %>
	<script>
		alert("수강생등록을 실패했습니다.");
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