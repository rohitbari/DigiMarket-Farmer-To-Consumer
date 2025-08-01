package com.rohit.services;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rohit.dbconnect.DBConnect;
import com.rohit.model.BuyerInfo;
import com.rohit.model.ProductInfo;

public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PlaceOrder() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int p_id = Integer.parseInt(request.getParameter("p_id"));
        int quantityOrdered = Integer.parseInt(request.getParameter("quantity"));
		int b_id = BuyerInfo.getB_id();
		
		try{
			Connection con = DBConnect.getConnect();
            String sql = "select * from products where p_id=?";
            PreparedStatement ps1 = con.prepareStatement(sql);
            ps1.setInt(1,p_id);
            ResultSet rs1 = ps1.executeQuery();
            
            if(rs1.next()){
            	int availableQuantity = rs1.getInt(4);
            	if(availableQuantity >= quantityOrdered){
            		sql = "insert into orders (buyer_id, product_id, quantity_ordered, order_date, status) values (?,?,?,?,?)";
            		PreparedStatement ps2 = con.prepareStatement(sql);
            		ps2.setInt(1, b_id);
            		ps2.setInt(2, p_id);
            		ps2.setInt(3, quantityOrdered);
            		ps2.setDate(4, Date.valueOf(LocalDate.now()));
            		ps2.setString(5, "pending");
            		int i = ps2.executeUpdate();
            		
            		sql = "update products set quantity=? where p_id=?";
            		PreparedStatement ps3 = con.prepareStatement(sql);
            		ps3.setInt(1, (rs1.getInt(4) - quantityOrdered));
            		ps3.setInt(2, p_id);
            		int j = ps3.executeUpdate();
            		
            		if(i>0 && j>0){
            			response.sendRedirect("myOrders.jsp");
            		}
            		else{
            			response.sendRedirect("error.html");
                    	System.err.println("Failed to Ordered...!!");
            		}
            		
            	}
            	else{
                	response.sendRedirect("error.html");
                	System.err.println("Not Enough Quantity Availabel...!!");
                }
            }
            else{
            	response.sendRedirect("error.html");
            	System.err.println("Product Not Found...!!");
            }
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
