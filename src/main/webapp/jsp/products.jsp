<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <title><%= request.getAttribute("pageTitle") %> - Simple Web App</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .nav {
            background-color: #343a40;
            padding: 1rem;
        }
        .nav a {
            color: white;
            text-decoration: none;
            margin-right: 20px;
            padding: 8px 16px;
            border-radius: 4px;
            display: inline-block;
        }
        .nav a:hover, .nav a.active {
            background-color: #495057;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .content {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .list-item {
            padding: 15px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .list-item:last-child {
            border-bottom: none;
        }
        .list-item:hover {
            background-color: #f8f9fa;
        }
        .logout {
            background-color: #dc3545;
            color: white;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 4px;
        }
        .logout:hover {
            background-color: #c82333;
        }
        .timestamp {
            color: #6c757d;
            font-size: 0.9em;
        }
        .stock-status {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.8em;
            font-weight: bold;
        }
        .in-stock {
            background-color: #d4edda;
            color: #155724;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Simple Web App</h1>
        <div>
            Welcome, <%= session.getAttribute("user") %>!
            <a href="logout" class="logout">Logout</a>
        </div>
    </div>

    <div class="nav">
        <a href="dashboard">Dashboard</a>
        <a href="users">Users</a>
        <a href="products" class="active">Products</a>
        <a href="orders">Orders</a>
    </div>

    <div class="container">
        <div class="content">
            <h2><%= request.getAttribute("pageTitle") %></h2>
            <div class="timestamp">Last updated: <%= new Date() %></div>
            <br>

            <%
                List<String> products = (List<String>) request.getAttribute("products");
                if (products != null) {
                    for (String product : products) {
            %>
                <div class="list-item">
                    <span><%= product %></span>
                    <span class="stock-status in-stock">In Stock</span>
                </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</body>
</html>