package com.weisikai.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search=req.getParameter("search");
        String txt=req.getParameter("txt");
        if (search.equals("baidu")){
            resp.sendRedirect("https://www.baidu.com/s?ie=utf-8&f=8&wd="+txt);
        }
        if (search.equals("bing")){
            resp.sendRedirect("https://www.bing.com/search?q="+txt+"&ie=UTF-8");
        }
        if (search.equals("google")){
            resp.sendRedirect("https://www.google.com/search?q="+txt+"&ie=UTF-8");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}