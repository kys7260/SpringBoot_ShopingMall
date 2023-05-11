package com.project.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.demo.domain.product;
import com.project.demo.mapper.ProductMapper;

@Service
public class ProductService {
	@Autowired
	ProductMapper mapper;
	
	//메인페이지에 상품 조회
	public List<product> ShowAllProduct() {
		return mapper.ShowAllProduct();
	}
	//세부페이지 상품 설명
	public product ShowProduct(String product_name) {
		return mapper.ShowProduct(product_name);
		
	}
}
