<%@ include file="connection.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*, org.apache.commons.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
    int id = Integer.parseInt(request.getParameter("id"));
    pstmt = conn.prepareStatement("SELECT * FROM posts WHERE id = ?");
    pstmt.setInt(1, id);
    rs = pstmt.executeQuery();
    if (rs.next()) {
%>

<!DOCTYPE html>
<html>
<head>
    <title>editPost</title>
    <style>
        body {
            background-color: rgb(130, 100, 204);
            font-family: Arial, sans-serif;
            margin: 0px;
            padding: 0px;
        }

        .head {
            background-color: rgb(115, 70, 200);
            height: 30px;

            text-align: center;
            font-weight: bold;
        }

        .main {
            padding: 7px;
        }

        .main input {
            background-color: rgb(255, 255, 255);
        }

        #upload {
            background-color: rgb(64, 64, 64);
            margin-top: 10px;
            width: 100%;
      
            text-align: center;
            font-weight: bold;
            color:white;
        }
    </style>
</head>
<body>
    <div class="head"> 게시물 수정 </div>

    <div class="main">
        <form action="updatePost.jsp" method="post" enctype="multipart/form-data" target="__itself">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <input type="text" name="title" placeholder="제목을 입력하시오" style="width:98%" value="<%= rs.getString("title") %>" required>
            > 내용: <textarea name="content" placeholder="입력" style="width: 98%; height: 500px; resize:none" required><%= rs.getString("content") %></textarea>
            <div> > 기존 파일: <a href="downloadFile.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("file_name") %></a></div>
            > 새 파일 선택: <input type="file" name="newFile" style="width: 100%;"><br>
            <input type="submit" id="upload" value="수정">
        </form>
    </div>

    </form>
</body>
</html>

<%
} else {
    out.println("해당 게시물을 찾을 수 없습니다.");
}
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