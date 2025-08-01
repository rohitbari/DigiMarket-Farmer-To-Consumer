package com.rohit.dbconnect;

import java.sql.*;


public class DBConnect {
	
	public static Connection con = null;
	
	public static Connection getConnect(){
		try{
				Class.forName("org.postgresql.Driver");
				
				String url = "jdbc:postgresql://localhost:5432/marketDB";
				String uname = "postgres";
				String pass = "1234";
				con = DriverManager.getConnection(url,uname,pass);
				System.out.println("Connection Established");
			
		}
		catch(Exception e){
			System.out.println("Connection Failed...");
			e.printStackTrace();
		}
		return con;
	}
}
