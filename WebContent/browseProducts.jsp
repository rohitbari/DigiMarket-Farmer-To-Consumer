<%@page import="com.rohit.dbconnect.DBConnect"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>All Products</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f1f8e9;
      padding: 30px;
      font-family: 'Segoe UI', sans-serif;
    }

    .container {
      background-color: #fff;
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    }

    h2 {
      text-align: center;
      color: #2e7d32;
      margin-bottom: 30px;
    }

    .table th {
      background-color: #a5d6a7;
      color: #1b5e20;
    }

    .btn-order {
      background-color: #43a047;
      color: white;
      padding: 5px 12px;
      border-radius: 6px;
      text-decoration: none;
      font-size: 14px;
    }

    .btn-order:hover {
      background-color: #2e7d32;
    }

    .back-link {
      display: block;
      margin-top: 20px;
      text-align: center;
      text-decoration: none;
      color: #0277bd;
      font-weight: bold;
    }

    .back-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="container">
    <h2>All Products</h2>

    <div class="table-responsive">
      <table class="table table-bordered text-center align-middle">
        <thead>
          <tr>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price (per item)</th>
            <th>Post Date</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <%
            try {
              Connection con = DBConnect.getConnect();
              String sql = "select * from products";
              PreparedStatement ps = con.prepareStatement(sql);
              ResultSet rs = ps.executeQuery();
              while(rs.next()) {
          %>
          <tr>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getInt(4)%></td>
            <td><%=rs.getDouble(5)%></td>
            <td><%=rs.getDate(6)%></td>
            <td>
              <a href="placeOrder.jsp?p_id=<%=rs.getInt(1)%>" class="btn-order">Order Now</a>
            </td>
          </tr>
          <%
              }
            } catch(Exception e) {
              e.printStackTrace();
            }
          %>
        </tbody>
      </table>
    </div>

    <a href="buyerDashboard.jsp" class="back-link">Back to Dashboard</a>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
