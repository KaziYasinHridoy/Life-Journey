package com.yasin.learning.tomcat1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/MyServlet2")
public class MyServlet2 extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("Service method of MyServlet2 is running...");
        super.service(req, resp);
        System.out.println("Service method of MyServlet2 is ending...");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        /*
         * METHOD 1 : RequestDispatcher + forward()
         * METHOD 2 : RequestDispatcher + include()
         *
         * No code required here unless MyServlet2 needs
         * to read or modify the request attributes.
         */

        /*
         * ==========================================================
         * METHOD 3 : Session Tracking
         * Data received from session
         * ==========================================================
         */

        HttpSession session = req.getSession(false);

        int id = (Integer) session.getAttribute("id");
        String name = (String) session.getAttribute("name");
        int age = (Integer) session.getAttribute("age");
        String city = (String) session.getAttribute("city");

        req.setAttribute("id", id);
        req.setAttribute("name", name);
        req.setAttribute("age", age);
        req.setAttribute("city", city);

        System.out.println("ID   : " + id);
        System.out.println("Name : " + name);
        System.out.println("Age  : " + age);
        System.out.println("City : " + city);

        /*
         * ==========================================================
         * METHOD 4 : URL Rewriting
         * Data received from query parameters
         * ==========================================================
         */

//        int id = Integer.parseInt(req.getParameter("id"));
//        String name = req.getParameter("name");
//        int age = Integer.parseInt(req.getParameter("age"));
//        String city = req.getParameter("city");

        RequestDispatcher rd = req.getRequestDispatcher("/success.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        doGet(req, resp);
    }
}