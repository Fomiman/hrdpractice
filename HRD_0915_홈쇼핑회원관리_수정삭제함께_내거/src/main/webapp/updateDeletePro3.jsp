<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ※★ 중요 : DB 연결 파일 포함 -->
<%@ include file="dbconn.jsp"%>
<!-- include file : 컴파일 전에 소스 그대로 복사해서 포함시킴 -->

<%
try {
	if (!request.getParameter("submitButton").equalsIgnoreCase("delete")) {
		try {

	/* [구문객체-1] Statement 사용 : SQL문에서 ? 를 사용할 수 없다. */
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");

	/* [구문객체-2] PreparedStatement 사용 */
	sql = "update member_tbl_02 set custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno=?";

	//sql문을 매개값으로 PrepareStatement 객체 생성
	ps = con.prepareStatement(sql);

	ps.setString(1, custname);// 첫번째 물음표에 들어갈 값
	ps.setString(2, phone);
	ps.setString(3, address);
	ps.setString(4, joindate);
	ps.setString(5, grade.toUpperCase());
	ps.setString(6, city);
	ps.setString(7, custno);

	//sql = "delete from member_tbl_02 where custno = ?";
	//ps = con.prepareStatement(sql);
	//ps.setString(1, custno);

	ps.executeUpdate(); //update 성공하면 1, 실패하면 0을 리턴 // executeUpdate() 사용이유 : DML문이라서.  

	// 1 -> 성공 알림창
%>
<script type="text/javascript">
	alert("완료되었습니다.");
	location = "selectmemberlist.jsp";
</script>
<%
} catch (Exception e) {
// 0 -> 실패 알림창 = 실패하면 예외객체
%>
<script type="text/javascript">
	alert("실패했습니다.");
	history.back(); // history.go(-1);
</script>

<%
}
} else if (request.getParameter("submitButton").equalsIgnoreCase("delete")) {
try {
String custno = request.getParameter("custno");

/* [구문객체-1] Statement 사용 : SQL문에서 ? 를 사용할 수 없다. */
//sql = "delete from member where memno = '"+memno+"'";
//stmt.executeUpdate(sql);

/* [구문객체-2] PreparedStatement 사용 */
sql = "delete from member_tbl_02 where custno = ?";
ps = con.prepareStatement(sql);
ps.setString(1, custno);
ps.executeUpdate();

// 1 -> 성공 알림창
%>
<script type="text/javascript">
	alert("회원삭제가 완료되었습니다.");
	location = "selectmemberlist.jsp";
</script>
<%
} catch (Exception e) {
// 0 -> 실패 알림창 = 실패하면 예외객체
%>
<script type="text/javascript">
	alert("회원삭제가 실패했습니다.");
	//location.href = "select.jsp";// ※ 주의: 반드시 문제 확인하기
	//location = "select.jsp";
	history.back(); // history.go(-1);
</script>
<%
}

}
	
} catch (Exception e) {
e.printStackTrace();
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






