<%@page import="java.lang.reflect.Executable"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%   
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");   
   String password = request.getParameter("password");
   String name = request.getParameter("name");   
   int age = Integer.parseInt(request.getParameter("age"));
   String gender = request.getParameter("gender");
   String email = request.getParameter("email");
   String driver = "org.mariadb.jdbc.Driver";
   String url = "jdbc:mysql://localhost:3306/testdb3";
   
   Class.forName(driver);
   Connection conn =  DriverManager.getConnection(url,"java","java");      
   Statement stmt = conn.createStatement();      
   String insertsql = "INSERT INTO member(id,password,name,age,gender,email) VALUES('"+id+"','"+password+"','"+name+"','"+age+"','"+gender+"','"+email+"')";
   String sql = "SELECT * From member";   
   stmt.executeQuery(insertsql);
   ResultSet rs = stmt.executeQuery(sql);      
   conn.close();      
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>location.href="loginForm.jsp";</script>
</body>
</html>