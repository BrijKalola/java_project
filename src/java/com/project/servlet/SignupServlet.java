/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project.servlet;

import com.project.data.UserData;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

import com.project.connection.DataBaseConnection;


/**
 *
 * @author brijk
 */
public class SignupServlet extends HttpServlet {

 private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("signup-name");
            String email = request.getParameter("signup-email");
            String password = request.getParameter("signup-password");

            try {
                UserData udao = new UserData(DataBaseConnection.getConnection());
                boolean success = udao.userSignUp(name, email, password);

                if (success) {
                    response.sendRedirect("login.jsp");
                } else {
                    out.println("Signup failed. Please try again.");
                }
            } catch (SQLException e) {
                 e.printStackTrace(); // Print stack trace for debugging
                 out.println("Database error: " + e.getMessage());
            }
        }
    }
}
