<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<%

try{
	sql = "delete from member_tbl_02";
	sql += " where custno = ?";
	
	ps = con.prepareStatement(sql);
	
	//? 안에 들어갈 값 설정
	
	ps.setString(1, request.getParameter("custno"));
	
	ps.executeUpdate();
	
	//성공창
	%>
	<script type="text/javascript">
		alert("회원정보삭제가 완료 되었습니다!");
		location.href = "select.jsp";
	</script>
	<%
	
} catch(Exception e) {
	//실패창
	%>
	<script type="text/javascript">
		alert("회원정보삭제를 실패 했습니다!");
		history.back();
	</script>
	<%
	
} finally {
	//★★반드시 DB연결 해제
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
	}catch(Exception e) {
		e.printStackTrace();
	}
}
%>