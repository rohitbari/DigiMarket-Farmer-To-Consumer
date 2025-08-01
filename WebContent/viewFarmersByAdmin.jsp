<%@page import="com.rohit.dbconnect.DBConnect"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>View Farmers - DigiMarket</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Internal CSS for extra styling -->
  <style>
    body {
      background: #f1f8e9;
      padding: 30px;
    }

    .container {
      background-color: #fff;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    }

    h2 {
      text-align: center;
      color: #2e7d32;
      margin-bottom: 30px;
    }

    .table th {
      background-color: #a5d6a7;
      color: #2e7d32;
    }

    .btn-delete {
      color: white;
      background-color: #e53935;
      padding: 5px 10px;
      border-radius: 5px;
      text-decoration: none;
    }

    .btn-delete:hover {
      background-color: #c62828;
    }

    .back-link {
      display: block;
      margin-top: 20px;
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
    <h2>Farmers List</h2>

    <div class="table-responsive">
      <table class="table table-bordered table-hover text-center align-middle">
        <thead>
          <tr>
            <th>Farmer Name</th>
            <th>Location</th>
            <th>Contact</th>
            <th>Email</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <%
            try {
              Connection con = DBConnect.getConnect();
              String sql = "SELECT * FROM farmers";
              PreparedStatement ps = con.prepareStatement(sql);
              ResultSet rs = ps.executeQuery();
              while(rs.next()) {
          %>
          <tr>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td>
              <a href="deleteFarmer.jsp?f_id=<%= rs.getInt("f_id") %>" class="btn-delete">Delete</a>
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
