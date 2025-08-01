package com.rohit.model;

public class ProductInfo {
	static int p_id, quantity, farmer_id;
	static String product_name, post_date;
	
	static double price;
	public static int getP_id() {
		return p_id;
	}
	public static void setP_id(int p_id) {
		ProductInfo.p_id = p_id;
	}
	public static int getQuantity() {
		return quantity;
	}
	public static void setQuantity(int quantity) {
		ProductInfo.quantity = quantity;
	}
	public static int getFarmer_id() {
		return farmer_id;
	}
	public static void setFarmer_id(int farmer_id) {
		ProductInfo.farmer_id = farmer_id;
	}
	public static String getProduct_name() {
		return product_name;
	}
	public static void setProduct_name(String product_name) {
		ProductInfo.product_name = product_name;
	}
	public static String getPost_date() {
		return post_date;
	}
	public static void setPost_date(String post_date) {
		ProductInfo.post_date = post_date;
	}
	public static double getPrice() {
		return price;
	}
	public static void setPrice(double price) {
		ProductInfo.price = price;
	}
	
	
}
