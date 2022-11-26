<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertScorePro</title>
</head>
<script type="text/javascript" src="function.js"></script>
<body>
	<%@ include file="header.jsp"%>
	<%
	try{
		sql = "";
		sql += "insert into score_tbl values( ?, ?, ?, ?, ?, ?, ?)";
		
		ps = con.prepareStatement(sql);
		
		ps.setString(1	, request.getParameter("studno"));
		ps.setString(2	, request.getParameter("syear"));
		ps.setString(3	, request.getParameter("m_subject1"));
		ps.setString(4	, request.getParameter("m_subject2"));
		ps.setString(5	, request.getParameter("m_subject3"));
		ps.setString(6	, request.getParameter("s_subject1"));
		ps.setString(7	, request.getParameter("s_subject2"));
		
		ps.executeUpdate();
	%>
	<script type="text/javascript">
		alert("성적등록이 완료되었습니다.");
		location = "selectScore.jsp";
	</script>
	<%
	} catch (Exception e) {
	// 0 -> 실패 알림창 = 실패하면 예외객체
	%>
	<script type="text/javascript">
		alert("성적등록이 실패했습니다.");
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