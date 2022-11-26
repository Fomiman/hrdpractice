<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "dbconn.jsp" %>
<%@ page import="java.util.*" %>  
<%
try{
	//1.movie_1에 id가 존재하는지 ?먼저확인후. 
	//2.where =? user id에 맞는 password를 가져와서 검사한다.
	
	String me_id=request.getParameter("me_id");
	String me_pass=request.getParameter("me_pass");
	
	Map<String,String> login= new HashMap<String,String>(); // <키, 값> Entry 객체 : 키는 중복X, 값은 중복 허용
	
	sql="select me_id,me_pass from movie_1"; // 모든 회원의 아이디와 비번을 가져와
	rs=stmt.executeQuery(sql);
	
	while(rs.next()){ // HashMap에 
		login.put(rs.getString(1),rs.getString(2)); // put()으로 <키는 아이디, 값은 비번> Entry 객체 추가
	}
	
	
	if(!login.containsKey(me_id)){ // 전송된 아이디가 HashMap안에 존재하지 않으면
		%>
		<script type = "text/javascript">
		alert("회원이 아닙니다.");
		location.href = "insert.jsp";
		</script>	
	<% 
	}else{ // 전송된 아이디가 HashMap안에 존재하면
		if(!(login.get(me_id).equals(me_pass))){ // get(키:아이디)로 값(=DB에 실제로 저장되어있는 비번)을 가져와 전송된 비번과 비교하여 다르면
			%>
			<script type = "text/javascript">
			alert("비밀번호가 틀렸습니다.");
			location.href = "reservation.jsp";
			//history.back();
			</script>	
		<%
		}else{ // 실제 비밀번호와 전송된 비밀번호가 같으면
			
			//★★선택한 영화제목 여러개 : getParameterValues()메서드를 사용하여 String[] 배열객체로 가져와 
			String [] movie_select=request.getParameterValues("mo_name");
			
			
			for(int i=0;i<movie_select.length;i++){
				
				sql = "insert into movie_2 values(?,?,?,?)";
				
				ps = con.prepareStatement(sql);
				
				ps.setString(1,me_id);
				ps.setString(2,me_pass);
				ps.setString(3, movie_select[i]);
				ps.setString(4, request.getParameter("rm_date"));
				
				ps.executeUpdate();
			} //for문의 끝
				%>
				
				<script type = "text/javascript">
					alert("영화예매가 완료되었습니다.");
					location.href = "reservation.jsp";
				</script>	
				<% 
			
	
		}// 안쪽 else
	} // 바깥 else

}catch(Exception e){

%>
  
<script type = "text/javascript">
	alert("영화예매가 실패하였습니다.");
	history.back();
</script>	

<%
}finally{
	try{
		if(con != null) con.close();
		if(stmt != null) stmt.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>