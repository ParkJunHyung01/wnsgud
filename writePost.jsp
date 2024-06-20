<%@ include file="connection.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>writePost</title>
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
    <div class="head"> 새 글 작성 </div>

    <div class="main">
        <form action="uploadPost.jsp" method="post" enctype="multipart/form-data" target="__itself">
            <input type="text" name="title" placeholder="제목을 입력하시오" style="width:98%" required>
            > 내용: <textarea name="content" placeholder="입력" style="width: 98%; height: 500px; resize:none" required></textarea>
            > 파일 선택: <input type="file" name="file" style="width: 100%;"><br>
            <input type="submit" id="upload" value="업로드">
        </form>
    </div>
</body>
</html>