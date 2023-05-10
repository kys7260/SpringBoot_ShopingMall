<%@page import="com.project.demo.domain.customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
    <style>
        body {
            background-color: #f2f2f2;
        }
        header {
            background-color: #333;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
        }
        h1 {
            font-size: 2rem;
            margin: 0;
            text-align: center;
        }
    
        main {
            max-width: 800px;
            margin: 2rem auto;
            background-color: #fff;
            padding: 2rem;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 2rem;
        }
        th, td {
            padding: 0.5rem;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        /* 회원 탈퇴 버튼 스타일 */
        .delete-button {
            display: flex;
            justify-content: center;
            margin-top: 2rem;
        }
        .delete-button button {
            width: 200px;
            padding: 1rem;
            background-color: #bbb;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<%    
	HttpSession session1 = request.getSession();
	String loginId = (String)session1.getAttribute("loginId");
	String nickname = (String)request.getAttribute("nickname");
	String address = (String)request.getAttribute("address");
	customer ct;
%>

<header>
    <h1><%= loginId %>님의 페이지</h1>
</header>

<main>
    <table>
        <tr>
            <th>아이디</th>
            <td><%= loginId %></td>
        </tr>
        <tr>
            <th>닉네임</th>
            <td><span name="nick"><%= nickname %></td>
        </tr>
        <tr>
            <th>주소</th>
            <td><span name="address"><%= address %></td>
        </tr>
    </table>
    <button onclick="showModifyForm()">회원 정보 수정</button> 
    <form id="modifyForm" style="display: none;">
  		<!-- 수정 가능한 입력 필드들 -->
  			<input type="text" id="nicknameInput" name="nicknameInput" placeholder="nick">
  			<input type="text" id="addressInput" name="addressInput" placeholder="address">
 			 <!-- 수정 버튼 -->
 			 <button onclick="modifyUserInfo()">수정</button>
</form>
    <table>
        <thead>
            <tr>
                <th>상품명</th>
                <th>가격</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>상품1</td>
                <td>1000원</td>
            </tr>
            <tr>
                <td>상품2</td>
                <td>20000원</td>
            </tr>
        </tbody>
    </table>
    
 
 
</main> 
    <div class="delete-form">
        <form action="deleteCustomer" method="POST">
            <button type="submit">회원 탈퇴</button>
        </form>
    </div>
<script>
function showModifyForm() {
	  var form = document.getElementById("modifyForm");
	  form.style.display = "block";
	}
//비동기 방식으로 처리하자 
function modifyUserInfo() {
  // 입력 필드의 값을 가져옴

  var nick = $('#nicknameInput').val();
  var address = $('#addressInput').val();


  // POST 요청 전송
  $.ajax({
    url: "updateCustomer",
    type: 'POST',
    data: {'nick':nick,'address':address},
    dataType:'json',
    success: function(result) {
      // POST 요청이 성공적으로 처리되면, 테이블 내의 표현식 값을 업데이트
      $('span[name="nick"]').text(result.nick);
      $('span[name="address"]').text(result.address);
      console.log("성공");
    },
    error: function(error) {
      // POST 요청 처리 중 에러 발생 시, 에러 처리
      console.error('Error:', error);
    }
  });
}
</script>
</body>
</html>








    
    
    
</body>
</html>
