<%@page import="java.time.LocalDate"%>
<%@page import="com.rohit.dbconnect.DBConnect"%>
<%@page import="java.sql.*"%>
<%@page import="com.rohit.model.FarmerInfo"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Update Product</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Optional Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Custom Styling -->
    <style>
        body {
            background: linear-gradient(to right, #f8fafc, #e0f7fa);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container {
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        .form-title {
            text-align: center;
            color: #2e7d32;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-success {
            width: 48%;
        }

        .btn-secondary {
            width: 48%;
        }

        .btn-wrapper {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <%
        int p_id = Integer.parseInt(request.getParameter("p_id"));
        String product_name = "";
        int quantity = 0;
        double price = 0.0;
        Date post_date = Date.valueOf(LocalDate.now());

        try {
            Connection con = DBConnect.getConnect();
            String sql = "select * from products where p_id=?";
            PreparedStatement ps1 = con.prepareStatement(sql);
            ps1.setInt(1, p_id);
            ResultSet rs1 = ps1.executeQuery();

            if (rs1.next()) {
                product_name = rs1.getString(3);
                quantity = rs1.getInt(4);
                price = rs1.getDouble(5);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <div class="form-container">
        <h2 class="form-title"><i class="bi bi-pencil-square"></i> Update Product Details</h2>
        <form action="UpdateProductDetailsByFarmer" method="post">
            <input type="hidden" name="p_id" value="<%=p_id%>">
            <div class="mb-3">
                <label class="form-label">Product Name</label>
                <input type="text" class="form-control" value="<%=product_name%>" disabled>
            </div>
            <div class="mb-3">
                <label class="form-label">Quantity</label>
                <input type="number" class="form-control" name="quantity" value="<%=quantity%>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Price (per item)</label>
                <input type="number" step="0.01" class="form-control" name="price" value="<%=price%>" required>
            </div>
            <div class="btn-wrapper">
                <button type="submit" class="btn btn-success"><i class="bi bi-check-circle-fill"></i> Update</button>
                <a href="viewAllProductsByFarmer.jsp" class="btn btn-secondary"><i class="bi bi-x-circle-fill"></i> Cancel</a>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
