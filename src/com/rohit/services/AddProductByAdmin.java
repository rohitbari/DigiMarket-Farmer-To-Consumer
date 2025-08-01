package com.rohit.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rohit.dbconnect.DBConnect;
import com.rohit.model.FarmerInfo;

/**
 * Servlet implementation class AddProductByAdmin
 */
public class AddProductByAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductByAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String farmer_id = request.getParameter("farmer_id");
		String product_name = request.getParameter("product_name");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double price = Double.parseDouble(request.getParameter("price"));
		
		try{
			Connection con = DBConnect.getConnect();
				String sql = "insert into products (farmer_id, product_name, quantity, price, post_date) values (?,?,?,?,?)";
				PreparedStatement ps2 = con.prepareStatement(sql);
				ps2.setInt(1, Integer.parseInt(farmer_id));
				ps2.setString(2, product_name);
				ps2.setInt(3, quantity);
				ps2.setDouble(4, price);
				ps2.setDate(5, Date.valueOf(LocalDate.now()));
				
				int i = ps2.executeUpdate();
				if(i>0){
					System.out.println(i+ " product inserted Successfully...!!");
					response.sendRedirect("viewProductsByAdmin.jsp");
				}
				else{
					System.err.println(i+ "Failed to insert product...!!");
					response.sendRedirect("error.html");
				}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
