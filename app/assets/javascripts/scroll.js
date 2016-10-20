$(function() {

  var nowPosition = $(window).scrollTop();

  $(window).scroll(function() {

    // それぞれの要素の位置
    var $offsetSlide1 = $(".slide-1").offset().top;
    var $offsetSlide2 = $(".slide-2").offset().top;
    var $offsetSlide3 = $(".slide-3").offset().top;
    var $offsetSlide4 = $(".slide-4").offset().top;

    var diffPosition = nowPosition - $(window).scrollTop();
    nowPosition = (-1 * diffPosition) + nowPosition;
  });
});
