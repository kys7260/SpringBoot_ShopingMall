package com.project.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.project.demo.domain.product;
import com.project.demo.service.ProductService;

@RestController
@Controller
public class ProductController {
	@Autowired
	ProductService service;
	
	//전체 상품 조회
	@GetMapping(value="/showAllProduct")
	public List<product> ShowAllProduct() {
	    List<product> productList = service.ShowAllProduct();
   
	    return productList;
		
	}
	//제품 상세 조회
	@GetMapping(value="/product/{product_name}")
	public String ShowProduct(@PathVariable("product_name") String product_name, Model model) {
	    product pt = service.ShowProduct(product_name);
	    model.addAttribute("product", pt);
	 
	    // 상세 페이지로 이동
	    return "product_detail";
	}


	
	
}
