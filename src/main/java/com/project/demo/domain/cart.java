package com.project.demo.domain;

import lombok.Data;

@Data
public class cart {
	private int cart_id;
	private String customer_id;
	private String product_name;
	private int product_count;
	private int product_price;
}
