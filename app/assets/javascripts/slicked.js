var $jq = jQuery.noConflict();
$jq(document).ready(function(){
  $jq('.orgslick').slick({
    slidesToShow: 3,
    dots:true,
    centerMode: true,
  });
});