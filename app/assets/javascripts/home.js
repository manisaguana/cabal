$(document).ready(function() {
  logout();
});

function logout() {
  $(".username").mouseenter(function() {
    $(this).hide();
    $(".logout").css("display", "inline");
  })

  $(".logout").mouseleave(function() {
    $(".username").show();
    $(this).css("display", "none");
  })
}
