<%@ page import="java.sql.*" %>

<%
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/boardDB";
String user = "root";
String password = "1234";
Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
//out.println("성공!");
%>