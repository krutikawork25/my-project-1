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
        .status {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.8em;
            font-weight: bold;
        }
        .completed { background-color: #d4edda; color: #155724; }
        .processing { background-color: #fff3cd; color: #856404; }
        .shipped { background-color: #d1ecf1; color: #0c5460; }
        .pending { background-color: #f8d7da; color: #721c24; }
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
        <a href="products">Products</a>
        <a href="orders" class="active">Orders</a>
    </div>

    <div class="container">
        <div class="content">
            <h2><%= request.getAttribute("pageTitle") %></h2>
            <div class="timestamp">Last updated: <%= new Date() %></div>
            <br>

            <%
                List<String> orders = (List<String>) request.getAttribute("orders");
                if (orders != null) {
                    for (String order : orders) {
                        String statusClass = "";
                        if (order.contains("Completed")) statusClass = "completed";
                        else if (order.contains("Processing")) statusClass = "processing";
                        else if (order.contains("Shipped")) statusClass = "shipped";
                        else if (order.contains("Pending")) statusClass = "pending";

                        String[] parts = order.split(" - ");
                        String status = parts[parts.length - 1];
                        String orderInfo = order.substring(0, order.lastIndexOf(" - "));
            %>
                <div class="list-item">
                    <span><%= orderInfo %></span>
                    <span class="status <%= statusClass %>"><%= status %></span>
                </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</body>
</html>