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
    	.product-image img {
   			 max-width: 100%;
   			 max-height: 100%;
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>

<%    
	HttpSession session1 = request.getSession();
    String loginId = (String)session1.getAttribute("loginId");
    product pt =(product)request.getAttribute("product");
%>
    <header>
        <h1>쇼핑몰</h1>
        <nav>
          <% if(loginId == null) { %>
            <a href="/shoping/login">로그인</a>
            <a href="/shoping/new">회원가입</a>
            <a href="/shoping/paycart">장바구니</a>
        <% } else { %>
               <a href="/shoping/mypage">마이페이지</a>
            <a href="javascript:void(0);" onclick="logout()">로그아웃</a>
            <a href="/shoping/paycart">장바구니</a>
<% } %>
        </nav>
    </header>
    
    <main>
        <div class="product-detail">
            <div class="product-image">
   			 <img src="${pageContext.request.contextPath}/resources/images/${product.product_image}">
			</div>
            <div class="product-info">
                <h2 class="product-name">${product.product_name}</h2>
                <p class="product-price">${product.product_price}</p>
                <p class="product-description">${product.product_info}</p>
            </div>
        </div>

   <div class="buttons">
  	
    	<button onclick="addToCart(cart_product)">장바구니 담기</button>
   	    <button onclick="checkout('<%= pt %>');">결제하기</button>
   	    
   	    
   	    

</div>
   
    </main>

<script>
function logout() {
			 var form = document.createElement('form');
			form.action = 'logout';
			form.method = 'POST';

			document.body.appendChild(form);
		form.submit();
}


//서버로 보낼 장바구니 데이터
const cart_product = { 
    product_name: '${product.product_name}',
    product_price: '${product.product_price}',
    product_image:'${product.product_image}'
}


    // 장바구니 담기 버튼 클릭 시 처리
  function addToCart(cart_product) {
  // 사용자로부터 확인을 받기 위한 팝업 창 표시
  var confirmResult = confirm(cart_product.product_name  + '을(를) 장바구니에 담으시겠습니까?');
  
  // 사용자가 확인을 선택한 경우에만 장바구니에 상품을 담는 요청을 서버로 전송
  if (confirmResult) {
    // AJAX 또는 기타 방법을 사용하여 서버에 요청을 보낼 수 있습니다.
    // 예시: jQuery의 AJAX를 사용한 예시
    $.ajax({
      url: 'addtocart',
      method: 'POST',
      data: JSON.stringify(cart_product),
      contentType: 'application/json',
      success: function(response) {
        // 서버 응답을 받았을 때 수행할 동작
        console.log(response);
        alert('장바구니에 담기 성공했습니다.');
      },
      error: function(xhr, status, error) {
        // 요청 실패 시 수행할 동작
     
        alert('실패');
      }
    });
  }
}

function checkout(product) {
    // Convert the product object to JSON and store it in localStorage
    localStorage.setItem('productData', JSON.stringify(product));
    console.log(product)
    // Redirect to the new page
    window.location.href = 'payorder';
  }

</script>
</body>
</html>

