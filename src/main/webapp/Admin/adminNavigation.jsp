<%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 8/18/2023
  Time: 9:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Navigation</title>
    <link rel="stylesheet" type="text/css" href="../Bootstrap/css/bootstrap.css">
    <script src="../Bootstrap/js/bootstrap.bundle.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">ChitraGhar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="UploadRequest.jsp">Art Upload Request</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="ApprovedArt.jsp">Approved Art</a>
                </li>


            </ul>
            <form action="adminlogout" method="post" class="d-flex">
<%--                <div class="input-group mb-3">--%>
<%--                    <input type="text" class="form-control" placeholder="Search" aria-label="Recipient's username" aria-describedby="button-addon2">--%>
<%--                    <button class="btn btn-success" type="submit" id="button-addon2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">--%>
<%--                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>--%>
<%--                    </svg></button>--%>
<%--                </div>--%>

                        <button type="submit" class="btn btn-outline-success ms-1">
                            Logout
                        </button>

            </form>
        </div>
    </div>
</nav>
</body>
</html>
