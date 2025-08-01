package com.rohit.services;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rohit.dbconnect.DBConnect;

public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginAdmin() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			String aemail = request.getParameter("aemail");
			String apassword = request.getParameter("apassword");
			
			Connection con = DBConnect.getConnect();
			
			if(aemail.equals("admin@gmail.com") && apassword.equals("admin")){
				response.sendRedirect("adminDashboard.jsp");
				System.out.println("Admin Login Succefully...!!");
			}
			else{
				response.sendRedirect("error.html");
				System.err.println("Admin Login Failed...!!");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
