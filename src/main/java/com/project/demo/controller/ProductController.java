package com.project.demo.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.project.demo.domain.product;
import com.project.demo.service.CartService;
import com.project.demo.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService service;
	
	@Autowired
	CartService cartService;
	
	@GetMapping(value="/")
	public String ShowAllProduct(Model model,HttpSession session) {
		  List<product> productList = service.ShowAllProduct();
	        model.addAttribute("productList", productList);
	        
	 
	        //메인페이지에 다시 접속했을 때 기존에 로그인 하지 않았던 상태의 장바구니 비워주는 코드
	        if(session.getAttribute("NoLoginId")!=null) {
	        	String id= (String) session.getAttribute("NoLoginId");
	        	
	        	cartService.deleteCartNologinId(id);
	        }
	        return "main";
		
	}
	//제품 상세 조회
	@GetMapping(value="/product/{product_name}")
	public String ShowProduct(@PathVariable("product_name") String product_name,Model model) {
		product pt = service.ShowProduct(product_name);
	    // 모델에 데이터 추가
	    model.addAttribute("product", pt);


	    // 상세 페이지로 이동
	    return "product_detail";
	}
	//제품을 담은 장바구니 페이지로 이동
	@GetMapping("/paycart")
	public String ShowPayCart() {
		return "paycart";
	}


	
	
}
