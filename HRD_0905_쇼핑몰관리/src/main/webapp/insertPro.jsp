<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ※★ 중요 : DB 연결 파일 포함 -->
<%@ include file="dbconn.jsp"%>
<!-- include file : 컴파일 전에 소스 그대로 복사해서 포함시킴 -->

<%
try {
	/* [구문객체-1] Statement 사용 : SQL문에서 ? 를 사용할 수 없다. */
	String memno = request.getParameter("memno");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String hiredate = request.getParameter("hiredate");
	String gender = request.getParameter("gender");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	
	//sql = "insert into member values('"+memno+"','"+name+"','"+address+"','"+hiredate+"','"+gender+"','"+tel1+"','"+tel2+"','"+tel3+"')";
	//stmt.executeUpdate(sql); // DBMS에 sql문을 넘겨서 update 해야되기때문에 속도가 느리다.
	// 길고 복잡한데 속도도 느려서 잘 사용하지 않는 방법이다.
	
	/* [구문객체-2] PreparedStatement 사용 : SQL문에서 LIKE키워드를 사용할 경우 사용할 수 없다. */
	sql = "insert into member values(?,?,?,?,?,?,?,?)";

	ps = con.prepareStatement(sql);

	ps.setString(1, request.getParameter("memno")); // 첫번째 물음표에 들어갈 값
	ps.setString(2, request.getParameter("name"));
	ps.setString(3, request.getParameter("address"));
	ps.setString(4, request.getParameter("hiredate"));
	ps.setString(5, request.getParameter("gender"));
	ps.setString(6, request.getParameter("tel1"));
	ps.setString(7, request.getParameter("tel2"));
	ps.setString(8, request.getParameter("tel3"));

	ps.executeUpdate(); //update 성공하면 1, 실패하면 0을 리턴 // executeUpdate() 사용이유 : DML문이라서.  

	// 1 -> 성공 알림창
%>
<script type="text/javascript">
	alert("회원등록이 완료되었습니다.");
	//location.href = "insert.jsp";// ※ 주의: 반드시 문제 확인하기
	location = "insert.jsp";
	//location.href = "select.jsp";
</script>
<%
} catch (Exception e) {
// 0 -> 실패 알림창 = 실패하면 예외객체
%>
<script type="text/javascript">
	alert("회원등록이 실패했습니다.");
	//location.href = "insert.jsp";// ※ 주의: 반드시 문제 확인하기
	//location = "insert.jsp";
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






