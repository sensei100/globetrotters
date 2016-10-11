 function Comment(data) {
  this.id = data.id;
  this.content = data.content;
  this.user = data.user;
  this.authenticity_token =  $("input[name='authenticity_token']").val();
}

Comment.prototype.renderDisplay = function() {
  alert("Your comment was created");
  var html = "";
  html += "<p>" + this.user.name + ": <br>" + this.content + "</p><br>";
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
      var comment = new Comment(json);
      var commentDisplay = comment.renderDisplay();

      $('#lastComment p').append(commentDisplay);

    })
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



