function Review(data) {
  this.id = data.id;
  this.rating = data.rating;
  this.content = data.content;
  this.user = data.user;
  this.authenticity_token =  $("input[name='authenticity_token']").val();
}

Review.prototype.renderDisplay = function() {
  alert("Your review was created");
}

$(function() { 
  $("form#new_review").on("submit", function(event) {
    event.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json) {
      var review = new Review(json);
      var reviewDisplay = review.renderDisplay();
    })
  })
})

$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/reviews/" + id + "/review_data", function(data) {
     
      $("#content-" + id).text(data["content"]);
    });
  });
});