package com.example.chitraghar_project.Admin;

import com.example.chitraghar_project.dbConnection.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet (name = "decline", urlPatterns = "/declineRequest")

public class DeclineRequest extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            int id = Integer.parseInt(request.getParameter("deleteIdInput"));
            Connection connection = DatabaseConnection.getConnection();
            String delete = "delete from request_art where id ="+id;
            PreparedStatement preparedStatement = connection.prepareStatement(delete);
            int deleteRow = preparedStatement.executeUpdate();
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
