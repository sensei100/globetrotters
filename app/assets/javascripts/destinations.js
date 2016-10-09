var modalContainer = $("#modal-container");
 
var hideModal = function() {
  modalContainer.hide();
};
 
var showModal = function() {
  modalContainer.show();
};
 
var modalShowDiv = $("#show");
modalShowDiv.on("mouseover", showModal);
 
var modalCloseDiv = $("#hide");
modalCloseDiv.off("mouseover", hideModal);
 
$(document).on("keyup", function(evt) {
  evt = evt || window.event; // support IE
 
  // if escape key is pressed, hide the modal
  if (evt.keyCode === 27) {
    hideModal();
  }
});
  

  $(function () {
  $("#new_comment").on("submit", function(event) {
    event.preventDefault();
    url = this.action
    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
      'comment': {
        'content': $("#comment_content").val(),
        'user_id': $("#comment_user_id").val()
      }
    };

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response){
        $("#comment_content").val("")
        var $ol = $("div.comments ol");
        $ol.append(response);
      }
    });
  })
})

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
    var $ol = $("div.comments ol")
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


