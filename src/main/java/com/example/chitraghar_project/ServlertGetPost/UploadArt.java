package com.example.chitraghar_project.ServlertGetPost;

import com.example.chitraghar_project.entity.ArtEntity;
import com.example.chitraghar_project.services.AllServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

@WebServlet(name = "uploadArt" ,urlPatterns = "/uploadArt")
@MultipartConfig
public class UploadArt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("artTitle");
        HttpSession session = request.getSession(true);
        int userId = (int) session.getAttribute("userId");
        String description = request.getParameter("artDescription");
        String artType = request.getParameter("artType");

        Part artimage = request.getPart("artFile");
        byte[] imageByte = artimage.getInputStream().readAllBytes();

        ArtEntity artEntity = new ArtEntity();
        artEntity.setImageBytes(imageByte);
        artEntity.setTitle(title);
        artEntity.setArtType(artType);
        artEntity.setDescription(description);
        artEntity.setUserId(userId);
        AllServices allServices = new AllServices();
        try {
            allServices.uploadArt();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("index.jsp");
    }
}
