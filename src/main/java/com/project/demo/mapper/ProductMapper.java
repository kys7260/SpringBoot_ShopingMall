package com.project.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.project.demo.domain.product;

@Mapper
public interface ProductMapper {
	
	@Select("select * from product")
	public List<product> ShowAllProduct();
	
	@Select("select * from product  where product_name=#{product_name}")
	
	public product ShowProduct(String product_name);
}
