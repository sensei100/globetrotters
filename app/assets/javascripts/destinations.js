  function Comment(data) {
  this.id = data.id;
  this.content = data.content;
  this.user = data.user;
}

Comment.prototype.renderDisplay = function() {
  var html = "";
  html += "<li>" + this.user.name + ": <br>" + this.content + "</li><br>";
  $("div.comments ol").append(html);
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

// add disabled class to the last one?
// add author info and review count?
// possible hover card or modal box for user info?

$(function () {

  function reviews() {
    $("#rating").text("Rating: " + data["reviews"][index].rating);
    $("#reviewContent").text(data["reviews"][index].content);
  }
  var data = [];
  var index = 0;
  var destId = $(".js-next").attr("data-destination");


  $.ajax({
    url: "/destinations/" + destId + ".json",
    type: "GET",
    dataType: "json",
    success: function(json) { 
      data = json;
      reviews();
    } 
  });

  // function addClick(which) {
  //   $(".js-" + which).on("click", function(e) { 
  //     var = conditional
  //     if (which === 'next') {
  //       conditional = (index < data["reviews"].length - 1 )
  //       $(".js-" + 'previous').attr("disabled", false);
  //       index += 1
  //     } else {
  //      conditional =  (index < data["reviews"].length - 1 )
  //       $(".js-" + 'next').attr("disabled", false);
  //       index -= 1
  //   if (conditional) {
  //     reviews();
  //     if (index === data["reviews"].length - 1) {
  //       $(this).attr("disabled", true);
  //     }
  //   }
  // });
  // }

  // addClick('next')
  // addClick('previous')

  $(".js-next").on("click", function(e) { 
    if (index < data["reviews"].length - 1 ) {
      $(".js-previous").attr("disabled", false);
      index += 1;
      reviews();
      if (index === data["reviews"].length - 1) {
        $(this).attr("disabled", true);
      }
    }
  });

    $(".js-previous").on("click", function(e) { 
    if (index > 0) {
      $(".js-next").attr("disabled", false);
      index -= 1;
      reviews();
    } 
    if (index === 0) {
      $(this).attr("disabled", true);
    }
  });
})

// do I need to include destination_id?
// do I even need this object?
function Review(data) {
    this.id = data.id;
    this.content = data.content;
    this.rating = data.rating;
    this.user = data.user;
}

$(function () {
$("a.loadComments").on("click", function(e){
  
  $.get(this.href).success(function(json){
    var $ol = $("div.comments ol")
    $ol.html("") 
    json.forEach(function(comment) {
      $ol.append("<li>" + comment.user.name + ": <br>" + comment.content + "</li><br>");
    })
    })
    e.preventDefault();
  
  }); 
})



