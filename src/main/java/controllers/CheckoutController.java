package controllers;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.entities.Customer;
import models.entities.Order;
import models.entities.ShoppingCart;
import models.managers.OrderManager;
import models.managers.OrderProductManager;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 


        try {
            String totalStr = request.getParameter("total");
            BigDecimal totalAmount = BigDecimal.ZERO; // Giá trị mặc định

            if (totalStr != null && !totalStr.isEmpty()) {
                totalAmount = new BigDecimal(totalStr);
            }

            DecimalFormat decimalFormat = new DecimalFormat("#,### đ");
            String formattedTotal = decimalFormat.format(totalAmount);

            HttpSession session = request.getSession();
            ArrayList<ShoppingCart> cartList = (ArrayList<ShoppingCart>) session.getAttribute("cartList");
            Customer user = (Customer) session.getAttribute("userLogin");

            String orderNumber = Integer.toString(user.getId());
            if (totalStr != null) {
                orderNumber += totalStr.replace(".", "");
            }

            Order order = new Order(orderNumber, user.getId(), totalAmount);
            OrderManager.insertNewOrder(order);
            session.setAttribute("newOrder", order);

            for (ShoppingCart itemInCart : cartList) {
                OrderProductManager.insertNewOrderProduct(orderNumber, itemInCart.getId(), itemInCart.getQuantity());
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        request.getRequestDispatcher("WEB-INF/checkout.jsp").forward(request, response);
    }
}