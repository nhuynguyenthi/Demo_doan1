package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.entities.Customer;
import models.entities.Order;

import java.io.IOException;

@WebServlet(name = "ServletFinishController", value = "/finish")
public class FinishController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("cartList");
        if(session.getAttribute("userLogin")==null){
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }else if(session.getAttribute("newOrder")==null){
            request.getRequestDispatcher("WEB-INF/checkout.jsp").forward(request, response);
        }
        else {
            Customer user = (Customer) session.getAttribute("userLogin");
            Order newOrder = (Order) session.getAttribute("newOrder");
      
            
            request.getRequestDispatcher("WEB-INF/finish.jsp").forward(request, response);
        }
    }
}