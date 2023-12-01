package com.example.chitraghar_project.Admin;

import com.example.chitraghar_project.dbConnection.DatabaseConnection;
import com.example.chitraghar_project.services.NewArtRating;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet (name = "approve" , urlPatterns = "/approveRequest")
public class ApproveRequest extends HttpServlet {
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException{
        try {
            int id = Integer.parseInt(request.getParameter("ApproveIdInput"));
            Connection connection = DatabaseConnection.getConnection();
            String approve = "update request_art set status='Approved' where id = "+id;
            PreparedStatement preparedStatement = connection.prepareStatement(approve);
            int appRow = preparedStatement.executeUpdate();
            NewArtRating.insertRating(id);
            response.sendRedirect("/Admin/UploadRequest.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
