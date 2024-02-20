package com.example.chitraghar_project.ServlertGetPost;

import com.example.chitraghar_project.dbConnection.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "adminlogin", urlPatterns = "/Admin/admin-login")
public class AdminLogion extends HttpServlet {
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession adminSession = request.getSession(true);
        String email = request.getParameter("email");
        String password = request.getParameter("password");
//        System.out.println(email+" "+password);
        try{
            connection = DatabaseConnection.getConnection();
            String query = "select * from admins where Email = ? and Password= ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,password);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                adminSession.setAttribute("adminEmail",resultSet.getString(3));
                adminSession.setAttribute("loginMsg","loginSuccess");
                response.sendRedirect("/Admin/UploadRequest.jsp");
            } else if (!resultSet.next()) {
                request.setAttribute("pError","Invalid Email! Please Try Again");
                request.getRequestDispatcher("/Admin/ALogin.jsp").forward(request,response);
                response.sendRedirect("/Admin/ALogin.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
