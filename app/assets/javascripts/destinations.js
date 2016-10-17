 function Comment(data) {
  this.id = data.id;
  this.content = data.content;
  this.user = data.user;
}

Comment.prototype.renderDisplay = function() {
  var html = "";
  html += "<p>" + this.user.name + ": <br>" + this.content + "</p><br>";
  $("#lastComment p").append(html);
}

$(function() { 
  $("form#new_comment").on("submit", function(event) {
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
      $('#new_comment').hide();
      var comment = new Comment(json);
      comment.renderDisplay();
      
    })
  })
})
      
$(function () {
  $(".js-next").on("click", function(e) {
    e.preventDefault()
    var destId = parseInt($(".js-next").attr("data-destination"))
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/destinations/" + destId + "/reviews/" + nextId + ".json", function(data) {
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



