package com.rohit.services;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rohit.dbconnect.DBConnect;
import com.rohit.model.FarmerInfo;


public class LoginFarmer extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public LoginFarmer() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			String f_email = request.getParameter("f_email");
			String f_password = request.getParameter("f_password");
			
			Connection con = DBConnect.getConnect();
			String sql = "select * from farmers where f_email=? and f_password=?";
			PreparedStatement ps1 = con.prepareStatement(sql);
			ps1.setString(1, f_email);
			ps1.setString(2, f_password);
			ResultSet rs1 = ps1.executeQuery();
			
			if(rs1.next()){
				FarmerInfo.setF_id(rs1.getInt(1));
				FarmerInfo.setF_name(rs1.getString(2));
				FarmerInfo.setF_location(rs1.getString(3));
				FarmerInfo.setF_contact(rs1.getString(4));
				FarmerInfo.setF_email(rs1.getString(5));
				
				response.sendRedirect("farmerDashboard.jsp");
				System.out.println("Farmer Login Succefully...!!");
			}
			else{
				response.sendRedirect("error.html");
				System.err.println("Farmer Login Failed...!!");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
