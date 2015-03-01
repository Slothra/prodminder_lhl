$(function() {

  $(".switch").on("click", function() {
    $(this).toggleClass(".is-on");
  });


  $(".new-users-signup").submit(function(e) {
    var $form;
    $form = $(this);
    e.preventDefault();
    e.stopPropagation();

    console.log( $form.serialize() );

    $.ajax({
      url: "/user/create",
      type: "POST",
      data: $form.serialize(),
      success: function(data, textStatus, jqXHR){
        console.log("success");
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
        console.log("somethings wrong")
      }

    });


  });


});
