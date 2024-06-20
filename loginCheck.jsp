<%@ include file="connection.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String id = request.getParameter("id");
String passwd = request.getParameter("password");

PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    pstmt = conn.prepareStatement("SELECT * FROM USERID WHERE id = ? AND password = ?");
    pstmt.setString(1, id);
    pstmt.setString(2, passwd);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        response.sendRedirect("main.jsp"); 
    } else {
        response.sendRedirect("login.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
    if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
}
%>