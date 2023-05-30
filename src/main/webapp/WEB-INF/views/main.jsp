<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.net.URLEncoder"%>
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
          .product-image {
    		max-width: 200px;
    		max-height: 200px;
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
            <a href="paycart">장바구니</a>
        <% } else { %>
              <a href="mypage">마이페이지</a>
            <a href="javascript:void(0);" onclick="logout()">로그아웃</a>
            <a href="paycart">장바구니</a>
<% } %>
        </nav>
    </header>
    
    <main>
    <table>
        <thead>
            <tr>
                <th>이미지</th>
                <th>상품명</th>
                <th>가격</th>
            </tr>
        </thead>
        <tbody>
            <% for (product product : productList) { %>
                <tr>
                    <td><img  class="product-image" src="resources/images/<%=product.getProduct_image()%>" alt="Product Image"></td>
                    <td><a href="product/<%=product.getProduct_name() %>"><%=product.getProduct_name()%></a></td>
                    <td><%=product.getProduct_price() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</main>
    
      
    
    <script type="text/javascript">
  

    
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
