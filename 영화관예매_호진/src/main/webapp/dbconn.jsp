<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8"); //한글 깨짐 방지

//1. 오라클 드라이버 로드
Class.forName("oracle.jdbc.OracleDriver");

//2. Connection 객체 생성
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

//3. 구문 객체
Statement stmt = con.createStatement();
PreparedStatement ps = null;

//4. 결과셋
ResultSet rs = null;

//5. SQL문 담길 문자열 객체

String sql = "";

%>