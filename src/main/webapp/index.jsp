<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.chitraghar_project.entity.ArtEntity" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.chitraghar_project.dbConnection.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>


</head>
<body>
<div>
    <%@ include file="navigationbar.jsp" %>
</div>
<br>

<%
    String notFind = (String) session.getAttribute("notFound");
    if (notFind != null){
%>
<div class="alert alert-danger alert-dismissible fade show " role="alert">
    <%=notFind%>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%
    }
    session.removeAttribute("notFound");
%>

<%
    String logMsg = (String) session.getAttribute("loginMsg");
    String name = (String) session.getAttribute("name");
    if ((sEmail != null || sPassword != null) && logMsg == "loginSuccess" ) {
%>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <strong class="me-auto">Login</strong>
            <small>Now</small>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            Hello <%= name%>, You are login successfully.
        </div>
    </div>
</div>

<script>
    const toastLiveExample = document.getElementById('liveToast')
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
    toastBootstrap.show()
</script>
<%
        session.removeAttribute("loginMsg");
    }
%>



    <div>
        <%
            String error = (String) request.getAttribute("pError");
            if (error != null) {
        %>
        <p class="alert alert-danger " >${pError}</p>
        <% } %>
    </div>
<%--Recommended art--%>
<%

    if (sEmail != null || sPassword != null) {


%>

<div class="col-md-12">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
                        <span>
                            For You
                        </span>


        </div>
        <div class="card-body">
            <jsp:include page="Category/RecommendationSection.jsp"/>
        </div>
    </div>
</div>
<br/>

<%
    }
%>


<%--modern art--%>
<div class="col-md-12">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
                        <span>
                            Modern Art
                        </span>

            <a href="/Category/more_modern_art.jsp" class="text-decoration-none">
                            <span class="me-lg-3 link-danger">
                                 View More >
                            </span>
            </a>
        </div>
        <div class="card-body">
            <jsp:include page="Category/modern_art.jsp"/>
        </div>
    </div>
</div>
<br/>

<%--Abstract art--%>
<div class="col-md-12">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
                        <span>
                            Abstract Art
                        </span>

            <a href="Category/more_abstract_art.jsp" class="text-decoration-none">
                            <span class="me-lg-3 link-danger">
                                 View More >
                            </span>
            </a>
        </div>
        <div class="card-body">
            <jsp:include page="Category/abstract_art.jsp"/>
        </div>
    </div>
</div>
<br/>

<%--expressionism art--%>
<div class="col-md-12">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
                        <span>
                            Expressionism Art
                        </span>

            <a href="Category/more_expressionism_art.jsp" class="text-decoration-none">
                            <span class="me-lg-3 link-danger">
                                 View More >
                            </span>
            </a>
        </div>
        <div class="card-body">
            <jsp:include page="Category/expressionism_art.jsp"/>
        </div>
    </div>
</div>
<br/>

<%--painting art--%>
<div class="col-md-12">
    <div class="card">
        <div class="card-header d-flex justify-content-between">
                        <span>
                            Painting Art
                        </span>

            <a href="Category/more_painting_art.jsp" class="text-decoration-none">
                            <span class="me-lg-3 link-danger">
                                 View More >
                            </span>
            </a>
        </div>
        <div class="card-body">
            <jsp:include page="Category/painting_art.jsp"/>
        </div>
    </div>
</div>
<br/>


</body>
</html>