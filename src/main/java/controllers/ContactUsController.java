package controllers;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.entities.Customer;


import java.io.IOException;

@WebServlet(name = "ContactUsController", value = "/contactUs")
public class ContactUsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/contactUs.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try{
            String fName = request.getParameter("fName");
            String message = request.getParameter("message");
            session.setAttribute("messageSent", "true");
            request.getRequestDispatcher("WEB-INF/contactUs.jsp").forward(request, response);

        } catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
