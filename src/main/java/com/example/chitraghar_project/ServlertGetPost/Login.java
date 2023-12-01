package com.example.chitraghar_project.ServlertGetPost;

import com.example.chitraghar_project.dbConnection.DatabaseConnection;
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login extends HttpServlet {
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession(true);

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String getEmail = null;
        String getPassword = null;
        String getName = null;
        int getId = 0;
        String stringId = ""+getId;

        try {
            connection = DatabaseConnection.getConnection();
            String query = "select * from users where Email = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,email);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                getId = resultSet.getInt("Id");
                getName = resultSet.getString("Name");
                getEmail = resultSet.getString("Email");
                getPassword = resultSet.getString("Password");
            } else if (!resultSet.next()) {

                request.setAttribute("pError","Invalid Email! Please Try Again");
                request.getRequestDispatcher("index.jsp").forward(request,response);
                response.sendRedirect("index.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
        boolean verifyPass = verifyPassword(password , getPassword);
        if (verifyPass){
            session.setAttribute("userId",getId);
            session.setAttribute("loginMsg","loginSuccess");
            session.setAttribute("name",getName);
            session.setAttribute("password",getPassword);
            session.setAttribute("email",getEmail);
            response.sendRedirect("index.jsp");
        }else {
            request.setAttribute("pError","Invalid Password! Please Try Again");
            try {
                request.getRequestDispatcher("index.jsp").forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
            System.out.println("Invalid Password! Please Try Again");
            response.sendRedirect("index.jsp");
        }

    }

    public static boolean verifyPassword(String enteredPassword, String storedHashedPassword) {
        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);

        try {
            // Verify the entered password against the stored hashed password
            return argon2.verify(storedHashedPassword, enteredPassword.toCharArray());
        } finally {
            argon2.wipeArray(enteredPassword.toCharArray());
        }
    }

}
