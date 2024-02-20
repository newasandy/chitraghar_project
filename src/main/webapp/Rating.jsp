<%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 8/17/2023
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="css/rating.css">
</head>
<body>
<div class="container">
  <div class="rating-wrap">
    <div class="center">

      <fieldset class="rating">
        <input onclick="passArtRatingId()" type="radio" id="star5" name="rating" value="5"/><label for="star5" class="full" title="Awesome"></label>
        <input onclick="passArtRatingId()" type="radio" id="star4.5" name="rating" value="4.5"/><label for="star4.5" class="half"></label>
        <input onclick="passArtRatingId()" type="radio" id="star4" name="rating" value="4"/><label for="star4" class="full"></label>
        <input onclick="passArtRatingId()" type="radio" id="star3.5" name="rating" value="3.5"/><label for="star3.5" class="half"></label>
        <input onclick="passArtRatingId()" type="radio" id="star3" name="rating" value="3"/><label for="star3" class="full"></label>
        <input onclick="passArtRatingId()" type="radio" id="star2.5" name="rating" value="2.5"/><label for="star2.5" class="half"></label>
        <input onclick="passArtRatingId()" type="radio" id="star2" name="rating" value="2"/><label for="star2" class="full"></label>
        <input onclick="passArtRatingId()" type="radio" id="star1.5" name="rating" value="1.5"/><label for="star1.5" class="half"></label>
        <input onclick="passArtRatingId()" type="radio" id="star1" name="rating" value="1"/><label for="star1" class="full"></label>
        <input onclick="passArtRatingId()" type="radio" id="star0.5" name="rating" value="0.5"/><label for="star0.5" class="half"></label>
      </fieldset>
    </div>

<%--    <input id="rating-value" name="rating" value="">--%>


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
<script src="js/rating.js"></script>
</body>
</html>
