$(document).ready(function() {
  logout();
  toggleSignup();
  toggleLogin();
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

function toggleSignup() {
  $("#signup").click(function(e) {
    e.preventDefault();
    $(".hidden_signup_form").slideToggle();  
    $(".hidden_login_form").slideUp();  
  });
}

function toggleLogin() {
  $("#login").click(function(e) {
    e.preventDefault();
    $(".hidden_login_form").slideToggle();  
    $(".hidden_signup_form").slideUp();  
  });
}
