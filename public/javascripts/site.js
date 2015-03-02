$(function() {

  $(".switch").on("click", function() {
    $(this).toggleClass(".is-on");
  });

  $(".card-enabled .card-switch-input").prop("checked", true);

  $(".ajax-container.wrong .wrong-try-again").on("click", function(e) {
    e.preventDefault();
    e.stopPropagation();
    $(".card.new-user").removeClass("is-wrong");
    $("form.new-users-signup").show();
  });

  $(".new-users-signup").submit(function(e) {
    $form = $(this);
    $formParent = $(".card.new-user");
    e.preventDefault();
    e.stopPropagation();

    // strip any non digit characters from phone number
    var inputPhone = $form.find(".phone").val();
    var cleanPhone = inputPhone.replace(/\D/g,'');

    var inputEmail = $form.find(".email").val().trim();
    var inputBirthYear = $form.find(".birth-year").val();
    var inputBirthMonth = $form.find(".birth-month").val();
    inputBirth = inputBirthYear + "-" + inputBirthMonth;
    // var inputBirth = $form.find(".birth").val();

    var inputGender = $form.find(".gender").val();

    // console.log( "inputEmail: " + inputEmail );
    // console.log( "inputPhone: " + cleanPhone );
    // console.log( "inputBirth: " + inputBirth );
    // console.log( "inputGender: " + inputGender );

    var switches = $(".card-controls");
    var screenings_enabled = [];
    $.each(switches, function(index, el){
      if($(el).find(".card-switch-input").prop("checked")) {
        screenings_enabled.push($(el).find(".card-switch-meta").data("screening-id"));
      }
    });

    formData = {
      "email": inputEmail,
      "phone": cleanPhone,
      "age": inputBirth,
      "gender": inputGender,
      "screening_id": screenings_enabled
    };

    // console.log( $.param(formData) );

    $.ajax({
      url: "/user/create",
      type: "POST",
      data: formData,
      beforeSend: function(data, textStatus, jqXHR){

        $formParent.addClass("is-sending");
        setTimeout(function() {
          $form.css('display', 'none');
        }, 151);

      },
      success: function(data, textStatus, jqXHR){
        $formParent.removeClass("is-sending");
        $formParent.addClass("is-success");
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
        $formParent.removeClass("is-sending");
        $formParent.addClass("is-wrong");
      }

    });

  });


});
