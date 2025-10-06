package com.example.webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<String> products = new ArrayList<>();
        products.add("Laptop - $999.99");
        products.add("Smartphone - $599.99");
        products.add("Tablet - $299.99");
        products.add("Headphones - $149.99");
        products.add("Monitor - $249.99");
        products.add("Keyboard - $79.99");

        request.setAttribute("products", products);
        request.setAttribute("pageTitle", "Products Catalog");
        request.getRequestDispatcher("/jsp/products.jsp").forward(request, response);
    }
}