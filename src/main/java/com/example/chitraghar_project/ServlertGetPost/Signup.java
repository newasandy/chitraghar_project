package com.example.chitraghar_project.ServlertGetPost;

import com.example.chitraghar_project.entity.UserEntity;
import com.example.chitraghar_project.services.AllServices;
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

public class Signup extends HttpServlet {
    private static final int SALT_LENGTH = 16; // Length of the salt in bytes
    private static final int HASH_LENGTH = 32; // Length of the generated hash in bytes
    private static final int PARALLELISM = 2; // Degree of parallelism
    private static final int MEMORY = 65536; // Memory cost
    private static final int ITERATIONS = 10; // Number of iterations
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws IOException, ServletException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");




        if (password.equals(cpassword)){
            String generatePassword = generateArgon2Hash(password);
            UserEntity loginAndSignupEntity = new UserEntity();
            loginAndSignupEntity.setPassword(generatePassword);
            loginAndSignupEntity.setName(name);
            loginAndSignupEntity.setEmail(email);
            AllServices allServices = new AllServices();
            try {
                allServices.regUser();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            HttpSession session = request.getSession(true);
            session.setAttribute("password",password);
            session.setAttribute("name",name);
            session.setAttribute("email",email);
            response.sendRedirect("index.jsp");


        } else if (!password.equals(cpassword)){

        String passError = "Password and Confirm Password do not match";
        request.setAttribute("pError",passError);
        request.getRequestDispatcher("index.jsp").forward(request,response);

        response.sendRedirect("index.jsp");

        }

    }

    public static String generateArgon2Hash(String password){


        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
        return argon2.hash(ITERATIONS, MEMORY, PARALLELISM, password.toCharArray());
    }
}
