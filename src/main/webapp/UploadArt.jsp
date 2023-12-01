<%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 8/16/2023
  Time: 5:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>ChitraGhar Home</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>


    <form enctype="multipart/form-data" action="uploadArt" method="post">
        <div class="col-auto">
            <label for="title" class="col-form-label">Title</label><br>
            <input type="text" id="title" class="form-control" name="artTitle"><br>
            <label for="artDescription">Description:</label>
            <textarea class="form-control" id="artDescription" name="artDescription" rows="4" required></textarea><br>
            <label for="artType">Art Type:</label>
            <select class="form-control" id="artType" name="artType" required>
                <option value="">Select Art Type</option>
                <option value="painting">Painting</option>
                <option value="modern_art">Modern Art</option>
                <option value="abstract">Abstract Art</option>
                <option value="expressionism">Expressionism Art</option>
            </select><br>
            <label for="artFile">Upload Art File:</label>
            <input type="file" class="form-control-file" id="artFile" name="artFile" required>
        </div><br>
        <button type="submit" class="btn btn-success">Upload</button>
        <a class="btn btn-success" href="index.jsp">Back</a>
    </form>

</body>
</html>
