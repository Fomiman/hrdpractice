<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ※★ 중요 : DB 연결 파일 포함 -->
<%@ include file="dbconn.jsp"%>
<!-- include file : 컴파일 전에 소스 그대로 복사해서 포함시킴 -->

<%
try {
	

	/* [구문객체-1] Statement 사용 : SQL문에서 ? 를 사용할 수 없다. */
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	String hiddenButton = request.getParameter("hiddenButton");
	
	if(hiddenButton.equalsIgnoreCase("update")){

		/* [구문객체-2] PreparedStatement 사용 */
		sql = "update member_tbl_02 set custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno=?";

		//sql문을 매개값으로 PrepareStatement 객체 생성
		ps = con.prepareStatement(sql);

		ps.setString(1, custname);//ps.setString(2, request.getParameter("name")); // 첫번째 물음표에 들어갈 값
		ps.setString(2, phone);//ps.setString(3, request.getParameter("address"));
		ps.setString(3, address);//ps.setString(4, request.getParameter("hiredate"));
		ps.setString(4, joindate);//ps.setString(5, request.getParameter("gender"));
		ps.setString(5, grade.toUpperCase());//ps.setString(6, request.getParameter("tel1"));
		ps.setString(6, city);//ps.setString(7, request.getParameter("tel2"));
		ps.setString(7, custno);//ps.setString(8, request.getParameter("tel3"));
		
		ps.executeUpdate(); //update 성공하면 1, 실패하면 0을 리턴 // executeUpdate() 사용이유 : DML문이라서. 
	}else if (hiddenButton.equalsIgnoreCase("delete")){
		/* [구문객체-2] PreparedStatement 사용 */
		sql = "delete from member_tbl_02 where custno = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, custno); 
		
		ps.executeUpdate(); //update 성공하면 1, 실패하면 0을 리턴 // executeUpdate() 사용이유 : DML문이라서. 
	}

	 

	// 1 -> 성공 알림창
%>
<script type="text/javascript">
	alert("완료되었습니다.");
	//location.href = "insert.jsp";// ※ 주의: 반드시 문제 확인하기
	location = "selectmemberlist.jsp";
	//location.href = "select.jsp";
</script>
<%
} catch (Exception e) {
// 0 -> 실패 알림창 = 실패하면 예외객체
	%>
	<script type="text/javascript">
		alert(" 실패했습니다.");
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






