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


public class RegisterBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public RegisterBuyer() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_name = request.getParameter("b_name");
		String b_contact = request.getParameter("b_contact");
		String b_address = request.getParameter("b_address");
		String b_email = request.getParameter("b_email");
		String b_password = request.getParameter("b_password");
		
		try{
			Connection con = DBConnect.getConnect();
			
			String sql = "select * from buyers where b_email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b_email);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				System.err.println("Buyer already exists...!!");
				response.sendRedirect("error.html");
			}
			else{
				sql = "insert into buyers (b_name, b_contact, b_address, b_email, b_password) values (?,?,?,?,?)";
				PreparedStatement ps1 = con.prepareStatement(sql);
				ps1.setString(1, b_name);
				ps1.setString(2, b_contact);
				ps1.setString(3, b_address);
				ps1.setString(4, b_email);
				ps1.setString(5, b_password);
				
				int i = ps1.executeUpdate();
				if(i>0){
					System.out.println(i+ " buyer inserted Successfully...!!");
					response.sendRedirect("buyerLogin.html");
				}
				else{
					System.err.println(i+ " failed to insert buyer...!!");
					response.sendRedirect("error.html");
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
