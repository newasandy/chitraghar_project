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
    <title>Title</title>
</head>
<body>
<form action="login" method="post">
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
</body>
</html>
