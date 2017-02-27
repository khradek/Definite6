$(".subscriptions.new, .registrations.edit").ready(function() {

  Stripe.setPublishableKey( $("meta[name='stripe-key']").attr("content"));

  var $form = $('#payment-form');
  $form.submit(function(event) {
    // Disable the submit button to prevent repeated clicks:
    $form.find('.submit').prop('disabled', true);

    // Request a token from Stripe:
    Stripe.card.createToken($form, stripeResponseHandler);

    // Prevent the form from being submitted:
    return false;
  });

  //Arrow functionality on Account Settings page
  $("#situation-names-link").click(function(){
    $(this).find(".right-arrow, .down-arrow").toggle();
    $("#situation-names-section").toggle("blind");
  })

  $("#charges-link").click(function(){
    $(this).find(".right-arrow, .down-arrow").toggle();
    $("#charges-section").toggle("blind");
  })
  
  $("#update-card-link").click(function(){
    $(this).find(".right-arrow, .down-arrow").toggle();
    $("#update-card-section").toggle("blind");
  })

  $("#deactivate-account-link").click(function(){
    $(this).find(".right-arrow, .down-arrow").toggle();
    $("#deactivate-account-section").toggle("blind");
  })


  ////////// Update Situation Sliders //////////
  //Situation 2
  if($('#name2-runs').val() == 14){
    var newValue = 15
    var passValue = 0
  } else if($('#name2-runs').val() == 15){
    var newValue = 15
    var passValue = 0
  } else if($('#name2-runs').val() == 0){
    var newValue = 0
    var passValue = 15
  } else {
    var newValue = $('#name2-runs').val();
    var passValue = 14 - newValue
  }
  $('#name2-run-count').html(newValue);
  $('#name2-pass-count').html(passValue)
  
  $('#name2-runs').on('change', function() {
    if($('#name2-runs').val() == 14){
      var newValue = 15
      var passValue = 0
    } else if($('#name2-runs').val() == 15){
      var newValue = 15
      var passValue = 0
    } else if($('#name2-runs').val() == 0){
      var newValue = 0
      var passValue = 15
    } else {
      var newValue = $('#name2-runs').val();
      var passValue = 14 - newValue
    }
    $('#name2-run-count').html(newValue);
    $('#name2-pass-count').html(passValue)
  });

  //Situation 3
  if($('#name3-runs').val() == 11){
    var newValue = 12
    var passValue = 0
  } else if($('#name3-runs').val() == 12){
    var newValue = 12
    var passValue = 0
  } else if($('#name3-runs').val() == 0){
    var newValue = 0
    var passValue = 12
  } else {
    var newValue = $('#name3-runs').val();
    var passValue = 11 - newValue
  }
  $('#name3-run-count').html(newValue);
  $('#name3-pass-count').html(passValue)
  
  $('#name3-runs').on('change', function() {
    if($('#name3-runs').val() == 11){
      var newValue = 12
      var passValue = 0
    } else if($('#name3-runs').val() == 12){
      var newValue = 12
      var passValue = 0
    } else if($('#name3-runs').val() == 0){
      var newValue = 0
      var passValue = 12
    } else {
      var newValue = $('#name3-runs').val();
      var passValue = 11 - newValue
    }
    $('#name3-run-count').html(newValue);
    $('#name3-pass-count').html(passValue)
  });

  //Situation 6
  if($('#name6-runs').val() == 11){
    var newValue = 12
    var passValue = 0
  } else if($('#name6-runs').val() == 12){
    var newValue = 12
    var passValue = 0
  } else if($('#name6-runs').val() == 0){
    var newValue = 0
    var passValue = 12
  } else {
    var newValue = $('#name6-runs').val();
    var passValue = 11 - newValue
  }
  $('#name6-run-count').html(newValue);
  $('#name6-pass-count').html(passValue)
  
  $('#name6-runs').on('change', function() {
    if($('#name6-runs').val() == 11){
      var newValue = 12
      var passValue = 0
    } else if($('#name6-runs').val() == 12){
      var newValue = 12
      var passValue = 0
    } else if($('#name6-runs').val() == 0){
      var newValue = 0
      var passValue = 12
    } else {
      var newValue = $('#name6-runs').val();
      var passValue = 11 - newValue
    }
    $('#name6-run-count').html(newValue);
    $('#name6-pass-count').html(passValue)
  });

  //Situation 4
  if($('#name4-runs').val() == 10){
    var newValue = 11
    var passValue = 0
  } else if($('#name4-runs').val() == 11){
    var newValue = 11
    var passValue = 0
  } else if($('#name4-runs').val() == 0){
    var newValue = 0
    var passValue = 11
  } else {
    var newValue = $('#name4-runs').val();
    var passValue = 10 - newValue
  }
  $('#name4-run-count').html(newValue);
  $('#name4-pass-count').html(passValue)
  
  $('#name4-runs').on('change', function() {
    if($('#name4-runs').val() == 10){
      var newValue = 11
      var passValue = 0
    } else if($('#name4-runs').val() == 11){
      var newValue = 11
      var passValue = 0
    } else if($('#name4-runs').val() == 0){
      var newValue = 0
      var passValue = 11
    } else {
      var newValue = $('#name4-runs').val();
      var passValue = 10 - newValue
    }
    $('#name4-run-count').html(newValue);
    $('#name4-pass-count').html(passValue)
  });

  //Situation 7
  if($('#name7-runs').val() == 10){
    var newValue = 11
    var passValue = 0
  } else if($('#name7-runs').val() == 11){
    var newValue = 11
    var passValue = 0
  } else if($('#name7-runs').val() == 0){
    var newValue = 0
    var passValue = 11
  } else {
    var newValue = $('#name7-runs').val();
    var passValue = 10 - newValue
  }
  $('#name7-run-count').html(newValue);
  $('#name7-pass-count').html(passValue)
  
  $('#name7-runs').on('change', function() {
    if($('#name7-runs').val() == 10){
      var newValue = 11
      var passValue = 0
    } else if($('#name7-runs').val() == 11){
      var newValue = 11
      var passValue = 0
    } else if($('#name7-runs').val() == 0){
      var newValue = 0
      var passValue = 11
    } else {
      var newValue = $('#name7-runs').val();
      var passValue = 10 - newValue
    }
    $('#name7-run-count').html(newValue);
    $('#name7-pass-count').html(passValue)
  });

  //Situation 5
  if($('#name5-runs').val() == 10){
    var newValue = 11
    var passValue = 0
  } else if($('#name5-runs').val() == 11){
    var newValue = 11
    var passValue = 0
  } else if($('#name5-runs').val() == 0){
    var newValue = 0
    var passValue = 11
  } else {
    var newValue = $('#name5-runs').val();
    var passValue = 10 - newValue
  }
  $('#name5-run-count').html(newValue);
  $('#name5-pass-count').html(passValue)
  
  $('#name5-runs').on('change', function() {
    if($('#name5-runs').val() == 10){
      var newValue = 11
      var passValue = 0
    } else if($('#name5-runs').val() == 11){
      var newValue = 11
      var passValue = 0
    } else if($('#name5-runs').val() == 0){
      var newValue = 0
      var passValue = 11
    } else {
      var newValue = $('#name5-runs').val();
      var passValue = 10 - newValue
    }
    $('#name5-run-count').html(newValue);
    $('#name5-pass-count').html(passValue)
  });

  //Situation 8
  if($('#name8-runs').val() == 10){
    var newValue = 11
    var passValue = 0
  } else if($('#name8-runs').val() == 11){
    var newValue = 11
    var passValue = 0
  } else if($('#name8-runs').val() == 0){
    var newValue = 0
    var passValue = 11
  } else {
    var newValue = $('#name8-runs').val();
    var passValue = 10 - newValue
  }
  $('#name8-run-count').html(newValue);
  $('#name8-pass-count').html(passValue)
  
  $('#name8-runs').on('change', function() {
    if($('#name8-runs').val() == 10){
      var newValue = 11
      var passValue = 0
    } else if($('#name8-runs').val() == 11){
      var newValue = 11
      var passValue = 0
    } else if($('#name8-runs').val() == 0){
      var newValue = 0
      var passValue = 11
    } else {
      var newValue = $('#name8-runs').val();
      var passValue = 10 - newValue
    }
    $('#name8-run-count').html(newValue);
    $('#name8-pass-count').html(passValue)
  });

  //Situation 9
  if($('#name9-runs').val() == 14){
    var newValue = 15
    var passValue = 0
  } else if($('#name9-runs').val() == 15){
    var newValue = 15
    var passValue = 0
  } else if($('#name9-runs').val() == 0){
    var newValue = 0
    var passValue = 15
  } else {
    var newValue = $('#name9-runs').val();
    var passValue = 14 - newValue
  }
  $('#name9-run-count').html(newValue);
  $('#name9-pass-count').html(passValue)
  
  $('#name9-runs').on('change', function() {
    if($('#name9-runs').val() == 14){
      var newValue = 15
      var passValue = 0
    } else if($('#name9-runs').val() == 15){
      var newValue = 15
      var passValue = 0
    } else if($('#name9-runs').val() == 0){
      var newValue = 0
      var passValue = 15
    } else {
      var newValue = $('#name9-runs').val();
      var passValue = 14 - newValue
    }
    $('#name9-run-count').html(newValue);
    $('#name9-pass-count').html(passValue)
  });

  //Situation 10
  if($('#name10-runs').val() == 14){
    var newValue = 15
    var passValue = 0
  } else if($('#name10-runs').val() == 15){
    var newValue = 15
    var passValue = 0
  } else if($('#name10-runs').val() == 0){
    var newValue = 0
    var passValue = 15
  } else {
    var newValue = $('#name10-runs').val();
    var passValue = 14 - newValue
  }
  $('#name10-run-count').html(newValue);
  $('#name10-pass-count').html(passValue)
  
  $('#name10-runs').on('change', function() {
    if($('#name10-runs').val() == 14){
      var newValue = 15
      var passValue = 0
    } else if($('#name10-runs').val() == 15){
      var newValue = 15
      var passValue = 0
    } else if($('#name10-runs').val() == 0){
      var newValue = 0
      var passValue = 15
    } else {
      var newValue = $('#name10-runs').val();
      var passValue = 14 - newValue
    }
    $('#name10-run-count').html(newValue);
    $('#name10-pass-count').html(passValue)
  });

  //Situation 11
  if($('#name11-runs').val() == 14){
    var newValue = 15
    var passValue = 0
  } else if($('#name11-runs').val() == 15){
    var newValue = 15
    var passValue = 0
  } else if($('#name11-runs').val() == 0){
    var newValue = 0
    var passValue = 15
  } else {
    var newValue = $('#name11-runs').val();
    var passValue = 14 - newValue
  }
  $('#name11-run-count').html(newValue);
  $('#name11-pass-count').html(passValue)
  
  $('#name11-runs').on('change', function() {
    if($('#name11-runs').val() == 14){
      var newValue = 15
      var passValue = 0
    } else if($('#name11-runs').val() == 15){
      var newValue = 15
      var passValue = 0
    } else if($('#name11-runs').val() == 0){
      var newValue = 0
      var passValue = 15
    } else {
      var newValue = $('#name11-runs').val();
      var passValue = 14 - newValue
    }
    $('#name11-run-count').html(newValue);
    $('#name11-pass-count').html(passValue)
  });

  //Situation 12
  if($('#name12-runs').val() == 14){
    var newValue = 15
    var passValue = 0
  } else if($('#name12-runs').val() == 15){
    var newValue = 15
    var passValue = 0
  } else if($('#name12-runs').val() == 0){
    var newValue = 0
    var passValue = 15
  } else {
    var newValue = $('#name12-runs').val();
    var passValue = 14 - newValue
  }
  $('#name12-run-count').html(newValue);
  $('#name12-pass-count').html(passValue)
  
  $('#name12-runs').on('change', function() {
    if($('#name12-runs').val() == 14){
      var newValue = 15
      var passValue = 0
    } else if($('#name12-runs').val() == 15){
      var newValue = 15
      var passValue = 0
    } else if($('#name12-runs').val() == 0){
      var newValue = 0
      var passValue = 15
    } else {
      var newValue = $('#name12-runs').val();
      var passValue = 14 - newValue
    }
    $('#name12-run-count').html(newValue);
    $('#name12-pass-count').html(passValue)
  });

  //Situation 13
  if($('#name13-runs').val() == 14){
    var newValue = 15
    var passValue = 0
  } else if($('#name13-runs').val() == 15){
    var newValue = 15
    var passValue = 0
  } else if($('#name13-runs').val() == 0){
    var newValue = 0
    var passValue = 15
  } else {
    var newValue = $('#name13-runs').val();
    var passValue = 14 - newValue
  }
  $('#name13-run-count').html(newValue);
  $('#name13-pass-count').html(passValue)
  
  $('#name13-runs').on('change', function() {
    if($('#name13-runs').val() == 14){
      var newValue = 15
      var passValue = 0
    } else if($('#name13-runs').val() == 15){
      var newValue = 15
      var passValue = 0
    } else if($('#name13-runs').val() == 0){
      var newValue = 0
      var passValue = 15
    } else {
      var newValue = $('#name13-runs').val();
      var passValue = 14 - newValue
    }
    $('#name13-run-count').html(newValue);
    $('#name13-pass-count').html(passValue)
  });

  //Situation 14
  if($('#name14-runs').val() == 14){
    var newValue = 15
    var passValue = 0
  } else if($('#name14-runs').val() == 15){
    var newValue = 15
    var passValue = 0
  } else if($('#name14-runs').val() == 0){
    var newValue = 0
    var passValue = 15
  } else {
    var newValue = $('#name14-runs').val();
    var passValue = 14 - newValue
  }
  $('#name14-run-count').html(newValue);
  $('#name14-pass-count').html(passValue)
  
  $('#name14-runs').on('change', function() {
    if($('#name14-runs').val() == 14){
      var newValue = 15
      var passValue = 0
    } else if($('#name14-runs').val() == 15){
      var newValue = 15
      var passValue = 0
    } else if($('#name14-runs').val() == 0){
      var newValue = 0
      var passValue = 15
    } else {
      var newValue = $('#name14-runs').val();
      var passValue = 14 - newValue
    }
    $('#name14-run-count').html(newValue);
    $('#name14-pass-count').html(passValue)
  });
  
});

function stripeResponseHandler(status, response) {
  // Grab the form:
  var $form = $('#payment-form');

  if (response.error) { // Problem!

    // Show the errors on the form:
    $form.find('.payment-errors').text(response.error.message);
    $form.find('.submit').prop('disabled', false); // Re-enable submission

  } else { // Token was created!

    // Get the token ID:
    var token = response.id;

    // Insert the token ID into the form so it gets submitted to the server:
    $form.append($('<input type="hidden" name="stripeToken">').val(token));

    $form.append($('<input type="hidden" name="card_last4">').val(response.card.last4));
    $form.append($('<input type="hidden" name="card_exp_month">').val(response.card.exp_month));
    $form.append($('<input type="hidden" name="card_exp_year">').val(response.card.exp_year));
    $form.append($('<input type="hidden" name="card_brand">').val(response.card.brand));

    // Submit the form:
    $form.get(0).submit();
  }
};