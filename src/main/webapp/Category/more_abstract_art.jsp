<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.chitraghar_project.dbConnection.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.example.chitraghar_project.services.AllServices" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.chitraghar_project.entity.MergeEntity" %>
<%@ page import="com.example.chitraghar_project.services.MergeService" %><%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 8/19/2023
  Time: 10:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%@include file="../navigationbar.jsp"%>
<br>
<%
    Connection m_connection = DatabaseConnection.getConnection();
    String m_artGet = "select * from request_art where status ='Approved' and art_style='abstract'";
    Statement m_statement = m_connection.createStatement();
    ResultSet m_resultSet = m_statement.executeQuery(m_artGet);
%>
<div class="row card-group d-flex">
        <%
    ArrayList<MergeEntity> arr = new ArrayList<>();
    while (m_resultSet.next()) {

      int id = m_resultSet.getInt("id");

      MergeEntity mergeEntity = new MergeEntity(id,AllServices.getRateValue(id));
      arr.add(mergeEntity);
    }
    MergeService.mergeSort(arr);
    for (MergeEntity me : arr){
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
