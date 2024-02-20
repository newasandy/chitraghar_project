<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.chitraghar_project.dbConnection.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.example.chitraghar_project.services.AllServices" %><%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 8/18/2023
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pending</title>
</head>
<body>
<%
String adminEmail = (String) session.getAttribute("adminEmail");
if (adminEmail == null){
  response.sendRedirect("/Admin/ALogin.jsp");
}
%>
<%@include file="adminNavigation.jsp"%>
<%
  Connection connection = DatabaseConnection.getConnection();
  String artGet = "select * from request_art where status ='Pending'";
  Statement statement = connection.createStatement();
  ResultSet resultSet = statement.executeQuery(artGet);
%>



<div class="row d-flex m-2">
    <%
    while (resultSet.next()) {
      int id = resultSet.getInt("id");
      String title = resultSet.getString("title");
      String description = resultSet.getString("description");
      byte[] art = resultSet.getBytes("art");
      int artist_id = resultSet.getInt("artist_id");
      String artType = resultSet.getString("art_style");
  %>
<div class="card mb-3 m-2" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(art))%>" class="img-fluid rounded-start" >
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%=title%></h5>
        <p class="card-text"><%=AllServices.getArtistById(artist_id) %></p>


<%--        <a class="m-2" href=""><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">--%>
<%--        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>--%>
<%--        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>--%>
<%--      </svg></a>--%>

          <span onclick="passApproveId(<%=id%>)" class="m-2" href="" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cloud-plus" viewBox="0 0 16 16">
        <path style="color: darkgreen" fill-rule="evenodd" d="M8 5.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 .5-.5z"/>
        <path style="color: darkgreen" d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z"/>
        </svg> </span>


        <span onclick="passDeleteId(<%=id%>)" class="m-2" href="" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
          <path style="color: red" d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
        </svg></span>


      </div>
    </div>
  </div>
</div>
    <%
    }
  %>
</div>


<!--Decline Art modal----->
<div class="modal fade" id="deleteArtModal" tabindex="-1" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-danger">
                <span class="text-white me-2 fs-3">
                    <i class="bi bi-exclamation-triangle"></i>
                </span>
        <p class="modal-title text-white">
          Decline Request
        </p>

        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="${pageContext.request.contextPath}/declineRequest" method="POST">
        <div class="modal-body">

          <input value="" name="deleteIdInput" type="hidden" id="idForArtDelete">
          <p class="">Do you want to decline this art?</p>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger ">Decline</button>
          <button type="button" class="btn btn-success" data-bs-dismiss="modal">Cancel</button>
        </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="ApproveArtModal" tabindex="-1" aria-labelledby="" aria-hidden="true">
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
      <form action="${pageContext.request.contextPath}/approveRequest" method="POST">
        <div class="modal-body">

          <input value="" name="ApproveIdInput" type="hidden" id="idForArtApprove">
          <p class="">Do you want to Approve This Art?</p>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success ">Approve</button>
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
        </div>
      </form>
    </div>
  </div>
</div>


</body>
<script>

  function passDeleteId(id){
    const deleteModal = new bootstrap.Modal('#deleteArtModal');
    document.querySelector("#idForArtDelete").value=id;
    deleteModal.show(this);
  }

  function passApproveId(id){
    const approveModal = new bootstrap.Modal('#ApproveArtModal');
    document.querySelector("#idForArtApprove").value=id;
    approveModal.show(this);
  }
</script>

</html>
