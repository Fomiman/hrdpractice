<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DB_connect.jsp"%>
<%
try {
	String ID = request.getParameter("me_id");
	String PW = request.getParameter("me_pass");
	String sql2 = "select me_pass from MOVIE_1 where me_id = '" + ID + "'";
	Statement stmt2 = con.createStatement();
	ResultSet rs2 = stmt2.executeQuery(sql2);

	if (!rs2.next()) {
%>
<script>
	alert("아이디가 존재하지 않습니다");
	history.back();
</script>
<%
} else if (!rs2.getString(1).equals(PW)) {
%>
<script>
	alert("비밀번호가 틀립니다");
	history.back();
</script>
<%
} else {
String mo_name[] = request.getParameterValues("mo_name");
for (int i = 0; i < mo_name.length; i++) {
	sql = "insert into movie_2 values(?,?,?,to_date(?,'yyyy/mm/dd')) ";
	ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("me_id"));
	ps.setString(2, request.getParameter("me_pass"));
	ps.setString(3, mo_name[i]);
	ps.setString(4, request.getParameter("rm_date"));
	ps.executeUpdate();
}
%>
<script>
	alert("영화 예매가 완료되었습니다.");
	history.back();
</script>
<%
}
} catch (Exception e) {
%>
<script>
	alert("영화 예매 실패");
	history.back();
</script>
<%
} finally {
try {
	if (con != null) {
		con.close();
	}
	if (stmt != null) {
		stmt.close();
	}
	if (ps != null) {
		ps.close();
	}
	if (rs != null) {
		rs.close();
	}
} catch (Exception e) {

}
}
%>












