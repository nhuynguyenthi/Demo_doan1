package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.entities.Products;
import models.entities.ShoppingCart;
import models.managers.ProductManager;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // thêm mặt hàng vào giỏ hàng
        if(request.getParameter("id")!=null) {
            int id = Integer.parseInt(request.getParameter("id"));
            Products product = ProductManager.getProductById(id);
            ShoppingCart item = new ShoppingCart();
            item.setId(id);
            item.setQuantity(1);
            item.setName(product.getName());
            item.setPrice(product.getPrice());
            item.setUnit(product.getUnit());
            session.setAttribute("item", item);

            ArrayList<ShoppingCart> cartList = (ArrayList<ShoppingCart>) session.getAttribute("cartList");
            if (cartList == null) {
                ArrayList<ShoppingCart> shoppingCartList = new ArrayList<>();
                shoppingCartList.add(item);
                session.setAttribute("cartList", shoppingCartList);
            } else {
                boolean already = false;
                for (ShoppingCart itemInCart : cartList) {
                    if (itemInCart.getId() == id) {
                        already = true;
                        session.setAttribute("itemInCart", true);
                    }
                }
                if (!already) {
                    cartList.add(item);
                }
                session.setAttribute("cartList", cartList);
            }
        }
        request.getRequestDispatcher("WEB-INF/shoppingCart.jsp").forward(request, response);
    }
}
