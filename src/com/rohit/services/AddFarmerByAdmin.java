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

/**
 * Servlet implementation class AddFarmerByAdmin
 */
public class AddFarmerByAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFarmerByAdmin() {
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
		
		String f_name = request.getParameter("f_name");
		String f_location = request.getParameter("f_location");
		String f_contact = request.getParameter("f_contact");
		String f_email = request.getParameter("f_email");
		String f_password = request.getParameter("f_password");
		
		try{
			Connection con = DBConnect.getConnect();
			
			String sql = "select * from farmers where f_email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, f_email);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				System.err.println("Farmer already exists...!!");
				response.sendRedirect("error.html");
			}
			else{
				sql = "insert into farmers (f_name, f_location, f_contact, f_email, f_password) values (?,?,?,?,?)";
				PreparedStatement ps1 = con.prepareStatement(sql);
				ps1.setString(1, f_name);
				ps1.setString(2, f_location);
				ps1.setString(3, f_contact);
				ps1.setString(4, f_email);
				ps1.setString(5, f_password);
				
				int i = ps1.executeUpdate();
				if(i>0){
					System.out.println(i+ " farmer inserted Successfully...!!");
					response.sendRedirect("viewFarmersByAdmin.jsp");
				}
				else{
					System.err.println(i+ " failed to insert farmer...!!");
					response.sendRedirect("error.html");
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
