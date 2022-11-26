<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

/************************************
switch(정수/문자/문자열을 결과로 가지는 것){
case 정수상수/'문자상수'/"문자열상수" : break;
}
*************************************/

//switch(request.getParameter("pro1")){ // [방법-1]
switch(request.getParameter("pro2")){ // [방법-2]
	case "수정" :
		try{
			// int custno = Integer.parseInt(request.getParameter("custno"));	//int 타입  = [정석방법] : 포트폴리오할때는 이 방법 사용하기
			
			sql = "update member_tbl_02 set custname = ?, phone = ?, address = ?,";
			sql += " joindate = TO_DATE(?, 'yyyy/mm/dd'), grade = upper(?), city = ?";
			sql += " where custno = ?";
			
			ps = con.prepareStatement(sql);
			
			//? 안에 들어갈 값 설정
			
			ps.setString(1, request.getParameter("custname"));
			ps.setString(2, request.getParameter("phone"));
			ps.setString(3, request.getParameter("address"));
			ps.setString(4, request.getParameter("joindate"));
			ps.setString(5, request.getParameter("grade"));
			ps.setString(6, request.getParameter("city"));
			//ps.setString(7, request.getParameter("custno"));
			ps.setInt(7, custno);	//문자열이 아닌 int 타입으로 쿼리문에 넣음
			
			ps.executeUpdate();
			
			//성공창
			%>
			<script type="text/javascript">
				alert("회원정보수정이 완료 되었습니다!");
				location.href = "select.jsp";
			</script>
			<%
			
		} catch(Exception e) {
			//실패창
			%>
			<script type="text/javascript">
				alert("회원정보수정이 실패 했습니다!");
				history.back();
			</script>
			<%
			
		} finally {
			//★★반드시 DB연결 해제
			try{
				if(con != null) {
					con.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(rs != null) {
					rs.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}//try~ catch ~finally
		
		break;
				
	case "삭제" :		
		try{
			sql = "delete from member_tbl_02";
			sql += " where custno = ?";
			
			ps = con.prepareStatement(sql);
			
			//? 안에 들어갈 값 설정
			
			ps.setString(1, request.getParameter("custno"));
			
			ps.executeUpdate();
			
			//성공창
			%>
			<script type="text/javascript">
				alert("회원정보삭제가 완료 되었습니다!");
				location.href = "select.jsp";
			</script>
			<%
			
		} catch(Exception e) {
			//실패창
			%>
			<script type="text/javascript">
				alert("회원정보삭제를 실패 했습니다!");
				history.back();
			</script>
			<%
			
		} finally {
			//★★반드시 DB연결 해제
			try{
				if(con != null) {
					con.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(rs != null) {
					rs.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}//finally
	
		break;
}//switch end
%>