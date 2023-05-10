<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<style>
		body {
			background-color: #f2f2f2;
			color: #333;
			font-family: Arial, sans-serif;
		}

		h1 {
			font-size: 36px;
			text-align: center;
			margin-top: 30px;
			margin-bottom: 30px;
		}

		.form-group {
			display: flex;
			flex-direction: column;
			margin-bottom: 20px;
		}

		label {
			font-size: 18px;
			margin-bottom: 5px;
		}

		input[type="text"], input[type="password"] {
			padding: 10px;
			font-size: 16px;
			border: none;
			background-color: #fff;
			color: #333;
			margin-bottom: 10px;
			border-radius: 5px;
			box-shadow: inset 0 1px 3px rgba(0,0,0,.2);
		}

		input[type="text"]::placeholder, input[type="password"]::placeholder {
			color: #aaa;
		}

		button[type="submit"] {
			padding: 10px;
			font-size: 18px;
			background-color: #000;
			color: #fff;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			display: block;
			margin: 0 auto;
		}
	</style>
</head>
<body>
	<h1>회원가입</h1>
	<form method="post" action="newCheck">
		<div class="form-group">
			<label for="username">아이디</label>
			<input type="text" id="id" name="id" placeholder="아이디를 입력하세요" required>
		</div>
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요" required>
		</div>
		<div class="form-group">
			<label for="nickname">닉네임</label>
			<input type="text" id="nick" name="nick" placeholder="닉네임을 입력하세요" required>
		</div>
		<div class="form-group">
			<label for="address">주소</label>
			<input type="text" id="address" name="address" placeholder="주소를 입력하세요" required>
		</div>
		<button type="submit">회원가입 하기</button>
	</form>
</body>
</html>

    