<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String driver = "org.mariadb.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testdb3";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, "java", "java");
Statement stmt = conn.createStatement();
String sql = "DELETE From member where id='"+id+"'";
stmt.executeQuery(sql); // 
response.sendRedirect("member_list.jsp");
%>
