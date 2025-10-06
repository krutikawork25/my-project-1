<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Simple Web App</title>
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
        .nav a:hover {
            background-color: #495057;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .welcome {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .stat-number {
            font-size: 2em;
            font-weight: bold;
            color: #007bff;
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
        <a href="orders">Orders</a>
    </div>

    <div class="container">
        <div class="welcome">
            <h2>Dashboard</h2>
            <p>Welcome to your admin dashboard. Use the navigation above to manage different sections of the application.</p>
            <p>Current time: <%= new Date() %></p>
        </div>

        <div class="stats">
            <div class="stat-card">
                <div class="stat-number">5</div>
                <div>Total Users</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">6</div>
                <div>Products</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">4</div>
                <div>Orders</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">$2,429.94</div>
                <div>Total Revenue</div>
            </div>
        </div>
    </div>
</body>
</html>