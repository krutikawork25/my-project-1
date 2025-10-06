package com.example.webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class UsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<String> users = new ArrayList<>();
        users.add("John Doe - john.doe@example.com");
        users.add("Jane Smith - jane.smith@example.com");
        users.add("Bob Johnson - bob.johnson@example.com");
        users.add("Alice Brown - alice.brown@example.com");
        users.add("Charlie Wilson - charlie.wilson@example.com");

        request.setAttribute("users", users);
        request.setAttribute("pageTitle", "Users Management");
        request.getRequestDispatcher("/jsp/users.jsp").forward(request, response);
    }
}