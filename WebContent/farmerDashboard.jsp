<%@page import="com.rohit.model.FarmerInfo"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Farmer Dashboard - DigiMarket</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Internal CSS -->
  <style>
    body {
      background-color: #f4fdfb;
      font-family: 'Segoe UI', sans-serif;
    }

    .dashboard-header {
      background-color: #2e7d32;
      color: white;
      padding: 20px;
      border-radius: 0 0 15px 15px;
      text-align: center;
    }

    .dashboard-container {
      max-width: 1200px;
      margin: 40px auto;
      padding: 20px;
    }

    .card {
      transition: transform 0.2s, box-shadow 0.2s;
      cursor: pointer;
    }

    .card:hover {
      transform: scale(1.03);
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    }

    .card-title {
      color: #1b5e20;
    }

    .footer-note {
      margin-top: 40px;
      text-align: center;
      font-size: 14px;
      color: #777;
    }

    .card a {
      text-decoration: none;
      color: #1b5e20;
    }
  </style>
</head>
<body>

  <!-- Header -->
  <div class="dashboard-header">
    <h2>Welcome, <%= FarmerInfo.getF_name() %></h2>
    <p>DigiMarket Farmer Dashboard</p>
  </div>

  <!-- Dashboard Grid -->
  <div class="dashboard-container">
    <div class="row row-cols-1 row-cols-md-3 g-4">

      <div class="col">
        <div class="card h-100 text-center">
          <div class="card-body">
            <h5 class="card-title">Post Product for Sale</h5>
            <p class="card-text">Add new product listings to reach buyers directly.</p>
            <a href="addProductsForSales.html" class="btn btn-success">Post Now</a>
          </div>
        </div>
      </div>

	<div class="col">
        <div class="card h-100 text-center">
          <div class="card-body">
            <h5 class="card-title">My Products</h5>
            <p class="card-text">See the list of products you've added.</p>
            <a href="viewAllProductsByFarmer.jsp" class="btn btn-success">View Products</a>
          </div>
        </div>
      </div>
      
      <div class="col">
        <div class="card h-100 text-center">
          <div class="card-body">
            <h5 class="card-title">View Orders</h5>
            <p class="card-text">Track buyer requests and manage your orders.</p>
            <a href="viewOrders.jsp" class="btn btn-success">View Orders</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card h-100 text-center">
          <div class="card-body">
            <h5 class="card-title">Confirmed Orders</h5>
            <p class="card-text">View orders you've accepted and confirmed.</p>
            <a href="viewAllConfirmOrdersByFarmer.jsp" class="btn btn-success">Check Now</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card h-100 text-center">
          <div class="card-body">
            <h5 class="card-title">Declined Orders</h5>
            <p class="card-text">See the list of orders you've declined.</p>
            <a href="viewAllDeclineOrdersByFarmer.jsp" class="btn btn-success">View List</a>
          </div>
        </div>
      </div>
      

      <div class="col">
        <div class="card h-100 text-center">
          <div class="card-body">
            <h5 class="card-title">Change Password</h5>
            <p class="card-text">Update your DigiMarket login password.</p>
            <a href="farmerChangePassword.html" class="btn btn-warning">Change</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card h-100 text-center">
          <div class="card-body">
            <h5 class="card-title">Logout</h5>
            <p class="card-text">Securely exit your farmer account.</p>
            <a href="farmerLogin.html" class="btn btn-danger">Logout</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card h-100 text-center">
          <div class="card-body">
            <h5 class="card-title">Back to DigiMarket</h5>
            <p class="card-text">Return to the main DigiMarket home page.</p>
            <a href="index.html" class="btn btn-secondary">Go Back</a>
          </div>
        </div>
      </div>

    </div>

    <div class="footer-note">
      &copy; 2025 DigiMarket | Empowering Farmers Digitally
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
