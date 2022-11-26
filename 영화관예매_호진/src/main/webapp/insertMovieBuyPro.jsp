<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<%
try {
	String me_id = request.getParameter("me_id");
	String me_pass = request.getParameter("me_pass");
	String mo_name = request.getParameter("mo_name");
	String rm_date = request.getParameter("rm_date");

	
	sql = "select me_id, me_pass from movie_1 where me_id = '" + me_id + "' AND me_pass = '" + me_pass + "'";
	rs = stmt.executeQuery(sql);	//아이디, 비밀번호 불일치 시
	
	if(!rs.next()) {
		%>
			<script>
			alert("아이디나 비밀번호가 일치하지 않습니다.");
			history.back();
			</script>
		<%
	}
	
	sql = "insert into movie_2 values(?,?,?,?)";
	
	ps = con.prepareStatement(sql);
	
	//?에 들어갈 값 설정
	ps.setString(1, me_id);
	ps.setString(2, me_pass);
	ps.setString(3, mo_name);
	ps.setString(4, rm_date);
	
	//쿼리 실행
	ps.executeUpdate();
	
	//성공창
	%>
	<script>
		alert("영화예매가 완료되었습니다.");
		location.href = "insertMovieBuy.jsp";
	</script>
	<%
	
} catch(Exception e) {
	//실패창
	%>
	<script>
		alert("영화예매를 실패했습니다.");
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