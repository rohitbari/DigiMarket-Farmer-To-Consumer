package com.rohit.services;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rohit.dbconnect.DBConnect;

public class UpdateProductDetailsByFarmer extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public UpdateProductDetailsByFarmer() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int p_id = Integer.parseInt(request.getParameter("p_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        
        try {
            Connection con = DBConnect.getConnect();
            String sql = "update products set quantity=?, price=? where p_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setDouble(2, price);
            ps.setInt(3, p_id);
            int i = ps.executeUpdate();

            if (i > 0) {
                response.sendRedirect("viewAllProductsByFarmer.jsp");
                System.out.println("Product details updated succefully..!!");
                
            } else {
                response.sendRedirect("error.html");
                System.err.println("Failed to Update Product details..!!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
