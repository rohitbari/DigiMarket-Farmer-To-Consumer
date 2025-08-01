<%@page import="com.rohit.model.BuyerInfo"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Buyer Dashboard</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Internal Styling -->
  <style>
    body {
      background-color: #f1f8e9;
      font-family: 'Segoe UI', sans-serif;
    }

    .dashboard-header {
      background-color: #388e3c;
      color: white;
      padding: 20px;
      text-align: center;
      border-radius: 0 0 15px 15px;
    }

    .dashboard-header h2 {
      margin: 0;
    }

    .dashboard-container {
      max-width: 1200px;
      margin: 40px auto;
      padding: 0 20px;
    }

    .card {
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .card:hover {
      transform: scale(1.03);
      box-shadow: 0 8px 16px rgba(0,0,0,0.15);
    }

    .card-title {
      color: #1b5e20;
      font-weight: bold;
    }

    .card a {
      text-decoration: none;
    }

    .footer-note {
      text-align: center;
      margin-top: 40px;
      color: #777;
    }
  </style>
</head>
<body>

  <!-- Header -->
  <div class="dashboard-header">
    <h2>Welcome, <%= BuyerInfo.getB_name() %></h2>
    <p>DigiMarket Buyer Dashboard</p>
  </div>

  <!-- Grid Section -->
  <div class="dashboard-container">
    <div class="row row-cols-1 row-cols-md-3 g-4">

      <div class="col">
        <div class="card h-100 text-center p-3">
          <div class="card-body">
            <h5 class="card-title">Browse Products</h5>
            <p class="card-text">Explore fresh farm products from local farmers.</p>
            <a href="browseProducts.jsp" class="btn btn-success">Browse Now</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card h-100 text-center p-3">
          <div class="card-body">
            <h5 class="card-title">My Orders</h5>
            <p class="card-text">Check all the orders you've placed.</p>
            <a href="myOrders.jsp" class="btn btn-success">View Orders</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card h-100 text-center p-3">
          <div class="card-body">
            <h5 class="card-title">Pending Orders</h5>
            <p class="card-text">Track orders awaiting farmer confirmation.</p>
            <a href="pendingOrders.jsp" class="btn btn-warning">Check Pending</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card h-100 text-center p-3">
          <div class="card-body">
            <h5 class="card-title">Confirm Orders</h5>
            <p class="card-text">See orders that have been confirmed.</p>
            <a href="confirmOrders.jsp" class="btn btn-success">View Confirmed</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card h-100 text-center p-3">
          <div class="card-body">
            <h5 class="card-title">Decline Orders</h5>
            <p class="card-text">View orders declined by farmers.</p>
            <a href="diclineOrders.jsp" class="btn btn-danger">View Declined</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card h-100 text-center p-3">
          <div class="card-body">
            <h5 class="card-title">Change Password</h5>
            <p class="card-text">Secure your account by updating password.</p>
            <a href="buyersChangePassword.html" class="btn btn-secondary">Change</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card h-100 text-center p-3">
          <div class="card-body">
            <h5 class="card-title">Logout</h5>
            <p class="card-text">Logout from your buyer account securely.</p>
            <a href="buyerLogin.html" class="btn btn-outline-danger">Logout</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card h-100 text-center p-3">
          <div class="card-body">
            <h5 class="card-title">Back to Home</h5>
            <p class="card-text">Return to DigiMarket's homepage.</p>
            <a href="index.html" class="btn btn-outline-primary">Go Home</a>
          </div>
        </div>
      </div>

    </div>

    <div class="footer-note">
      &copy; 2025 DigiMarket | Buyer Panel
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
