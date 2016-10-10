 function Comment (id, content, user) {
  this.id = id;
  this.content = content;
  this.authenticity_token =  $("input[name='authenticity_token']").val();
}

Comment.prototype.createdComment = function() {
   alert(this.content + " has been created.");
}

function newComment() {
  $("#new_comment").on("submit", function(event) {
    event.preventDefault();
    var values = $(this).serialize();
    var commenting = $.post(this.action, values)
    commenting.done(function(data) {
      var comment = data.comments;
      $("#comment_content").val("");
      createNewComment(comment);
    });
  })
}

  function createNewComment(comment) {
    var commentObject = new Comment(comment.id, comment.content, comment.user)
    var $ol = $("div.comments ol");
    $ol.append("<li>" + comment.user.name + ": <br>" + comment.content + "</li>"
      );
  }
  
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



