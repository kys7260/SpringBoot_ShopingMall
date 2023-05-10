package com.project.demo.controller;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.demo.domain.customer;
import com.project.demo.service.CustomerService;

@Controller
public class CustomerController {
	@Autowired
	CustomerService service;
	
	
	@GetMapping(value="/")
	public String main() {
		return "main";
	}
	
	//로그인 창
	@GetMapping(value="/login")
	public String login() {
		return "login";
	}
	
	@PostMapping(value="/loginCheck")
	public String loginCheck(customer ct, HttpSession session) {
		if(service.loginCheck(ct)==true) {
			System.out.println("성공");
			 session.setAttribute("loginId", ct.getId());
			return "redirect:/";
			
		}
		else {
			System.out.println("실패");
			return "redirect:/login";
			
		}
		
	}
	//회원가입 창
	@GetMapping(value="/new")
	public String newCustomer() {
		return "new";
	}
	
	
   @PostMapping(value="/newCheck")
   public String newCustomer(customer ct) {
	    service.newCustomer(ct);
	    System.out.println("회원가입 성공");
	    return "redirect:/";
   }
   
   //로그아웃 기능
   @PostMapping(value="/logout")
   public String logout(HttpSession session) {
	   service.logout(session);
	   System.out.println("로그아웃 성공");
	   return "redirect:/";
   }
   //마이페이지 내 정보 보이기
   @GetMapping(value="/mypage")
   public String mypage(Model model, HttpSession session) {
	   String loginId = (String)session.getAttribute("loginId");
	   
	   customer customer = service.getCustomerByLoginId(loginId);
	   String pw = customer.getPw();
	   String nickname = customer.getNick();
	   String address = customer.getAddress();
	   
	    model.addAttribute("nickname", nickname);
	    model.addAttribute("address", address);

	   
	   return "mypage";
   }
   //회원정보 수정(비동기 방식)
   @PostMapping(value="/updateCustomer")
   public String updateCustomer(customer ct) {
	 service.updateCustomer(ct);
	 service.getCustomerByLoginId(ct.getId());
	   System.out.println("성공");
	   return "redirect:/mypage";
   }
   //회원 탈퇴
   @PostMapping("/deleteCustomer")
   public String deleteCustomer(HttpSession session) {
	   String id = (String)session.getAttribute("loginId");
	   service.deleteCustomer(id);
	   session.removeAttribute("loginId");
	   return "redirect:/";
   }
  
}
