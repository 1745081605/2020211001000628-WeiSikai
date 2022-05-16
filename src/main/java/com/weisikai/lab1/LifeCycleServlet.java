package com.weisikai.lab1;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/life")
public class LifeCycleServlet extends HttpServlet {

    public LifeCycleServlet(){
        System.out.println("I Am from default constructor");
    }

    @Override
    public void init() throws ServletException {
        System.out.println("The LifeCycleServlet is init......");
        System.out.printf("-------------------------------");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("service");
        System.out.println(getServletContext().getInitParameter("driver"));
        System.out.printf("-------------------------------");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    public void destroy() {
        System.out.println("The LifeCycleServlet is destory......");
        System.out.printf("-------------------------------");
    }
}