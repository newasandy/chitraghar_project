<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>ChitraGhar Home</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0">

<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="../index.jsp">ChitraGhar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="../index.jsp">Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Categories
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Painting</a></li>
                        <li><a class="dropdown-item" href="#">Modern Art</a></li>
                        <li><a class="dropdown-item" href="#">Abstract Art</a></li>
                        <li><a class="dropdown-item" href="#">Expressionism Art</a></li>
                    </ul>
                </li>

                <%

                    String sEmail = (String) session.getAttribute("email");
                    String sPassword = (String) session.getAttribute("password");
                    if (sEmail != null || sPassword != null) {


                %>

                <li class="nav-item">
                    <a class="nav-link" href="../UploadArt.jsp">Upload Art</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../UserArtsStatus/UserArtsStatus.jsp">My Arts</a>
                </li>

                <%
                    }
                %>

                <li class="nav-item">
                    <a class="nav-link" href="../About.jsp">About</a>
                </li>
            </ul>
            <form class="d-flex" role="search" action="searchArt" method="post">
                <div class="input-group mb-3">
                    <input onInput="searchValid()" id="searchTxt" type="text" name="searchTxt" class="form-control" placeholder="Search" aria-label="Recipient's username"
                           aria-describedby="button-addon2">
                    <button class="btn btn-success" type="submit" id="button-addon2" disabled="true">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                    </button>
                </div>
                <%

                    if (sEmail == null || sPassword == null) {


                %>
                <div>
                    <button type="button" class="btn btn-outline-danger ms-1" data-bs-toggle="modal"
                            data-bs-target="#exampleModal">
                        Login
                    </button>
                </div>
                <%
                } else if (sEmail != null || sPassword != null) {

                %>
                <a href="logout">
                    <div>
                        <button type="button" class="btn btn-outline-success ms-1">
                            Logout
                        </button>
                    </div>
                </a>
                <%
                    }
                %>

            </form>

            <%--            login modal--%>

            <%@include file="LoginModal.jsp" %>

            <%--            Sign-In modal--%>

            <%@include file="SignUpModal.jsp" %>


        </div>
    </div>
</nav>
<script>
    function searchValid(){

        const inputTxt = document.getElementById("searchTxt").value;
        if (inputTxt == ""){
            document.getElementById("button-addon2").disabled = true;
        }else {
            document.getElementById("button-addon2").disabled = false;
        }

    }

</script>

<!-- End Example Code -->
</body>
</html>