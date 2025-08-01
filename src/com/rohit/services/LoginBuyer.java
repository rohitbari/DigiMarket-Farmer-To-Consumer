package com.rohit.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rohit.dbconnect.DBConnect;
import com.rohit.model.BuyerInfo;

public class LoginBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public LoginBuyer() {
        super();
    }
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String b_email = request.getParameter("b_email");
			String b_password = request.getParameter("b_password");
			
			Connection con = DBConnect.getConnect();
			String sql = "select * from buyers where b_email=? and b_password=?";
			PreparedStatement ps1 = con.prepareStatement(sql);
			ps1.setString(1, b_email);
			ps1.setString(2, b_password);
			ResultSet rs1 = ps1.executeQuery();
			
			if(rs1.next()){
				BuyerInfo.setB_id(rs1.getInt(1));
				BuyerInfo.setB_name(rs1.getString(2));
				BuyerInfo.setB_contact(rs1.getString(3));
				BuyerInfo.setB_address(rs1.getString(4));
				BuyerInfo.setB_email(rs1.getString(5));
				
				response.sendRedirect("buyerDashboard.jsp");
				System.out.println("Buyer Login Succefully...!!");
			}
			else{
				response.sendRedirect("error.html");
				System.err.println("Buyer Login Failed...!!");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
