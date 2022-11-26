<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<%
//회원아이디와 비밀번호를 확인하여 회원이면 insert
try {
	//★★선택한 영화제목 여러개 : getParameterValues()메서드를 사용하여 String[] 배열객체로 가져와 
	String[] mo_name = request.getParameterValues("mo_name");
	
	// 회원아이디에 대한 비밀번호가 조회된다면 회원이라는 의미
	sql = "select me_pass from movie_1 where me_id = ?";
	ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("me_id"));
	rs = ps.executeQuery();
	
	String dbpasswd = "";
	if(rs.next()){ // 해당 아이디의 실제 비밀번호가 존재하면(즉, 회원이면)
		dbpasswd = rs.getString(1); // 해당 아이디의 실제 비밀번호를 가져와 저장
		//실제 비밀번호와 전송된 비밀번호가 같으면
		if(dbpasswd.equals(request.getParameter("me_pass"))){
			for(int i =0; i<mo_name.length;i++){
				sql = "insert into movie_2 values(?,?,?,?)";
				
				ps = con.prepareStatement(sql);
				ps.setString(1, request.getParameter("me_id"));
				ps.setString(2, request.getParameter("me_pass"));
				ps.setString(3, mo_name[i]);
				ps.setString(4, request.getParameter("rm_date"));
				int result = ps.executeUpdate();
				System.out.println(result);
			}
			%>
			<script>
			alert("영화예매가 완료되었습니다.");
			location.href = "insert2.jsp";
			</script>
			<%
		}else{
			%>
			<script>
			alert("틀린 비밀번호입니다.");
			history.back();
			</script>
			<%
		}
	}else{ // 아이디가 존재하지 않는다(즉, 회원이 아니면)
		%>
		<script>
		alert("존재하지 않는 아이디입니다.");
		history.back();
		</script>
		<%
	}
	
	
	
	
} catch(Exception e) {
	//실패창
	%>
	<script>
		alert("영화예매를 실패했습니다.");
		history.back();
	</script>
	<%
} finally { //작업 후 DB연결 해제(반드시 해제해야함)
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