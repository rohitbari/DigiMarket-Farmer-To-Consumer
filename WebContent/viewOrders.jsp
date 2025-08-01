<%@page import="com.rohit.model.FarmerInfo"%>
<%@page import="com.rohit.dbconnect.DBConnect"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Orders - DigiMarket</title>

<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  body {
    background-color: #f1f8e9;
    font-family: 'Segoe UI', sans-serif;
    padding: 40px;
  }

  .container {
    background: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.1);
  }

  h2 {
    text-align: center;
    color: #388e3c;
    margin-bottom: 30px;
  }

  .table thead {
    background-color: #c8e6c9;
    color: #2e7d32;
  }

  .btn-action {
    padding: 6px 12px;
    font-size: 0.9rem;
    border-radius: 6px;
    text-decoration: none;
    color: #fff;
  }

  .btn-confirm {
    background-color: #388e3c;
  }

  .btn-confirm:hover {
    background-color: #2e7d32;
  }

  .btn-decline {
    background-color: #e53935;
  }

  .btn-decline:hover {
    background-color: #c62828;
  }

  .back-link {
    display: block;
    margin-top: 25px;
    text-align: center;
    color: #0277bd;
    text-decoration: none;
  }

  .back-link:hover {
    text-decoration: underline;
  }
</style>

</head>
<body>

  <div class="container">
    <h2>-- Orders --</h2>

    <div class="table-responsive">
      <table class="table table-bordered table-hover text-center align-middle">
        <thead>
          <tr>
            <th>Product Name</th>
            <th>Price (per item)</th>
            <th>Quantity Ordered</th>
            <th>Total Price</th>
            <th>Order Date</th>
            <th>Confirm Order</th>
            <th>Decline Order</th>
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
                ps2.setString(2, "pending");
                ResultSet rs2 = ps2.executeQuery();

                while(rs2.next()) {
          %>
          <tr>
            <td><%= rs1.getString(3) %></td>
            <td><%= rs1.getDouble(5) %></td>
            <td><%= rs2.getInt(4) %></td>
            <td><%= rs1.getDouble(5) * rs2.getInt(4) %></td>
            <td><%= rs2.getDate(5) %></td>
            <td><a href="confirmOrderByFarmer.jsp?o_id=<%= rs2.getInt(1) %>" class="btn-action btn-confirm">Confirm</a></td>
            <td><a href="declineOrderByFarmer.jsp?o_id=<%= rs2.getInt(1) %>" class="btn-action btn-decline">Decline</a></td>
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
