<%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 8/18/2023
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Login</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
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
        <label class="col-form-label">Need an Account?</label><button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#signin">Sign-Up</button>
      </div>
    </div>
  </div>
</div>
