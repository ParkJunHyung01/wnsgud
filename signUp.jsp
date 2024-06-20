<%@ include file="connection.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
ResultSet rs = null;
String sqlInsert = "INSERT INTO USERID VALUES (?, ?)";
String sqlSelect = "SELECT * FROM USERID WHERE ID = ?";

String id = request.getParameter("id");
String passwd = request.getParameter("password");

if(id != null && passwd != null) {
    try {
        pstmt2 = conn.prepareStatement(sqlSelect);
        pstmt2.setString(1, id);
        rs = pstmt2.executeQuery();

        if (rs.next()) {
            out.println("아이디가 중복되었습니다.");
        } else {
            pstmt = conn.prepareStatement(sqlInsert);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            pstmt.executeUpdate();

            response.sendRedirect("login.jsp");
        }
        
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ignore) {}
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException ignore) {}
        }
        if (pstmt2 != null) {
            try {
                pstmt2.close();
            } catch (SQLException ignore) {}
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;

            background-color: rgb(130, 90, 204);
        }

        .head {
            padding-left: 10px;
            height: 100px;

            font-size:88px;
            font-weight: bold;

            background-color: rgb(115, 70, 200);
        }

        .head img {
            float:right;
            width:95px;
            padding-right: 5px;
        }

        ul {
            list-style-type: none;
            font-size:30px;
            font-weight: bold;

            margin-right: 30px;
        }

        li {
            text-align: center;

        }
       
        #signUp_button {
            width: 80px;
            height: 40px;

            margin-bottom: 10px;
            margin-left: 46%;

            background-color: black;
            color: white;

            font-size:15px;
        }
    </style>
</head>
<body>
    <!--헤드-->
    <div class="head">
        Sign Up
        <a href="login.jsp"><img src="image/logOut.png"></a>
    </div>

    <!--로그인창-->
    <div id="login">
        <form action="signUp.jsp" method="post" enctype="multipart/form-data">
            <ul>
                <li>User Id: <input type="text" name="id" required></li>
                <li>Password: <input type="password" name="password" required></li>
            </ul>
            <div>
                <input type="submit" id="signUp_button"value="Sign Up">
            </div>
        </form>
    </div>
</body>
</html>