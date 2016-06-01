$(document).ready(function() {
  $('.flipControl').on('click', function(){
    $(this).closest('.card').toggleClass('flipped');
  });
});
