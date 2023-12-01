package com.example.chitraghar_project.ServlertGetPost;

import com.example.chitraghar_project.services.AllServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet (name = "rate", urlPatterns = "/ratingArt")
public class RatingGet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rateArtId = Integer.parseInt(request.getParameter("ArtRatingIdInput").toString());
        double rateValue = Double.parseDouble(request.getParameter("RatingValueInput").toString());

        HttpSession session = request.getSession(true);
        int userId = (int) session.getAttribute("userId");

        try {
            AllServices.setArtRateCollection(rateArtId,rateValue,userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("ArtInfo.jsp?artId="+rateArtId);
    }
}
