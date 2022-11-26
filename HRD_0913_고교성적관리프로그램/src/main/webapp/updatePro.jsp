<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ※★ 중요 : DB 연결 파일 포함 -->
<%@ include file="dbconn.jsp"%>
<!-- include file : 컴파일 전에 소스 그대로 복사해서 포함시킴 -->

<%
try {
	/* [구문객체-1] Statement 사용 : SQL문에서 ? 를 사용할 수 없다. */
	String syear = request.getParameter("syear");
	String sclass = request.getParameter("sclass");
	String sno = request.getParameter("sno");
	String sname = request.getParameter("sname");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");

	/* [구문객체-2] PreparedStatement 사용 */
	sql = "update EXAMTBL_1 set syear=?,sclass=?,sno=?,sname=?,birth=?,tel1=?,tel2=?,tel3=? where sname=?";
	
	//sql문을 매개값으로 PrepareStatement 객체 생성
	ps = con.prepareStatement(sql);

	ps.setString(1, syear);//ps.setString(2, request.getParameter("name")); // 첫번째 물음표에 들어갈 값
	ps.setString(2, sclass);//ps.setString(3, request.getParameter("address"));
	ps.setString(3, sno);//ps.setString(4, request.getParameter("hiredate"));
	ps.setString(4, sname);//ps.setString(5, request.getParameter("gender"));
	ps.setString(5, birth);//ps.setString(5, request.getParameter("gender"));
	ps.setString(6, gender);//ps.setString(5, request.getParameter("gender"));
	ps.setString(7, tel1);//ps.setString(6, request.getParameter("tel1"));
	ps.setString(8, tel2);//ps.setString(7, request.getParameter("tel2"));
	ps.setString(9, tel3);//ps.setString(8, request.getParameter("tel3"));
	ps.setString(10, sname);//ps.setString(1, request.getParameter("memno")); // insertPro랑 순서가 바뀐다.

	ps.executeUpdate(); //update 성공하면 1, 실패하면 0을 리턴 // executeUpdate() 사용이유 : DML문이라서.  

	// 1 -> 성공 알림창
%>
<script type="text/javascript">
	alert("회원수정이 완료되었습니다.");
	//location.href = "insert.jsp";// ※ 주의: 반드시 문제 확인하기
	location = "select.jsp";
	//location.href = "select.jsp";
</script>
<%
} catch (Exception e) {
// 0 -> 실패 알림창 = 실패하면 예외객체
%>
<script type="text/javascript">
	alert("회원수정이 실패했습니다.");
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






