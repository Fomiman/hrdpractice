<%@page import="java.lang.Thread.State"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String url= "jdbc:oracle:thin:@localhost:1521:xe";

Class.forName("oracle.jdbc.OracleDriver");

Connection con = DriverManager.getConnection(url,"system","1234");

Statement stmt = con.createStatement();

PreparedStatement ps = null;

ResultSet rs = null;

String sql = "";

%>
