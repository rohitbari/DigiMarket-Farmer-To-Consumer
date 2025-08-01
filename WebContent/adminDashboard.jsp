<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>DigiMarket Admin Dashboard</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f8f9fa;
    }
    .dashboard-card {
      transition: transform 0.2s ease;
    }
    .dashboard-card:hover {
      transform: scale(1.02);
    }
    .footer-note {
      margin-top: 40px;
      text-align: center;
      font-size: 14px;
      color: #777;
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">DigiMarket Admin</a>
      <div class="d-flex">
        <a href="index.html" class="btn btn-outline-light me-2">Home</a>
        <a href="adminLogin.html" class="btn btn-light">Logout</a>
      </div>
    </div>
  </nav>

  <!-- Dashboard Content -->
  <div class="container mt-5">
    <div class="text-center mb-4">
      <h2 class="text-success fw-bold">Welcome to Admin Dashboard</h2>
      <p class="text-muted">Manage Farmers, Buyers, and Products from here</p>
    </div>

    <div class="row g-4">

      <!-- Add Farmer -->
      <div class="col-md-4">
        <div class="card dashboard-card border-success shadow-sm">
          <div class="card-body text-center">
            <h5 class="card-title">Add Farmer</h5>
            <a href="addFarmerByAdmin.html" class="btn btn-success w-100">Add Farmer</a>
          </div>
        </div>
      </div>

      <!-- View Farmers -->
      <div class="col-md-4">
        <div class="card dashboard-card border-success shadow-sm">
          <div class="card-body text-center">
            <h5 class="card-title">View Farmers</h5>
            <a href="viewFarmersByAdmin.jsp" class="btn btn-outline-success w-100">View Farmers</a>
          </div>
        </div>
      </div>

      <!-- Add Buyer -->
      <div class="col-md-4">
        <div class="card dashboard-card border-primary shadow-sm">
          <div class="card-body text-center">
            <h5 class="card-title">Add Buyer</h5>
            <a href="addBuyerByAdmin.html" class="btn btn-primary w-100">Add Buyer</a>
          </div>
        </div>
      </div>

      <!-- View Buyers -->
      <div class="col-md-4">
        <div class="card dashboard-card border-primary shadow-sm">
          <div class="card-body text-center">
            <h5 class="card-title">View Buyers</h5>
            <a href="viewBuyersByAdmin.jsp" class="btn btn-outline-primary w-100">View Buyers</a>
          </div>
        </div>
      </div>

      <!-- Add Product -->
      <div class="col-md-4">
        <div class="card dashboard-card border-warning shadow-sm">
          <div class="card-body text-center">
            <h5 class="card-title">Add Product</h5>
            <a href="addProductByAdmin.html" class="btn btn-warning w-100 text-white">Add Product</a>
          </div>
        </div>
      </div>

      <!-- View Products -->
      <div class="col-md-4">
        <div class="card dashboard-card border-warning shadow-sm">
          <div class="card-body text-center">
            <h5 class="card-title">View Products</h5>
            <a href="viewProductsByAdmin.jsp" class="btn btn-outline-warning w-100">View Products</a>
          </div>
        </div>
      </div>

    </div>
    
    <div class="footer-note">
      &copy; 2025 DigiMarket | Empowering Farmers Digitally
    </div>
  </div>

  <!-- Bootstrap JS (Optional for dropdowns/modals) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
