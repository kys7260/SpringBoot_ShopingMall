<%@page import="java.util.List"%>
<%@page import="com.project.demo.domain.product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쇼핑몰</title>
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
        nav a {
            color: #fff;
            margin-left: 1rem;
            text-decoration: none;
            font-weight: bold;
        }
        nav a:first-child {
            margin-left: 0;
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
    </style>
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<%    
	HttpSession session1 = request.getSession();
    String loginId = (String)session1.getAttribute("loginId");
    List<product> productList = (List<product>) request.getAttribute("productList");
%>

    <header>
        <h1>쇼핑몰</h1>
        <nav>
       <% if(loginId == null) { %>
            <a href="login">로그인</a>
            <a href="new">회원가입</a>
        <% } else { %>
               <a href="mypage">마이페이지</a>
            <a href="javascript:void(0);" onclick="logout()">로그아웃</a>
<% } %>
        </nav>
    </header>
    
    <main>
        <table id="productTable">
            <thead>
                <tr>
                	<th>이미지</th>
                    <th>상품명</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </main>
    
    
    <script type="text/javascript">
    $(document).ready(function() {
        // 페이지가 로드된 후 실행될 코드
        loadList(); // 함수 호출
    })

function loadList() {
    $.ajax({
        url: "showAllProduct", // 요청 경로
        type: "get", // 요청 방식 (GET or POST)
        dataType: "json", // 서버 반환 데이터 타입
        success: function(productList) { // 요청 성공 시 콜백 함수
            console.log('성공');
            var tbody = $('#productTable tbody'); // tbody 선택
            tbody.empty(); // tbody 초기화

            // productList를 순회하며 각 상품 정보를 테이블에 추가
            productList.forEach(function(product) {
                var row = '<tr>' +
                    '<td><img src="/images/' + product.product_image + '"></td>' +
                    '<td><a href="product/' + product.product_name + '">' + product.product_name + '</a></td>'+
                    '<td>' + product.product_price + '</td>' +
                    '</tr>';
                tbody.append(row);
            });
        },
        error: function() { // 요청 실패 시 콜백 함수
            console.log('실패');
        }
    });
}



    
  	function logout() {
   			 var form = document.createElement('form');
    			form.action = 'logout';
    			form.method = 'POST';

    			document.body.appendChild(form);
    		form.submit();
  }
  		  

</script>
</body>
</html>
