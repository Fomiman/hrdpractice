<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<%
try {
	String me_id = request.getParameter("me_id");
	String me_pass = request.getParameter("me_pass");
	//String mo_name = request.getParameter("mo_name");
	String[] mo_name = request.getParameterValues("mo_name");	//여러 개의 값을 선택했을 때 파라메터값 받아오는 메서드(배열)
	
	String rm_date = request.getParameter("rm_date");

	
	//sql = "select me_id, me_pass from movie_1 where me_id = '" + me_id + "' AND me_pass = '" + me_pass + "'";
	sql = "select me_id, me_pass from movie_1 where me_id = '" + me_id + "'";
	rs = stmt.executeQuery(sql);	//아이디, 비밀번호 불일치 시
	
	//과제3. 회원이 아니면 알림창("회원이 아닙니다.") 출력 후 회원등록 페이지로 이동
	//과제4. 회원아이디는 맞는데 비번을 잘못 입력하면 알림창("비밀번호가 틀렸습니다.")출력
	if(!rs.next()) { 	//쿼리값이 없다면(없는 아이디)
		%>
			<script>
				alert("회원이 아닙니다.");
				location.href = "insertMember.jsp"; //회원등록 페이지로 이동함
			</script>
		<%
		return; 	//없는 아이디 일 때 DB에 insert 하지 않고 종료.★
	}else if(!rs.getString("me_pass").equals(me_pass)) { //아이디는 일치하지만 비밀번호가 일치하지 않을 경우
		%>
			<script>
				alert("비밀번호가 일치하지 않습니다.");
				history.back();
			</script>
		<%	
		return;   //비밀번호가 일치하지 않을 때 DB에 insert 하지 않고 종료.★
	}
	
	for(int i = 0; i < mo_name.length; i++) {	//체크한 영화 수만큼 예매목록에 insert
		sql = "insert into movie_2 values(?,?,?,?)";
		
		ps = con.prepareStatement(sql);
		
		//?에 들어갈 값 설정
		ps.setString(1, me_id);
		ps.setString(2, me_pass);
		ps.setString(3, mo_name[i]);
		ps.setString(4, rm_date);
		
		//쿼리 실행
		ps.executeUpdate();
	}
	
	//성공창
	%>
	<script>
		alert("영화예매가 완료되었습니다.");
		location.href = "insertMovieBuy_multiple.jsp";
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