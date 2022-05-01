package com.weisikai.controller;

import com.weisikai.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/home")
public class AdminHomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession(false);
        if (session!=null&&session.getAttribute("user")!=null){
            User user=(User)session.getAttribute("user");
            if ("admin".equals(user.getUsername())){//admin username must be in table
                req.getRequestDispatcher("../WEB-INF/views/admin/index.jsp").forward(req,resp);
            }else {
                // not admin user
                session.invalidate();//kill session right now
                req.setAttribute("message","Unauthorized Access Admin Module!!!");
                req.getRequestDispatcher("../WEB-INF/views/login.jsp").forward(req,resp);
            }
        }else {
            //no session
            req.setAttribute("message","Please login as admin!!!");
            req.getRequestDispatcher("../WEB-INF/views/login.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
