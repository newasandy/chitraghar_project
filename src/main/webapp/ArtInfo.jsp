<%@ page import="com.example.chitraghar_project.dbConnection.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.example.chitraghar_project.services.AllServices" %><%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 8/17/2023
  Time: 1:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="css/rating.css">
</head>
<body>
<%@include file="navigationbar.jsp"%>

<br>
<%
  Connection conn = DatabaseConnection.getConnection();
  String artGetInfo = "select * from request_art where id=?";
  PreparedStatement preparedStatement = conn.prepareStatement(artGetInfo);
  int gId = Integer.parseInt(request.getParameter("artId").toString());
  preparedStatement.setInt(1,gId);
  ResultSet resultSetinfo = preparedStatement.executeQuery();

  while (resultSetinfo.next()){
    int id = resultSetinfo.getInt(1);
    String title = resultSetinfo.getString(2);
    String description = resultSetinfo.getString("description");
    byte[] art = resultSetinfo.getBytes("art");
    String artType = resultSetinfo.getString("art_style");
    int artist_id = resultSetinfo.getInt("artist_id");

%>
<div class="card mb-3 w-50 m-auto">
  <div class="row g-0">
    <div class="col-md-8 ">
      <img src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(art))%>" class="img-fluid rounded-start">
    </div>
    <div class="col-md-4">
      <div class="card-body">
        <a class="bg-dark text-decoration-none p-2 rounded-5 "  href="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(art))%>" download="<%=art%>.jpg"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
          <path style="color: #ffffff" d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
          <path style="color: #ffffff" d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
        </svg> </a><h4 class="card-title text-center"><%=title%></h4>
        <h5 class="card-text text-center"><%=AllServices.getArtistById(artist_id) %></h5>
        <p class="card-text text-center"><%= description%></p>
        <p class="card-text text-center"><small class="text-body-secondary"><%=artType%></small></p>


<%--Rating Star--%>
        <div class="container">
  <div class="rating-wrap">
    <div class="center">
      <fieldset class="rating">
        <input onclick="passArtRatingId(<%=gId%>,5)" type="radio" id="star5" name="rating" value="5"/><label for="star5" class="full" title="Awesome"></label>
        <input onclick="passArtRatingId(<%=gId%>,4.5)" type="radio" id="star4.5" name="rating" value="4.5"/><label for="star4.5" class="half"></label>
        <input onclick="passArtRatingId(<%=gId%>,4)" type="radio" id="star4" name="rating" value="4"/><label for="star4" class="full"></label>
        <input onclick="passArtRatingId(<%=gId%>,3.5)" type="radio" id="star3.5" name="rating" value="3.5"/><label for="star3.5" class="half"></label>
        <input onclick="passArtRatingId(<%=gId%>,3)" type="radio" id="star3" name="rating" value="3"/><label for="star3" class="full"></label>
        <input onclick="passArtRatingId(<%=gId%>,2.5)" type="radio" id="star2.5" name="rating" value="2.5"/><label for="star2.5" class="half"></label>
        <input onclick="passArtRatingId(<%=gId%>,2)" type="radio" id="star2" name="rating" value="2"/><label for="star2" class="full"></label>
        <input onclick="passArtRatingId(<%=gId%>,1.5)" type="radio" id="star1.5" name="rating" value="1.5"/><label for="star1.5" class="half"></label>
        <input onclick="passArtRatingId(<%=gId%>,1)" type="radio" id="star1" name="rating" value="1"/><label for="star1" class="full"></label>
        <input onclick="passArtRatingId(<%=gId%>,0.5)" type="radio" id="star0.5" name="rating" value="0.5"/><label for="star0.5" class="half"></label>
      </fieldset>
    </div>
    <%  }%>
<%--  Rating Pass model  --%>
<%
if (sEmail != null && sPassword != null){
%>
    <div class="modal fade" id="RatingArtModal" tabindex="-1" aria-labelledby="" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header bg-success">
                <span class="text-white me-2 fs-3">
                    <i class="bi bi-exclamation-triangle"></i>
                </span>
            <p class="modal-title text-white">
              Approve request
            </p>

            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="${pageContext.request.contextPath}/ratingArt" method="POST">
            <div class="modal-body">

              <input value="" name="ArtRatingIdInput" type="hidden" id="ArtIdForRating">
              <input value="" name="RatingValueInput" type="hidden" id="RatingValue">
              <p class="">Do you want to Rate This Art?</p>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-success ">Approve</button>
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
            </div>
          </form>
        </div>
      </div>
    </div>


  </div>
</div>

      </div>
    </div>
  </div>
</div>

<script>
  let star = document.querySelectorAll('input');
  let showValue = document.querySelector('#rating-value');
  function passArtRatingId(id,rate){
    const ratingModal = new bootstrap.Modal('#RatingArtModal');
    document.querySelector("#RatingValue").value=rate;
    document.querySelector("#ArtIdForRating").value=id;
    ratingModal.show(this);
  }
</script>

<%}
%>
</body>
</html>
