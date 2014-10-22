$(document).ready(function() {
  console.log("hello")
  $(".search_listings").click( function(){
    console.log("listings")
    $.ajax({
      url:"/search_listings",
      dataType: "script",
      type: "GET",
      data: {q: $('.listings_search').val()}
    })
  });

});