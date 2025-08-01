<%@page import="com.rohit.model.ProductInfo"%>
<%@page import="com.rohit.dbconnect.DBConnect"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Place Order</title>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  body {
    background-color: #f8f9fa;
    padding: 40px;
    font-family: 'Segoe UI', sans-serif;
  }
  .container {
    max-width: 550px;
    background: #fff;
    padding: 30px;
    margin: auto;
    border-radius: 12px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
  }
  h2 {
    color: #0d6efd;
    text-align: center;
    margin-bottom: 25px;
  }
  label {
    font-weight: 500;
  }
  .btn-primary {
    width: 100%;
  }
  .back-link {
    margin-top: 20px;
    display: block;
    text-align: center;
  }
</style>
</head>
<body>

<div class="container">
  <h2>Place Order</h2>

  <%
    int p_id = Integer.parseInt(request.getParameter("p_id"));
    int quantityRequired; 
    try {
      Connection con = DBConnect.getConnect();
      String sql = "select * from products where p_id=?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setInt(1, p_id);
      ResultSet rs = ps.executeQuery();
      if (rs.next()) {
        ProductInfo.setP_id(p_id);
        String product_name = rs.getString(3);
        int availableQuantity = rs.getInt(4);
        double price = rs.getDouble(5);
  %>

  <form action="PlaceOrder" method="post">
    <input type="hidden" name="p_id" value="<%=p_id%>">

    <div class="mb-3">
      <label class="form-label">Product Name:</label>
      <div class="form-control"><%=product_name%></div>
    </div>

    <div class="mb-3">
      <label class="form-label">Available Quantity:</label>
      <div class="form-control"><%=availableQuantity%></div>
    </div>

    <div class="mb-3">
      <label class="form-label">Price (Per Unit in Rs.):</label>
      <div class="form-control"><%=price%></div>
    </div>

    <div class="mb-3">
      <label for="quantity" class="form-label">Enter Quantity to Order:</label>
      <input type="number" class="form-control" id="quantity" name="quantity" min="1" max="<%=availableQuantity %>" required>
    </div>

    <button type="submit" class="btn btn-primary">Buy Product</button>
  </form>

  <%
      }
    } catch(Exception e){
      e.printStackTrace();
    }
  %>

  <a href="browseProducts.jsp" class="back-link">Back to Products</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
