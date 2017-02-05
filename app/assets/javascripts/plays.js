$(document).on('page:change', function() {


  /////////Add Play Modal/////////
  //Makes the modal draggable 
  $("#mynewplay").draggable({ handle: ".modal-content" });

  //Situation buttons on Add Play modal
  $('#assign-situation-button').off();
	$('#assign-situation-button').click(function() {
	  $('#situations').toggle();
	});

  $('#situation-button1').off();
	$('#situation-button1').click(function() {
	  $('#situation2').toggle();
	  $(this).hide();
	});

  $('#situation-button2').off();
	$('#situation-button2').click(function() {
	  $('#situation3').toggle();
	  $(this).hide();
	});

  $('#situation-button3').off();
	$('#situation-button3').click(function() {
	  $('#situation4').toggle();
	  $(this).hide();
	});

  $('#situation-button4').off();
	$('#situation-button4').click(function() {
	  $('#situation5').toggle();
	  $(this).hide();
	});

  $('#situation-button5').off();
	$('#situation-button5').click(function() {
	  $('#situation6').toggle();
	  $(this).hide();
	});

  $('#situation-button6').off();
	$('#situation-button6').click(function() {
	  $('#situation7').toggle();
	  $(this).hide();
	});

  $('#situation-button7').off();
	$('#situation-button7').click(function() {
	  $('#situation8').toggle();
	  $(this).hide();
	});

  $('#situation-button8').off();
	$('#situation-button8').click(function() {
	  $('#situation9').toggle();
	  $(this).hide();
	});

  $('#situation-button9').off();
	$('#situation-button9').click(function() {
	  $('#situation10').toggle();
	  $(this).hide();
	});

  //Shows/hides the saved formation & play dropdowns in the add play modal 
  $('.show-saved-plays').off();
  $('.show-saved-plays').click(function() {
    $('.saved-formations-and-plays').toggle();
  });

  //Adds the selected formation/play to the text fields in the add play modal
  $("#formation-dropdown").change(function(){
    var choice = $("#formation-dropdown option:selected").text(); 
    if (choice == "Saved formations"){
      $("#formation").val('');
    }else{
      $("#formation").val(choice);
    };
  });

  $("#play-dropdown").change(function(){
    var choice = $("#play-dropdown option:selected").text();
    if (choice == "Saved plays"){
      $("#play-call").val('');
    }else{  
      $("#play-call").val(choice);
    };
  });



  /////////Delete Multiple Modal/////////
  //Makes the modal draggable 
  $("#removePlaysModal").draggable({ handle: ".modal-content" }); 
  //Check all functionality on update multiple modal
  $('#check-all').click(function () { 
    var checkBoxes = $(".play-checkbox");
    checkBoxes.prop("checked", !checkBoxes.prop("checked"));
  })

  //Check all functionality on delete multiple modal
  $('#delete-check-all').click(function () { 
    var checkBoxes = $(".delete-checkbox");
    checkBoxes.prop("checked", !checkBoxes.prop("checked"));
  })



  /////////Update Multiple Modal/////////
  //Makes the modal draggable 
  $("#updatePlaysModal").draggable({ handle: ".modal-content" });
  
  //Shows/hides Practice Period edit section in Update Multiple modal
  $("#periods").change(function(){
    $(".period-select").toggle();
  });

  //Shows/hides Play Type edit section in Update Multiple modal
  $("#types").change(function(){
    $(".multi-type").toggle();
  });

  //Shows/hides Hash Mark edit section in Update Multiple modal
  $("#hashes").change(function(){
    $(".multi-hash").toggle();
  }); 

  //Shows/hides Situation 1-10 edit section in Update Multiple modal
  $("#situation_1").change(function(){
    $(".multi-situation1").toggle();
  }); 

  $("#situation_2").change(function(){
    $(".multi-situation2").toggle();
  });

  $("#situation_3").change(function(){
    $(".multi-situation3").toggle();
  });

  $("#situation_4").change(function(){
    $(".multi-situation4").toggle();
  });

  $("#situation_5").change(function(){
    $(".multi-situation5").toggle();
  });

  $("#situation_6").change(function(){
    $(".multi-situation6").toggle();
  });

  $("#situation_7").change(function(){
    $(".multi-situation7").toggle();
  });

  $("#situation_8").change(function(){
    $(".multi-situation8").toggle();
  });

  $("#situation_9").change(function(){
    $(".multi-situation9").toggle();
  });

  $("#situation_10").change(function(){
    $(".multi-situation10").toggle();
  });



  /////////Edit Play Page/////////
    //Shows/hides the saved formation & play dropdowns on the Edit Play page 
  $('.show-saved-plays-edit').off();
  $('.show-saved-plays-edit').click(function() {
    $('.saved-formations-and-plays').toggle();
  });

  //Practice Info arrow functionality on Edit Play page - .off() needed for browser back button
  $("#edit-practice-link").off();
  $("#edit-practice-link").click(function(){
    $(this).find(".right-arrow, .down-arrow").toggle();
    $("#edit-practice-info").toggle("blind");
  })
  
  //Situational Info arrow functionality on Edit Play page
  $("#edit-situations-link").off();
  $("#edit-situations-link").click(function(){
    $(this).find(".right-arrow, .down-arrow").toggle();
    $("#edit-play-situations").toggle("blind");
  })

  //Adds the selected formation/play to the text fields on the Edit Play page
  $(".formation-drop").change(function(){
    var choice = $(this).find('option:selected').text();
    var id = $(this).attr("id").slice(24);
    if (choice == "Saved formations"){
      $("#formation-text-" + id).val('');
    }else{
      $("#formation-text-" + id).val(choice);
    };
  });

  $(".play-drop").change(function(){
    var choice = $(this).find('option:selected').text();
    var id = $(this).attr("id").slice(19);
    console.log(id);
    if (choice == "Saved plays"){
      $("#play-text-" + id).val('');
    }else{
      $("#play-text-" + id).val(choice);
    };
  });


});



