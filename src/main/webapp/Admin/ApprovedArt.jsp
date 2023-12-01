<%@ page import="com.example.chitraghar_project.dbConnection.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.example.chitraghar_project.services.AllServices" %><%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 8/18/2023
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Approved Art</title>
</head>
<body>
<%@include file="adminNavigation.jsp"%>
<%
  Connection connection = DatabaseConnection.getConnection();
  String artGet = "select * from request_art where status ='Approved'";
  Statement statement = connection.createStatement();
  ResultSet resultSet = statement.executeQuery(artGet);
%>
<div class="row card-group d-flex">
    <%
    while (resultSet.next()) {
      int id = resultSet.getInt("id");
      String title = resultSet.getString("title");
      String description = resultSet.getString("description");
      byte[] art = resultSet.getBytes("art");
      int artist_id = resultSet.getInt("artist_id");
      String artType = resultSet.getString("art_style");
  %>
  <div class="col-md-6 col-lg-3 mb-3">
    <div class="card h-100">
      <img width="300" height="300"
           src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(art))%>" class="card-img-top">
      <div class="card-body">
        <h5 class="card-title"><b><%= title %></b></h5>
        <p class="card-text">Artist: <%=AllServices.getArtistById(artist_id) %>
        </p>
      </div>
    </div>
  </div>
    <%
    }
  %>
</body>
</html>
