<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ※★ 중요 : DB 연결 파일 포함 -->
<%@ include file="dbconn.jsp"%>
<!-- include file : 컴파일 전에 소스 그대로 복사해서 포함시킴 -->

<%
try {
	String memno = request.getParameter("memno");
	
	/* [구문객체-1] Statement 사용 : SQL문에서 ? 를 사용할 수 없다. */
	//sql = "delete from member where memno = '"+memno+"'";
	//stmt.executeUpdate(sql);
	
	/* [구문객체-2] PreparedStatement 사용 */
	sql = "delete from member where memno = ?";
	ps = con.prepareStatement(sql);
	ps.setString(1, memno);
	ps.executeUpdate();  

	// 1 -> 성공 알림창
%>
<script type="text/javascript">
	alert("회원삭제가 완료되었습니다.");
	//location.href = "insert.jsp";// ※ 주의: 반드시 문제 확인하기
	location = "select.jsp";
	//location.href = "select.jsp";
</script>
<%
} catch (Exception e) {
// 0 -> 실패 알림창 = 실패하면 예외객체
%>
<script type="text/javascript">
	alert("회원삭제가 실패했습니다.");
	//location.href = "select.jsp";// ※ 주의: 반드시 문제 확인하기
	//location = "select.jsp";
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






