package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.entities.Customer;
import models.managers.CustomerManager;


import java.io.IOException;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        try{
            String fName = request.getParameter("fName");
            String lName = request.getParameter("lName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            if (CustomerManager.checkEmail(email)) {
                session.setAttribute("regisErrorEmailExist", true);
                request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
            }else {
                Customer customer = new Customer(fName, lName, email, phone, password);
                CustomerManager.insertNewCustomer(customer);
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            }
        } catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
