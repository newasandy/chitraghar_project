<%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 8/18/2023
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
<div class="modal fade" id="signin" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-success">
        <h1 class="modal-title fs-5" id="exampleModalLabel1">Sign-Up</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="signup" method="post">
          <div class="col-auto">
            <label for="sname" class="col-form-label">Enter Name</label><br>
            <input type="text" id="sname" class="form-control" name="name" required><br>
            <label for="semail" class="col-form-label">Enter Email</label><br>
            <input onInput="validCheck()" type="email" id="semail" class="form-control" name="email" required><br>
            <span id="emailError" style="color: red;"></span><br>
            <label  for="spass" class="col-form-label">Enter Password</label><br>
            <input onInput="validCheck()" type="password" id="spass" class="form-control" name="password" required>
            <span id="passwordError" style="color: red;"></span><br>
            <label for="scpass" class="col-form-label">Confirm Password</label><br>
            <input onInput="validCheck()" type="password" id="scpass" class="form-control" name="cpassword" required>
            <span id="cpasswordError" style="color: red;"></span><br>
          </div><br>
          <div class="col-12">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="invalidCheck1" required>
              <label class="form-check-label" for="invalidCheck1">
                Agree to terms and conditions
              </label>
            </div>
          </div><br>
          <button type="submit" id="signUP" class="btn btn-success" disabled>
            Sign-Up
          </button>
        </form>
        <label class="col-form-label">Already have an Account?</label><button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">Login</button>
      </div>
    </div>
  </div>
</div>
<script>

  function validCheck(){
    var password = document.getElementById("spass").value;
    var  cpassword = document.getElementById("scpass").value;
    var email = document.getElementById("semail").value;

    let count = 0;

    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)){
      document.getElementById("emailError").innerHTML = "Please enter a valid email address.";
      count++;
    }else {
      document.getElementById("emailError").innerHTML = "";
    }

    if (password.length < 8 || password.length > 12 || !password.match(/[0-9]/i) || !password.match(/[A-Z]/) || !password.match(/[a-z]/) || !password.match(/[!@#$%^&*_?():;]/i) ){
      var  err = document.getElementById("passwordError").innerHTML=
              "Password should be more then 8 charater<br>" +
              "Password must be less then 12 charater<br>" +
              "Password must include at least one uppercase<br>" +
              "Password must include at least one lowercase<br>" +
              "Password must include at least one digit<br>" +
              "Password must include at least one special character<br>";
      count++;
    }else {
      var  err = document.getElementById("passwordError").innerHTML = "";
    }

    if (cpassword != password){
      document.getElementById("cpasswordError").innerHTML = "Password does not match";
      count++;
    }else {
      document.getElementById("cpasswordError").innerHTML = "";
    }
    if (count != 0){
      document.getElementById("signUP").disabled = true;
    }else{
      document.getElementById("signUP").disabled = false;
    }
  }

</script>