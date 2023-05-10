package com.project.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.demo.domain.product;

@Mapper
public interface ProductMapper {
	
	public product ShowAllProduct();
}
