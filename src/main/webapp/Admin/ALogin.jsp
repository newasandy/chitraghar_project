<%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 1/31/2024
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Title</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    .container-mycss{
      align-items: center;
      justify-content: center;
      width: 60%;
      margin-left: 20%;
      margin-top: 10%;
    }
    .headText{
      text-align: center;
      font-weight: bold;

    }
  </style>
</head>
<body>
<div class="container-mycss">
  <div>
    <h2 class="headText" id="exampleModalLabel">Admin Login</h2>
  </div>
  <form action="admin-login" method="post">
    <div class="col-auto">
    </div>
    <div class="col-auto">
      <label for="email" class="col-form-label">Enter Email</label><br>
      <input type="email" id="email" class="form-control" name="email" required><br>
      <label for="pass" class="col-form-label">Enter Password</label><br>
      <input type="password" id="pass" class="form-control" name="password" required>
    </div><br>
    <br>
    <button type="submit" class="btn btn-success">
      Login
    </button>
  </form>
</div>

</body>
</html>
