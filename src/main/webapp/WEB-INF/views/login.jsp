<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        /* 로그인 창을 감싸는 div 요소에 스타일을 적용합니다. */
        .login-box {
            margin: 0 auto;
            margin-top: 100px;
            width: 400px;
            background-color: #f4f4f4;
            padding: 20px;
            text-align: center;
        }
        
        /* 로그인 폼 내부 요소들의 스타일을 정의합니다. */
        .login-box h2 {
            margin-top: 0;
            color: #333;
            font-weight: bold;
        }
        
        .login-box label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
            text-align: left;
        }
        
        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            border: none;
            border-radius: 4px;
            background-color: #fff;
        }
        
        .login-box input[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>로그인</h2>
        <form action="loginCheck" method="POST">
            <label for="username">아이디</label>
            <input type="text" id="id" name="id" placeholder="아이디를 입력하세요">
            
            <label for="password">비밀번호</label>
            <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
            
            <input type="submit" value="로그인">
        </form>
    </div>
</body>
</html>
    