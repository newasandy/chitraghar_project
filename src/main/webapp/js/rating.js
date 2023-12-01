let star = document.querySelectorAll('input');
let showValue = document.querySelector('#rating-value');


function passArtRatingId(id){
    const ratingModal = new bootstrap.Modal('#RatingArtModal');
    for (let i = 0; i < star.length; i++) {
        star[i].addEventListener('click', function() {
            i = this.value;
            document.querySelector("#RatingValue").value=i;
        });
    document.querySelector("#ArtIdForRating").value=id;
        ratingModal.show(this);
}
}