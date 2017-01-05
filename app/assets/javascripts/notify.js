$(function(){
  var title_main = document.title;
  setInterval(function(){
    $.post("/get_notify", function(data){
      $(".order_top").text(data.order_top);
      //$(".order_top_2").text(data.order_top_2);
      $(".alert-block .message").text(data.message_top);
      $(".alert-block .sound").text(data.audiomessage_top);
      //$(".message_top_2").text(data.message_top_2);
      //parseInt(data.order_top) + parseInt(data.order_top_2) + 
      var all_count = parseInt(data.message_top) + parseInt(data.audiomessage_top);
      if (all_count > 0) {
        icon = $("#favicon");
        cache = icon.clone();
        cache.attr("href", "/assets/favicon-alert.png");
        icon.replaceWith(cache);
        document.title = "(" + all_count + ")" + " " + title_main;
      } else {
        icon = $("#favicon");
        cache = icon.clone();
        cache.attr("href", "/assets/favicon.png");
        icon.replaceWith(cache);
        document.title = title_main;
      }
    });
  }, 5000);

});
