<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
request.setCharacterEncoding("UTF-8");
//post 방식 글자 깨짐 방지

//1. 오라클 드라이버 로딩하기 : objdb6.jar 안에 있음
Class.forName("oracle.jdbc.OracleDriver");

//2. Connection 객체 생성
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

//3. 구문객체 생성
Statement stmt = con.createStatement(); // sql문이 없는 빈 구문객체 생성
PreparedStatement ps = null; // SQL문이 있어야만 객체 생성이 가능해서 참조없이 선언만 +)PreparedStatement는 인터페이스다.

//4. 결과셋(ResultSet) 선언 : ps나 stmt로 실행된 sql문의 조회(select)결과로 ResultSet을 리턴 받는다.
ResultSet rs = null; 

//5. 쿼리문 선언
String sql = "";//값이 없는 String 객체로 만들어두고 쓸때 sql="";로 첫줄 바꿔주고 그 뒤엔 sql += "";로 추가해서 사용
	



%>