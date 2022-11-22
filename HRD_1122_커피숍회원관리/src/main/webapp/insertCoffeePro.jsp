<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>

<%
String pcode =request.getParameter("pcode");
String pname =request.getParameter("pname");
int pcost = Integer.parseInt(request.getParameter("pcost"));

try{
	sql="insert into coffee_tbl values(?,?,?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, pcode);
	pstmt.setString(2, pname);
	pstmt.setInt(3, pcost);
	
	int executeSuccess = pstmt.executeUpdate();
	
	if(executeSuccess > 0){
		%>
		<script>
		alert("상품등록이 완료되었습니다.");
		location="showCoffee.jsp";
		</script>
		<%
	}
	
}catch(Exception e){
	%>
	<script>
	alert("상품등록이 실패했습니다.");
	history.back();
	</script>
	<%
}finally{
	pstmt.close();
}

try{
	sql="insert into coffee_tbl2 values(?,?,?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, pcode);
	pstmt.setString(2, pname);
	pstmt.setInt(3, pcost);
	
	int executeSuccess = pstmt.executeUpdate();
	
	if(executeSuccess > 0){
		%>
		<script>
		alert("상품등록이 완료되었습니다.");
		location="showCoffee.jsp";
		</script>
		<%
	}
	
}catch(Exception e){
	%>
	<script>
	alert("상품등록이 실패했습니다.");
	history.back();
	</script>
	<%
}finally{
	con.close();
	pstmt.close();
}




%>