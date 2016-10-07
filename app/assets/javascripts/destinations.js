
$(function () {
  $(".js-next").on("click", function(e) {
    e.preventDefault()
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/reviews/" + nextId + ".json", function(data) {
      $("#rating").text("Rating: " + data["rating"]);
      $("#reviewContent").text(data["content"]);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });

$("a.loadComments").on("click", function(e){
 
  $.get(this.href).success(function(json){
    var $ol = $("div.commentDiv ol")
    $ol.html("") 
    json.forEach(function(comment) {
      $ol.append("<li>" + comment.user.name + ": <br>" + comment.content + "</li><br>");
    })
    })
    e.preventDefault();
  })
  }); 

//JS Model Object for Review
function Review(json) {
  this.rating = json.rating;
  this.content = json.content;
  this.user = json.user.name;

  this.numberOfReviews = function() {
    return json.user.name + " has written " + json.user.reviews.size + " reviews.";
  }
}
