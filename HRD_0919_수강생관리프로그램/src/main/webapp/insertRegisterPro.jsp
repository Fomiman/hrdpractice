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
		String  register_seq = request.getParameter("register_seq");
		sql = "";
		sql += "select STUDENT_NO from STUDENT_TBL_01 where STUDENT_NO='"+register_seq+"'";
		rs = stmt.executeQuery(sql);
		rs.next();
		
		if(rs.getString(1) != null){
		
			sql = "";
			sql += "insert into REGISTER_TBL_01 values( ?, ?, ?, ?, ?)";
					
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1	, register_seq);
			ps.setString(2	, request.getParameter("student_no"));
			ps.setString(3	, request.getParameter("subject_seq"));
			ps.setString(4	, request.getParameter("register_date"));
			ps.setString(5	, request.getParameter("register_status"));
		
			ps.executeUpdate();
		}else{%>
			<script type="text/javascript">
				alert("등록되지 않은 수강생번호입니다.");
				history.back(); 
			</script>
		<%}
		
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