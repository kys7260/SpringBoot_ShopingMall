package com.project.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.demo.domain.product;
import com.project.demo.domain.cart;
import com.project.demo.domain.customer;
import com.project.demo.service.CartService;

@RestController
public class CartController {
	@Autowired
	CartService service;
	
	@PostMapping(value="/product/addtocart")
	public void addTocart(HttpSession session,@RequestBody product product) {
		String id = (String)session.getAttribute("loginId");
		if(id != null) {
			//로그인한 상태일 때 장바구니 구현 
		service.addTocart(product, id);
		}else {
			//로그인 안한 상태에서 장바구니 상품 추가 구현
			String noLoginId = "NoLogin";
			session.setAttribute("NoLoginId",noLoginId);
			System.out.println(session.getAttribute("NoLoginId"));
			service.addTocartNoLogin(product, noLoginId);
			
		}
	}
	
	@GetMapping("/showCart")
	public List<cart> showCart(HttpSession session){
		List<cart> ct;
		String id = (String)session.getAttribute("loginId");
		if(id == null) {
			 String noLoginId = (String) session.getAttribute("NoLoginId");
		    ct =service.showCartLogin(noLoginId);
		    
		    
		}
		else {
			ct =service.showCartLogin(id);
		
		}
		return ct;
	}
	@PostMapping("/deleteCartProduct")
	public void deleteCart(String cart_id) {
		service.deleteCart(cart_id);
		
	}
	

}
	

