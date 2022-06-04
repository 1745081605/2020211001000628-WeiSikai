package com.weisikai.controller;

import com.weisikai.dao.OrderDao;
import com.weisikai.model.Order;
import com.weisikai.model.Payment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet(name = "AdminOrderList",value = "/admin/orderList")
public class AdminOrderList extends HttpServlet {
    private Connection con = null;

    @Override
    public void init() throws ServletException {
        super.init();
        con = (Connection) getServletContext().getAttribute("con");
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Payment> paymentTypeList = Payment.findAllPayment(con);
        request.setAttribute("paymentTypeList",paymentTypeList);
        OrderDao orderDao = new OrderDao();
        List<Order> orderList = orderDao.findAll(con);
        request.setAttribute("orderList",orderList);
        String path = "/WEB-INF/views/admin/orderList.jsp";
        request.getRequestDispatcher(path).forward(request,response);
    }
}