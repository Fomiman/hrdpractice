<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="dbconn.jsp"%>


<%

	try{
		sql="insert into EXAMTBL_3 values(?,?,?,?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("syear"));
		ps.setString(2, request.getParameter("sclass"));
		ps.setString(3, request.getParameter("sno"));
		ps.setString(4, request.getParameter("kor"));
		ps.setString(5, request.getParameter("eng"));
		ps.setString(6, request.getParameter("math"));
		ps.executeUpdate();
		System.out.println("성공1");
		//성공 알림창
		
		String sql2 ="insert into EXAMTBL_1(syear, sclass, sno) values(?,?,?)";
		ps2 = con.prepareStatement(sql2);
		ps2.setString(1, request.getParameter("syear"));
		ps2.setString(2, request.getParameter("sclass"));
		ps2.setString(3, request.getParameter("sno"));
		
		ps2.executeUpdate();
		System.out.println("성공2");
		%>
		<script type="text/javascript">
		alert("성적등록이 완료되었습니다.")	;
		location.href="insert.jsp"; // 다시 등록화면으로 돌아감
		
		</script>		
		<%
	}catch(Exception e){
		//실패 알림창
		%>
		<script type="text/javascript">
		alert("성적등록이 실패했습니다.")	;
		history.back();// history.go(-1);		
		</script>		
		<%
	}finally{
		
			try{
				if(con != null) con.close();
				if(stmt != null) stmt.close();
				if(ps != null) ps.close();
				if(ps2 != null) ps2.close();
				if(rs != null) rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
%>