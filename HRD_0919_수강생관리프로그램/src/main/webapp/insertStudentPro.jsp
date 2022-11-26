<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertStudentPro</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
	try{
		sql = "";
		sql += "insert into student_tbl_01 values( ?, ?, ?, ?, ?, ?, ?, ?)";
		
		ps = con.prepareStatement(sql);
		
		ps.setString(1	, request.getParameter("student_no"));
		ps.setString(2	, request.getParameter("student_name"));
		ps.setString(3	, request.getParameter("student_addr"));
		ps.setString(4	, request.getParameter("student_phone"));
		ps.setString(5	, request.getParameter("student_birth"));
		if(request.getParameter("student_email") != null){
			ps.setString(6	, request.getParameter("student_email").concat(request.getParameter("emailAddr")));
		}else {ps.setString(6	, request.getParameter("student_email")); }
		ps.setString(7	, request.getParameter("student_id"));
		ps.setString(8	, request.getParameter("student_pw"));
		
		ps.executeUpdate();
	%>
	<script type="text/javascript">
		alert("수강생등록이 완료되었습니다.");
		location = "inquireStudent.jsp";
	</script>
	<%
	} catch (Exception e) {
	// 0 -> 실패 알림창 = 실패하면 예외객체
	%>
	<script type="text/javascript">
		alert("수강생등록이 실패했습니다.");
		history.back(); // history.go(-1);
	</script>
	<%
	} finally {// 예외발생 여부와 관계없이 무조건 실행(DB연결 해제)
	//footer.jsp로 가서 복붙해오기
		try {
			if (con != null)
				con.close();
			if (stmt != null)
				stmt.close();
			if (ps != null)
				ps.close();
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	%>