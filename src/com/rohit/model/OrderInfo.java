package com.rohit.model;

public class OrderInfo {
	static int o_id, buyer_id, product_id, quantity_ordered;
	static String order_date, status;
	
	public static int getO_id() {
		return o_id;
	}
	public static void setO_id(int o_id) {
		OrderInfo.o_id = o_id;
	}
	public static int getBuyer_id() {
		return buyer_id;
	}
	public static void setBuyer_id(int buyer_id) {
		OrderInfo.buyer_id = buyer_id;
	}
	public static int getProduct_id() {
		return product_id;
	}
	public static void setProduct_id(int product_id) {
		OrderInfo.product_id = product_id;
	}
	public static int getQuantity_ordered() {
		return quantity_ordered;
	}
	public static void setQuantity_ordered(int quantity_ordered) {
		OrderInfo.quantity_ordered = quantity_ordered;
	}
	public static String getOrder_date() {
		return order_date;
	}
	public static void setOrder_date(String order_date) {
		OrderInfo.order_date = order_date;
	}
	public static String getStatus() {
		return status;
	}
	public static void setStatus(String status) {
		OrderInfo.status = status;
	}
	
	
}
