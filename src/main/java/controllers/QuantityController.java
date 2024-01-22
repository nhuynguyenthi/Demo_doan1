package controllers;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.entities.ShoppingCart;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "QuantityController", value = "/quantity")
public class QuantityController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        ArrayList<ShoppingCart> cartList = (ArrayList<ShoppingCart>) session.getAttribute("cartList");
        int action = Integer.parseInt(request.getParameter("action"));
        int index = Integer.parseInt(request.getParameter("index"));
        if(action==1){
            cartList.get(index).setQuantity(cartList.get(index).getQuantity()+1);
        }else{
            cartList.get(index).setQuantity(cartList.get(index).getQuantity()-1);
            if(cartList.get(index).getQuantity()==0){
                cartList.remove(index);
            }
        }
        request.getRequestDispatcher("WEB-INF/shoppingCart.jsp").forward(request, response);
    }

}
