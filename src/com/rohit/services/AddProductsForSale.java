package com.rohit.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rohit.dbconnect.DBConnect;
import com.rohit.model.FarmerInfo;

public class AddProductsForSale extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AddProductsForSale() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String product_name = request.getParameter("product_name");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double price = Double.parseDouble(request.getParameter("price"));
		
		int f_id = FarmerInfo.getF_id();
		
		try{
			Connection con = DBConnect.getConnect();
			
			String sql = "select * from farmers where f_id=?";
			PreparedStatement ps1 = con.prepareStatement(sql);
			ps1.setInt(1, f_id);
			ResultSet rs1 = ps1.executeQuery();
			
			if(rs1.next()){
				sql = "insert into products (farmer_id, product_name, quantity, price, post_date) values (?,?,?,?,?)";
				PreparedStatement ps2 = con.prepareStatement(sql);
				ps2.setInt(1, f_id);
				ps2.setString(2, product_name);
				ps2.setInt(3, quantity);
				ps2.setDouble(4, price);
				ps2.setDate(5, Date.valueOf(LocalDate.now()));
				
				int i = ps2.executeUpdate();
				if(i>0){
					System.out.println(i+ " product inserted Successfully...!!");
					response.sendRedirect("farmerDashboard.jsp");
				}
				else{
					System.err.println(i+ "Failed to insert product...!!");
					response.sendRedirect("error.html");
				}
				
			}
			else{
				System.err.println("Farmer not found...!!");
				response.sendRedirect("error.html");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
