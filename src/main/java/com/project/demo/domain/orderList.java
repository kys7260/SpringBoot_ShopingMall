package com.project.demo.domain;

import lombok.Data;

@Data
public class orderList {
	private int order_id;
	private String customer_id;
	private String product_name;
	private int product_count;
	private int product_price;
	private String orderDate;
	private String orderSituation; //배송중, 준비중, 배송완료 
}
