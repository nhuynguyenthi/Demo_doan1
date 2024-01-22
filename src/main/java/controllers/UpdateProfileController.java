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

@WebServlet(name = "UpdateProfileController", value = "/updateProfile")
public class UpdateProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("userLogin")==null){
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("WEB-INF/updateProfile.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer user = (Customer) session.getAttribute("userLogin");
        try{
            String fName = request.getParameter("fName");
            String lName = request.getParameter("lName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            CustomerManager.updateCustomer(user.getId(), fName, lName, email, phone);
            user.setFirstName(fName);
            user.setLastName(lName);
            user.setPhone(phone);
            user.setEmail(email);
            session.setAttribute("userLogin", user);
            request.getRequestDispatcher("WEB-INF/profile.jsp").forward(request, response);

        } catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
