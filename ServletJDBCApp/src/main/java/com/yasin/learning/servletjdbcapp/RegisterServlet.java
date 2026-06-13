package com.yasin.learning.servletjdbcapp;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private Connection connection;
    private PreparedStatement pstmnt;

    @Override
    public void init() throws ServletException {
        try {
            connection = JdbcUtility.getConnection();
            pstmnt = connection.prepareStatement(
                    "INSERT INTO students VALUES (?,?,?,?)");
            System.out.println("DB connection opened.");
        } catch (SQLException e) {
            throw new ServletException("init() failed", e);
        }
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int    s_id   = Integer.parseInt(req.getParameter("u_id"));
        String s_name = req.getParameter("u_name");
        int    s_age  = Integer.parseInt(req.getParameter("u_age"));
        String s_city = req.getParameter("u_city");

        try {
            pstmnt.setInt(1, s_id);
            pstmnt.setString(2, s_name);
            pstmnt.setInt(3, s_age);
            pstmnt.setString(4, s_city);
            pstmnt.addBatch();
            System.out.println(s_name + " added to Batch.");

            req.setAttribute("u_name", s_name);
            req.getRequestDispatcher("/thank_you.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void destroy() {
        try {
            pstmnt.executeBatch();
            System.out.println("Batch executeded successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtility.closeAllConnection(pstmnt, connection);
            System.out.println("DB connection closed.");
        }
    }
}
