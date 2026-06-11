package com.yasin.learning.tomcat1;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
    static {
        System.out.println("MyServlet is loaded...");
    }
    public  MyServlet(){
        System.out.println("MyServlet object is created");
    }
    public void init(){
        System.out.println("MyServlet obj is initialized");
    }
    public void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("Service1: running...");
        super.service(req, resp);
        System.out.println("Service1: ending...");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String city = req.getParameter("city");

        /*
         * ==========================================================
         * METHOD 1 : RequestDispatcher + forward()
         * ==========================================================
         * Request attributes survive because the same request object
         * is forwarded to MyServlet2.
         */

//    req.setAttribute("id", id);
//    req.setAttribute("name", name);
//    req.setAttribute("age", age);
//    req.setAttribute("city", city);
//
//    RequestDispatcher rd = req.getRequestDispatcher("/MyServlet2");
//    rd.forward(req, resp);

        /*
         * ==========================================================
         * METHOD 2 : RequestDispatcher + include()
         * ==========================================================
         * Output of MyServlet2 is included in current response.
         */

//    req.setAttribute("id", id);
//    req.setAttribute("name", name);
//    req.setAttribute("age", age);
//    req.setAttribute("city", city);
//
//    RequestDispatcher rd = req.getRequestDispatcher("/MyServlet2");
//    rd.include(req, resp);

        /*
         * ==========================================================
         * METHOD 3 : Session Tracking + setMaxInactiveInterval (optional)
         * ==========================================================
         * Data is stored in session and can be accessed by any
         * servlet in the same web application.
         */

        HttpSession session = req.getSession();
        session.setMaxInactiveInterval(2000);

        session.setAttribute("id", id);
        session.setAttribute("name", name);
        session.setAttribute("age", age);
        session.setAttribute("city", city);

        System.out.println("doPost1 - Before Starting MyServlet2");

        resp.sendRedirect("MyServlet2");

        System.out.println("doPost1 - After Ending MyServlet2");

        /*
         * ==========================================================
         * METHOD 4 : URL Rewriting
         * ==========================================================
         * Data is sent through query parameters.
         */

//    resp.sendRedirect(
//            "MyServlet2?id=" + id +
//            "&name=" + name +
//            "&age=" + age +
//            "&city=" + city);

    }

    @Override
    public void destroy() {
        super.destroy();//though its empty
        System.out.println("Destroying MyServlet");
    }
}
