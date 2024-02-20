package com.example.chitraghar_project.ServlertGetPost;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet(name = "adminlogout", urlPatterns = "/Admin/adminlogout")
public class AdminLogout extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);

        if (session != null){
            session.invalidate();
        }
        response.sendRedirect("/Admin/ALogin.jsp");
    }
}
