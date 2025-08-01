<%@page import="com.rohit.dbconnect.DBConnect"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Products</title>

<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

<!-- Internal CSS -->
<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Segoe UI', sans-serif;
        padding: 30px;
    }

    .container {
        background-color: #fff;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #2c7a7b;
        text-align: center;
        margin-bottom: 25px;
    }

    .table th {
        background-color: #e0f2f1;
        color: #00695c;
    }

    .btn-delete {
        background-color: #e53935;
        color: white;
        padding: 5px 10px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 14px;
    }

    .btn-delete:hover {
        background-color: #c62828;
    }

    .dashboard-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #0275d8;
        text-decoration: none;
        font-weight: 500;
    }

    .dashboard-link:hover {
        text-decoration: underline;
    }
</style>

</head>
<body>

<div class="container">
    <h2><i class="bi bi-box-seam-fill"></i> Products</h2>

    <div class="table-responsive">
        <table class="table table-bordered table-hover text-center align-middle">
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
                        <a href="deleteProduct.jsp?p_id=<%=rs.getInt(1)%>" class="btn-delete">
                            <i class="bi bi-trash-fill"></i> Delete
                        </a>
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

    <a href="adminDashboard.jsp" class="dashboard-link"><i class="bi bi-arrow-left-circle"></i> Back to Dashboard</a>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
