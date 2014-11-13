$(function(){
  $("body").on("load", "landing-top-image", startTimer());
});

var displayNextImage = function(){
  x = (x === images.length - 1) ? 0 : x + 1;
  var image = $(".landing-top-image");

  image.attr("src", images[x]);
};

var startTimer = function(){
  setInterval(displayNextImage, 3000);
};

var images = [], x = -1;
images[0] = "Travel-Agent1.jpg";
images[1] = "Travel_Program_fi.jpg";
