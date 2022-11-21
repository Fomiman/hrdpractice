<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="dbcon.jsp" %>

<%
try{
String w_workno = request.getParameter("w_workno");
String p_p1 = request.getParameter("p_p1");
String p_p2 = request.getParameter("p_p2");
String p_p3 = request.getParameter("p_p3");
String p_p4 = request.getParameter("p_p4");
String p_p5 = request.getParameter("p_p5");
String p_p6 = request.getParameter("p_p6");
String w_lastdate = request.getParameter("w_lastdate");
String w_lasttime = request.getParameter("w_lasttime");

//[방법-1] Statement 객체 이용 : 적는 방식이 번거롭고 오류난 곳을 찾기에 직관적이지 않아서 불편하다.
//stmt = con.createStatement();
//stmt.executeQuery("insert into tbl_process values("+w_workno+", "+p_p1+", "+p_p2+", "+p_p3+", "+p_p4+", "+p_p5+", "+p_p6+", "+w_lastdate+", "+w_lasttime+")");

//[방법-2] PrepareStatement 객체 이용 
sql="";
sql+=" insert into tbl_process values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
ps = con.prepareStatement(sql);

ps.setString(1, w_workno);
ps.setString(2, p_p1);
ps.setString(3, p_p2);
ps.setString(4, p_p3);
ps.setString(5, p_p4);
ps.setString(6, p_p5);
ps.setString(7, p_p6);
ps.setString(8, w_lastdate);
ps.setString(9, w_lasttime);

ps.executeUpdate();

%>
<script>
	alert("공정상태가 정상적으로 등록 되었습니다.");
	location.href="workprocessLookup.jsp";
</script>
<%
}catch(Exception e ){
	%>
	<script>
		alert("공정상태 등록이 실패했습니다.");
		history.back();
	</script>
	<%
}finally{
	try{
		if(con != null) con.close();
		if(stmt != null) stmt.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
		/* dbcon.jsp에서 만든 4가지 DB연결&이용하는 객체들 닫아준다. */
	}catch(Exception e){ 
		e.printStackTrace();
		/* 기본적인 오류메세지로 설정해뒀다. 나중에 따로 뭔가를 써서 바꾸는지는 아직 모름*/
	}
}	%>
