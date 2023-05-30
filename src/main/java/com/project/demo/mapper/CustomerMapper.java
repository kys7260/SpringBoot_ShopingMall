package com.project.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.project.demo.domain.customer;

@Mapper
public interface CustomerMapper {
	public int loginCheck(customer ct);
	
	public void newCustomer(customer ct);
	
	public customer idByCustomer(String id);
	
	public void deleteCustomer(String id);
	
	public void updateCustomer(customer ct);
	

}
