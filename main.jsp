<%@ include file="connection.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% 
PreparedStatement pstmt = null;
ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <title>main</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="main_style.css">

    <script>

        function ask_delete(id) {
            let result = confirm("글을 삭제하시겠습니까?");

            if(result) {
                alert("삭제됨");
                window.location.href = "deletePost.jsp?id=" + id;
            }
        }

        function ask_edit(id) {
            let form = document.createElement("form");
                form.action = "editPost.jsp?id=" + id;
                form.method = "Post";
                form.target = "right_screen";
                document.body.appendChild(form);
                form.submit();
        }

        function logOut() {
            let result = confirm("로그 아웃 하시겠습니까?");

            if(result) {
                window.location.href = "login.jsp"
            }
        }
    </script>

</head>

<body>
    <!--헤드-->
    <div class="head"><a href="main.jsp">SNS</a>
        <a href="javascript:void(0);"><img src="image/logOut.png" onclick="logOut()"></a>
        <a href="writePost.jsp" target="right_screen"><img src="image/write.png"></a>
    </div>

    <!--왼쪽-->
    <div class="left">
        <%
        try {
            pstmt = conn.prepareStatement("select * from posts");
            rs = pstmt.executeQuery();
            while(rs.next()) {
        %>
        <div class="post">
            <b><%= rs.getString("title") %></b>
            <div id="con"> <%= rs.getString("content") %></div> 
            <div id="fil"><a href="downloadFile.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("file_name") %></a></div>
            <div>
                <a href=""><img id="heart" src="image/heart.png" onclick=""></a>
                <a href="javascript:void(0);" ><img id="icon" src="image/delete.png" onclick="ask_delete(<%= rs.getInt("id") %>)"></a>
                <a href="javascript:void(0);" target="right_screen" ><img id="icon" src="image/edit.png" onclick="ask_edit(<%= rs.getInt("id") %>)"></a>
            </div>
        </div>
            <% } %>
        <p>게시판</p> 
    </div>

    <!--오른쪽-->
    <div class="right">
        <iframe src="" name="right_screen" style="border: none"></iframe>
    </div> 
</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>