<%@page import="com.rohit.dbconnect.DBConnect"%>
<%@page import="java.sql.*"%>
<%@page import="com.rohit.model.BuyerInfo"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Decline Orders</title>

  <!-- Bootstrap 5 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f0f4f7;
      padding: 30px;
      font-family: 'Segoe UI', sans-serif;
    }

    .container {
      background-color: #ffffff;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #d32f2f;
    }

    table th {
      background-color: #ffcdd2;
      color: #b71c1c;
    }

    .back-link {
      display: block;
      margin-top: 25px;
      text-align: center;
      text-decoration: none;
      font-weight: 600;
      color: #007bff;
    }

    .back-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="container">
    <h2>-- Decline Orders --</h2>

    <div class="table-responsive">
      <table class="table table-bordered table-striped text-center align-middle">
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
            int b_id = BuyerInfo.getB_id();
            try {
              Connection con = DBConnect.getConnect();
              String sql = "select * from orders where buyer_id=? and status=?";
              PreparedStatement ps1 = con.prepareStatement(sql);
              ps1.setInt(1, b_id);
              ps1.setString(2, "decline");
              ResultSet rs1 = ps1.executeQuery();

              while(rs1.next()) {
                int product_id = rs1.getInt(3);
                sql = "select * from products where p_id=?";
                PreparedStatement ps2 = con.prepareStatement(sql);
                ps2.setInt(1, product_id);
                ResultSet rs2 = ps2.executeQuery();
                if(rs2.next()){
          %>
          <tr>
            <td><%=rs2.getString(3)%></td>
            <td><%=rs2.getDouble(5)%></td>
            <td><%=rs1.getInt(4)%></td>
            <td><%=(rs2.getDouble(5) * rs1.getInt(4)) %></td>
            <td><%=rs1.getDate(5)%></td>
            <td><%=rs1.getString(6)%></td>
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

    <a href="buyerDashboard.jsp" class="back-link">Back to Dashboard</a>
  </div>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
