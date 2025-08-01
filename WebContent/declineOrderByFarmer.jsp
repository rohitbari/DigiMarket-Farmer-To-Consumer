<%@page import="com.rohit.model.OrderInfo"%>
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
		int o_id = Integer.parseInt(request.getParameter("o_id"));
		try{
			Connection con = DBConnect.getConnect();
			String sql = "update orders set status=? where o_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"decline");
			ps.setInt(2,o_id);
			
			OrderInfo.setO_id(o_id);
			
			int i = ps.executeUpdate();
			if(i>0){
				response.sendRedirect("viewAllDeclineOrdersByFarmer.jsp");
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