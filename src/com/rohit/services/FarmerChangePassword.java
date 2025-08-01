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
import com.rohit.model.FarmerInfo;

public class FarmerChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FarmerChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String old_Password = request.getParameter("f_password");
		String new_password = request.getParameter("new_password");
		String confirm_password = request.getParameter("confirm_password");
		
		int f_id = FarmerInfo.getF_id();
		
			try{
				Connection con = DBConnect.getConnect();
				
				String sql = "select * from farmers where f_id=?";
				PreparedStatement ps1 = con.prepareStatement(sql);
				ps1.setInt(1, f_id);
				ResultSet rs1 = ps1.executeQuery();
				
				if(rs1.next()){
					if(rs1.getString(6).equals(old_Password) && new_password.equals(confirm_password)){
						sql = "update farmers set f_password=? where f_id=?";
						PreparedStatement ps2 = con.prepareStatement(sql);
						ps2.setString(1, new_password);
						ps2.setInt(2, f_id);
						
						int i = ps2.executeUpdate();
						if(i>0){
							System.out.println("Password Changed Successfully...!!");
							response.sendRedirect("farmerDashboard.jsp");
						}
						else{
							System.err.println("Failed to Change Password...!!");
							response.sendRedirect("error.html");
						}
					}
					else{
						System.err.println("Old Password not Matched or new Password not Confirmed...!!");
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
