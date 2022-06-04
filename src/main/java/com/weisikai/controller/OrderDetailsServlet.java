package com.weisikai.controller;

import com.weisikai.dao.OrderDao;
import com.weisikai.model.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet(name = "OrderDetailsServlet",value = "/orderDetails")
public class OrderDetailsServlet extends HttpServlet {
    private Connection con =null;

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
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = request.getParameter("orderId")!=null?Integer.parseInt(request.getParameter("orderId")):0;
        Item item = new Item();
        OrderDao dao = new OrderDao();
        List<Item> itemList =dao.findItemsByOrderId(con,orderId);
        request.setAttribute("itemList",itemList);
        request.getRequestDispatcher("orderDetails.jsp").forward(request,response);
    }
}