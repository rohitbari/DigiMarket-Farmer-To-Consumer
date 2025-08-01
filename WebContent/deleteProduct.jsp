<%@page import="com.rohit.dbconnect.DBConnect"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String p_id = request.getParameter("p_id");
		try{
			Connection con = DBConnect.getConnect();
			String sql = "delete from products where p_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,Integer.parseInt(p_id));
			
			int i = ps.executeUpdate();
			if(i>0){
				response.sendRedirect("viewProductsByAdmin.jsp");
			}
			else{
				response.sendRedirect("error.html");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>