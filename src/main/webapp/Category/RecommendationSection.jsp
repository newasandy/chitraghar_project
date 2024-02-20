<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.chitraghar_project.dbConnection.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.example.chitraghar_project.services.CosineSimilarityAlgo" %>
<%@ page import="com.example.chitraghar_project.services.AllServices" %>
<%@ page import="com.example.chitraghar_project.entity.MergeEntity" %>
<%@ page import="com.example.chitraghar_project.services.MergeService" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 2/3/2024
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<Integer> list1 = new ArrayList<>();
  Map<Integer, Integer> vector1 = new HashMap<>();
  int userID = (Integer) session.getAttribute("userId");
  Connection connection = DatabaseConnection.getConnection();
  String GetSearch_art = "select * from rating_collection where user_id =?";
  PreparedStatement preparedStatement = connection.prepareStatement(GetSearch_art);
  preparedStatement.setInt(1,userID);
  ResultSet resultSet = preparedStatement.executeQuery();
  while (resultSet.next()){
    list1.add(resultSet.getInt(2));
    vector1.put(resultSet.getInt(2),1);

  }

  List<Integer> dissimilarList = new ArrayList<>();
  Connection connection1 = DatabaseConnection.getConnection();
  String findUid = "select * from users";
  Statement statement = connection1.createStatement();
  ResultSet resultSet1 = statement.executeQuery(findUid);
  while (resultSet1.next()){
    List<Integer> list2 = new ArrayList<>();
    Map<Integer, Integer> vector2 = new HashMap<>();
    int uID = resultSet1.getInt(1);
    Connection connection2 = DatabaseConnection.getConnection();
    String artId = "select * from rating_collection where user_id =?";
    PreparedStatement preparedStatement1 = connection2.prepareStatement(artId);
    preparedStatement1.setInt(1,uID);
    ResultSet resultSet2 = preparedStatement1.executeQuery();
    while (resultSet2.next()){
      list2.add(resultSet2.getInt(2));
      vector2.put(resultSet2.getInt(2),1);
    }
    double similarity = CosineSimilarityAlgo.cosineSimilarityForReco(vector1,vector2);
    if (similarity > 0 && similarity<=1){
      for (int value : list2) {
        if (!list1.contains(value) && !dissimilarList.contains(value)) {
          dissimilarList.add(value);
        }
      }
    }
  }

  List<Integer> pickedNumbers = AllServices.pickRandomId(dissimilarList, 4);
  %>
<div class="row card-group d-flex">
<%
  for (int i =0 ; i<pickedNumbers.size(); i++){
    int artistId = AllServices.getArtistId(pickedNumbers.get(i));
    %>

  <div class="col-md-6 col-lg-3 mb-3">
    <div class="card h-100">
      <img width="300" height="300"
           src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(AllServices.getArt(pickedNumbers.get(i))))%>" class="card-img-top">
      <div class="card-body">
        <h5 class="card-title"><b><%= AllServices.getArtTitle(pickedNumbers.get(i)) %></b></h5>
        <p class="card-text">Artist:<%=AllServices.getArtistById(artistId) %>
          <br><span>Rating:  <%=AllServices.getRateValue(pickedNumbers.get(i))%> </span>
        </p>
        <a href="../ArtInfo.jsp?artId=<%=pickedNumbers.get(i)%>" class="btn btn-primary">More</a>
      </div>
    </div>
  </div>

<%
  }
%>
</div>


