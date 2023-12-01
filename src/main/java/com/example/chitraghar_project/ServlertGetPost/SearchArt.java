package com.example.chitraghar_project.ServlertGetPost;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet(name = "search" , urlPatterns = "/searchArt")
public class SearchArt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession(true);
        String searchTxt = request.getParameter("searchTxt");
        session.setAttribute("searchTxt",searchTxt);
        if (searchTxt != null){
            response.sendRedirect("SearchArt.jsp");
        }
    }

}
