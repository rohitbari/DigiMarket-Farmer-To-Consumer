<%@page import="com.rohit.dbconnect.DBConnect"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>View Buyers - DigiMarket</title>

  <!-- Bootstrap 5 CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Internal CSS -->
  <style>
    body {
      background-color: #f1f8e9;
      padding: 40px;
      font-family: 'Segoe UI', sans-serif;
    }

    .container {
      background: #ffffff;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.1);
    }

    h2 {
      text-align: center;
      color: #2e7d32;
      margin-bottom: 30px;
    }

    .table thead {
      background-color: #a5d6a7;
      color: #2e7d32;
    }

    .btn-delete {
      background-color: #e53935;
      color: white;
      padding: 6px 12px;
      border-radius: 4px;
      text-decoration: none;
    }

    .btn-delete:hover {
      background-color: #c62828;
    }

    .back-link {
      display: block;
      margin-top: 20px;
      text-align: center;
      color: #0277bd;
      text-decoration: none;
      font-weight: 500;
    }

    .back-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>Buyers List</h2>

  <div class="table-responsive">
    <table class="table table-bordered table-hover text-center">
      <thead>
        <tr>
          <th>Buyer Name</th>
          <th>Contact</th>
          <th>Address</th>
          <th>Email</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <%
          try {
            Connection con = DBConnect.getConnect();
            String sql = "SELECT * FROM buyers";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
        %>
        <tr>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(3)%></td>
          <td><%=rs.getString(4)%></td>
          <td><%=rs.getString(5)%></td>
          <td>
            <a href="deleteBuyer.jsp?b_id=<%=rs.getInt("b_id")%>" class="btn-delete">Delete</a>
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

  <a href="adminDashboard.jsp" class="back-link">Back to Dashboard</a>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
