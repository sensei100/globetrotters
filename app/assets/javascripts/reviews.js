$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/reviews/" + id + "/review_data", function(data) {
     
      $("#content-" + id).text(data["content"]);
    });
  });
});