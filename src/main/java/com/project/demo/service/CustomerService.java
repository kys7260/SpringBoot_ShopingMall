package com.project.demo.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.demo.domain.customer;
import com.project.demo.mapper.CustomerMapper;

@Service
public class CustomerService {
	@Autowired
	CustomerMapper mapper;
	
	//로그인 되는 지 안되는 지 체크
	public boolean loginCheck(customer ct) {

		    int cnt = mapper.loginCheck(ct);
			if(cnt>0) {
				return true; 
			}
			else {
				return false;
			}
			
	}
	
	public void newCustomer(customer ct) {
		mapper.newCustomer(ct);
	}
	
	//로그아웃 기능 구현
	public void logout(HttpSession session) {
		session.invalidate();
		
	}
	
	//마이페이지에서 해당 아이디 객체 반환해주는 코드
	public customer getCustomerByLoginId(String id) {
		customer ct = mapper.idByCustomer(id);
		return ct;
	}
	
	//회원정보 수정 기능
	public void updateCustomer(customer ct) {
		mapper.updateCustomer(ct);
	}
	
	//회원 탈퇴 기능
	public void deleteCustomer(String id) {
		mapper.deleteCustomer(id);
	}
}
