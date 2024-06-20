<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LoginPage</title>
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

        ul {
            list-style-type: none;
            font-size:30px;
            font-weight: bold;

            margin-right: 30px;
        }

        li {
            text-align: center;

        }

        #login_button {
            width: 80px;
            height: 40px;

            margin-bottom: 10px;
            margin-left: 40%;

            background-color: black;
            color: white;

            font-size:15px;
        }
        
        a {
            width: 80px;
            height: 40px;

            padding: 12px;
            margin-left: 10px;
            text-decoration: none;

            background-color: black;
            color: white;

            font-size:15px;
        }
    </style>
</head>
<body>
    <!--헤드-->
    <div class="head">Login</div>

    <!--로그인창-->
    <div id="login">
        <form action="loginCheck.jsp" method="post" enctype="multipart/form-data">
            <ul>
                <li>User Id: <input type="text" name="id" required></li>
                <li>Password: <input type="password" name="password" required></li>
            </ul>
            <div>
                <input type="submit" id="login_button" value="Login">
                <a href="signUp.jsp">Sign Up</a>
            </div>
        </form>
    </div>
</body>
</html>