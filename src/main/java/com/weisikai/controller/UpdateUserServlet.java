package com.weisikai.controller;

import com.weisikai.dao.UserDao;
import com.weisikai.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/update")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //write code
        req.getRequestDispatcher("WEB-INF/views/updateUser.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取传过来的值
        String id=req.getParameter("id");
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String email=req.getParameter("email");
        String gender=req.getParameter("gender");
        String birthdate=req.getParameter("birthdate");
        User user=new User();
        user.setId(Integer.parseInt(id));
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setGender(gender);
        try {
            user.setBirthdate(new SimpleDateFormat("yyyy-MM-dd").parse(birthdate));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //将数据更新到数据库中
        UserDao userDao=new UserDao();
        Connection con = (Connection) getServletContext().getAttribute("con");
        try {
            int i = userDao.updateUser(con, user);
            User updateUser=userDao.findById(con,Integer.parseInt(id));
            HttpSession session=req.getSession();
            session.removeAttribute("user");
            session.setAttribute("user",updateUser);
//            req.getRequestDispatcher("WEB-INF/views/login.jsp").forward(req,resp);
            req.getRequestDispatcher("accountDetails").forward(req,resp);

        } catch (SQLException e) {
            req.setAttribute("message","update fail");
            e.printStackTrace();
        }

    }
}