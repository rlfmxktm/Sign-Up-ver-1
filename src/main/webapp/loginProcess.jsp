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
   String driver = "org.mariadb.jdbc.Driver";
   String url = "jdbc:mysql://localhost:3306/testdb3";
   
   Class.forName(driver);
   Connection conn =  DriverManager.getConnection(url,"java","java");      
   Statement stmt = conn.createStatement();   
   
   String sql = "SELECT * From member";   
   
   ResultSet rs = stmt.executeQuery(sql);   
   while(rs.next()){
      String id1 = rs.getString(1);      
      String password1 = rs.getString(2);
      String name = rs.getString(3);
      if(id1.equals(id)&&password1.equals(password)){
         session.setAttribute("id", name);
         response.sendRedirect("main.jsp");
      }
   }   
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