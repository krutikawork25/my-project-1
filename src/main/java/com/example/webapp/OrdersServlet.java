package com.example.webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class OrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<String> orders = new ArrayList<>();
        orders.add("Order #1001 - John Doe - $1299.98 - Completed");
        orders.add("Order #1002 - Jane Smith - $599.99 - Processing");
        orders.add("Order #1003 - Bob Johnson - $449.98 - Shipped");
        orders.add("Order #1004 - Alice Brown - $79.99 - Pending");

        request.setAttribute("orders", orders);
        request.setAttribute("pageTitle", "Orders Management");
        request.getRequestDispatcher("/jsp/orders.jsp").forward(request, response);
    }
}