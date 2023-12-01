<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.chitraghar_project.dbConnection.DatabaseConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.chitraghar_project.entity.MergeEntity" %>
<%@ page import="com.example.chitraghar_project.services.AllServices" %>
<%@ page import="com.example.chitraghar_project.services.CosineSimilarityAlgo" %>
<%@ page import="com.example.chitraghar_project.services.MergeService" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 10/5/2023
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%@include file="navigationbar.jsp"%>
<br>
<%
    String searchTxt = (String) session.getAttribute("searchTxt");
    String[] searchSplit = searchTxt.split(" ");
    Map<String, Integer> vector1 = new HashMap<>();
    for (String searchS : searchSplit){
        String upperSearch = searchS.toUpperCase();
        vector1.put(upperSearch, 1);
    }
    Connection connection = DatabaseConnection.getConnection();
    String GetSearch_art = "select * from request_art where status ='Approved'";
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery(GetSearch_art);
    ArrayList<MergeEntity> ids = new ArrayList<>();
    int searchCount = 0;
    while (resultSet.next()){
        String title = resultSet.getString("title");
        String artistName = AllServices.getArtistById(resultSet.getInt("artist_id"));
        String[] getRec = {title,artistName};
        for (String words : getRec){
            String[] word = words.split(" ");
            Map<String, Integer> vector2 = new HashMap<>();
            for (String sing : word){
                String upperString = sing.toUpperCase();
                vector2.put(upperString, 1);
            }
            double similarity = CosineSimilarityAlgo.cosineSimilarity(vector1,vector2);
            if (similarity > 0 && similarity<=1){
                MergeEntity mr = new MergeEntity(resultSet.getInt("id"),similarity);
                ids.add(mr);
                searchCount++;
            }
        }
    }
    if (searchCount == 0){
        session.setAttribute("notFound","Your Art Not Found!");
        response.sendRedirect("index.jsp");
    }
    %>
<div class="row card-group d-flex">
<%
    MergeService.mergeSort(ids);
    for (MergeEntity me : ids){
        System.out.println(me.getValue()+"  ==  "+ me.getKey());
        int artistId = AllServices.getArtistId(me.getKey());

%>
<div class="col-md-6 col-lg-3 mb-3">
    <div class="card h-100">
        <img width="300" height="300"
             src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(AllServices.getArt(me.getKey())))%>" class="card-img-top">
        <div class="card-body">
            <h5 class="card-title"><b><%= AllServices.getArtTitle(me.getKey()) %></b></h5>
            <p class="card-text">Artist: <%=AllServices.getArtistById(artistId) %>
                <br><span>Rating: <%=AllServices.getRateValue(me.getKey())%></span>
            </p>
            <a href="../ArtInfo.jsp?artId=<%=me.getKey()%>" class="btn btn-primary">More</a>
        </div>
    </div>
</div>
<%
    }
%>
</body>
</html>
