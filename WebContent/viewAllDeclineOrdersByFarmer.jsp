<%@page import="com.rohit.model.FarmerInfo"%>
<%@page import="com.rohit.dbconnect.DBConnect"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Declined Orders</title>

<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  body {
    background-color: #f1f8e9;
    padding: 30px;
  }

  .container {
    background: #fff;
    padding: 2rem;
    border-radius: 10px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
  }

  h2 {
    text-align: center;
    color: #d32f2f;
    margin-bottom: 30px;
  }

  .table th {
    background-color: #ef9a9a;
    color: #b71c1c;
  }

  .back-link {
    display: block;
    margin-top: 25px;
    text-align: center;
    text-decoration: none;
    color: #0277bd;
  }

  .back-link:hover {
    text-decoration: underline;
  }
</style>
</head>
<body>

<div class="container">
  <h2>-- Declined Orders --</h2>

  <div class="table-responsive">
    <table class="table table-bordered table-hover text-center align-middle">
      <thead>
        <tr>
          <th>Product Name</th>
          <th>Price (per item)</th>
          <th>Quantity Ordered</th>
          <th>Total Price</th>
          <th>Order Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <%
          int f_id = FarmerInfo.getF_id();
          try {
            Connection con = DBConnect.getConnect();
            String sql = "select * from products where farmer_id=?";
            PreparedStatement ps1 = con.prepareStatement(sql);
            ps1.setInt(1, f_id);
            ResultSet rs1 = ps1.executeQuery();

            while(rs1.next()) {
              int product_id = rs1.getInt(1);

              sql = "select * from orders where product_id=? and status=?";
              PreparedStatement ps2 = con.prepareStatement(sql);
              ps2.setInt(1, product_id);
              ps2.setString(2, "decline");

              ResultSet rs2 = ps2.executeQuery();
              while(rs2.next()) {
        %>
        <tr>
          <td><%=rs1.getString(3)%></td>
          <td>Rs.<%=rs1.getDouble(5)%></td>
          <td><%=rs2.getInt(4)%></td>
          <td>Rs.<%=rs1.getDouble(5) * rs2.getInt(4)%></td>
          <td><%=rs2.getDate(5)%></td>
          <td><%=rs2.getString(6)%></td>
        </tr>
        <%
              }
            }
          } catch(Exception e) {
            e.printStackTrace();
          }
        %>
      </tbody>
    </table>
  </div>

  <a href="farmerDashboard.jsp" class="back-link">Back to Dashboard</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
