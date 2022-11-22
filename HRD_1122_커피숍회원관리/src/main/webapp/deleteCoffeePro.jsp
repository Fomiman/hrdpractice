<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>

<%
String pcode =request.getParameter("pcode");
try{
	sql="delete from coffee_tbl where pcode='"+pcode+"'";
	pstmt = con.prepareStatement(sql);
	int executeSuccess = pstmt.executeUpdate();
	System.out.println("executeSuccess :"+executeSuccess);
	if(executeSuccess>0){
		%>
		<script>
		alert("상품삭제가 완료되었습니다.");
		</script>
		<%
	}
}catch(Exception e){
	%>
	<script>
	alert("상품삭제가 실패했습니다.");
	location="showCoffee.jsp";
	</script>
	<%
	System.out.println("삭제에러"+e);
	e.printStackTrace();
}finally{
	pstmt.close();
}

try{
	sql="delete from coffee_tbl2 where pcode='"+pcode+"'";
	pstmt = con.prepareStatement(sql);
	int executeSuccess2 = pstmt.executeUpdate();
	System.out.println("executeSuccess2 :"+executeSuccess2);
	if(executeSuccess2>0){
		%>
		<script>
		location="showCoffee.jsp";
		</script>
		<%
	}
}catch(Exception e){
	%>
	<script>
	location="showCoffee.jsp";
	</script>
	<%
	System.out.println("삭제에러2"+e);
}finally{
	pstmt.close();
	con.close();
}
%>