<%@page import="com.project.demo.domain.product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 상세 페이지</title>
    <style>
        /* 회색과 검정색 테마 스타일 */
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
        .product-detail {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
            margin-top: 2rem;
        }
        .product-image {
            max-width: 300px;
        }
        .product-info {
            flex-grow: 1;
            margin-left: 1rem;
        }
        .product-name {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .product-price {
            font-size: 1.2rem;
            margin-top: 1rem;
        }
        .product-description {
            margin-top: 1rem;
        }
        .buttons {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 2rem;
        }
        .buttons button {
            margin: 0 0.5rem;
            padding: 0.5rem 1rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <header>
        <h1>쇼핑몰</h1>
        <nav>
            <!-- 로그인, 회원가입 버튼 등 메뉴 링크 추가 -->
        </nav>
    </header>

    <main>
        <div class="product-detail">
            <div class="product-image">
                <img src="/images/${product.product_image}">
            </div>
            <div class="product-info">
                <h2 class="product-name">${product.product_name}</h2>
                <p class="product-price">${product.product_price}</p>
                <p class="product-description">${product.product_description}</p>
            </div>
        </div>

        <div class="buttons">
            <button onclick="addToCart('${product.id}')">장바구니 담기</button>
            <button onclick="checkout('${product.id}')">결제하기</button>
        </div>
    </main>

<script>
    // 장바구니 담기 버튼 클릭 시 처리
    function addToCart(productId) {
        // 장바구니에 상품 추가 로직 구현
        // ...
    }

    // 결제하기 버튼 클릭 시 처리
    function checkout(productId) {
        // 결제 로직 구현
        // ...
    }
</script>
</body>
</html>

