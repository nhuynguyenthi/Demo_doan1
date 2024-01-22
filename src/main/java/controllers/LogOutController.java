package controllers;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.entities.Customer;

import java.io.IOException;

@WebServlet(name = "LogOutController", value = "/logout")
public class LogOutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer user = (Customer) session.getAttribute("userLogin");
        session.removeAttribute(Integer.toString(user.getId()));
        session.removeAttribute("userLogin");
        session.removeAttribute("newOrder");
        session.removeAttribute("cartList");
        request.getRequestDispatcher("WEB-INF/home.jsp").forward(request, response);
    }

}
