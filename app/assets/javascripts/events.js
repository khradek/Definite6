
$(".events.index").ready(function() {

	//Displays/hides time from datetimepicker based on event_type - ability to add "Practice", "Other", etc (events that need to show the time) as dropdown choices
	var noTime = $(".no-time");
	var timeShowing = $(".time-showing");
	$("#event-select").change(function(){
		var choice = $("#event-select option:selected").text();	
		if (choice == "Script" || choice == "Game Call Sheet") {
  		$("#non-script-body").append(noTime);
  		(noTime).show();
  		(timeShowing).detach();
  		$("#select-install-select").show();
  		$("#create-lower-body").hide();
		}else if (choice == "Install") {
  		$("#non-script-body").append(noTime);
  		(noTime).show();
  		(timeShowing).detach();
  		$("#select-install-select").hide();
  		$("#create-lower-body").show();
		}else {
  		$("#non-script-body").append(timeShowing);
  		(timeShowing).show();
  		(noTime).detach();
  		$("#select-install-select").hide();
  		$("#create-lower-body").show();
		};		
	});

  //Changes date format before save on new event modal
  $("body").on("click", "#create-event-button", function(){
    var form = $('#new_event');
    var dateText = form.find($(".install-picker1")).val();
    var date = new Date(dateText);
    var d = date.getDate();
    var m =  date.getMonth();
    m += 1;  // JavaScript months are 0-11
    var y = date.getFullYear();
    var newDate = y + "-" + m + "-" + d
    form.find($(".install-picker1")).val(newDate);    
    var dateText2 = form.find($(".install-picker2")).val();
    var date2 = new Date(dateText2);
    var d2 = date2.getDate();
    var m2 =  date2.getMonth();
    m2 += 1;  // JavaScript months are 0-11
    var y2 = date2.getFullYear();
    var newDate2 = y2 + "-" + m2 + "-" + d2
    form.find($(".install-picker2")).val(newDate2);
    form.trigger('submit.rails');
  });

  //Shows the change start date section on the update Install modals and clears the date when the section is hidden
  $("body").on("click", ".change-date-check", function(){
    var id = $(this).attr('id');
    var section = id.substr(6);
    var form = $("#edit_event_" + section);
    form.find($(".install-picker1")).val('');
    $("#" + 'event-start-' + section).toggle(); 
  });

  //Changes start date format before save on update event modal
  $("body").on("click", ".update-event-button", function(){
    var i = $(this).attr('id');
    var event = i.substr(3);
    var formID = "edit_event_" + event;
    var form = $("#" + formID);
    var dateText = form.find($(".install-picker1")).val();
    var dateText2 = form.find($(".install-picker2")).val();
    if (dateText.length > 0) {
      var date = new Date(dateText);
      var d = date.getDate();
      var m =  date.getMonth();
      m += 1;  // Javascript months are 0-11
      var y = date.getFullYear();
      var newDate = y + "-" + m + "-" + d
      form.find($(".install-picker1")).val(newDate);
    } else {
      var oldDate = $("#start-date-" + event).text();
      var date = new Date(oldDate);
      var d = date.getDate();
      var m =  date.getMonth();
      m += 1;  // JavaScript months are 0-11
      var y = date.getFullYear();
      var newDate = y + "-" + m + "-" + d
      form.find($(".install-picker1")).val(newDate);
    }
    if (dateText2.length > 0) {
      var date2 = new Date(dateText2);
      var d2 = date2.getDate();
      var m2 =  date2.getMonth();
      m2 += 1;  // Javascript months are 0-11
      var y2 = date2.getFullYear();
      var newDate2 = y2 + "-" + m2 + "-" + d2
      form.find($(".install-picker2")).val(newDate2);
      form.trigger('submit.rails');
    } else {
      var oldDate2 = $("#end-date-" + event).text();
      var date2 = new Date(oldDate2);
      var d2 = date2.getDate();
      var m2 =  date2.getMonth();
      m2 += 1;  // JavaScript months are 0-11
      var y2 = date2.getFullYear();
      var newDate2 = y2 + "-" + m2 + "-" + d2
      form.find($(".install-picker2")).val(newDate2);
      form.trigger('submit.rails');
    }    
  });

  //Shows the change end date section on the update Install modals and clears the date when the section is hidden
  $("body").on("click", ".change-date-check2", function(){
    var id = $(this).attr('id');
    var section = id.substr(4);
    var form = $("#edit_event_" + section);
    form.find($(".install-picker2")).val('');
    $("#" + 'event-end-' + section).toggle(); 
  });



  //Disables the create button until the title and start/end date fields are completed on the create install modal
  if($("#title-id").val().length == 0 || $(".install-picker1").val().length == 0 || $(".install-picker2").val().length == 0){
    $('#create-event-button').prop('disabled', true);      
  }else{ 
    $('#create-event-button').prop('disabled', false);
  };

  $("body").on("change dp.change keyup", "#title-id, .install-picker1, .install-picker2", function(){
    if($("#title-id").val().length == 0 || $(".install-picker1").val().length == 0 || $(".install-picker2").val().length == 0){
      $('#create-event-button').prop('disabled', true);      
    }else{ 
      $('#create-event-button').prop('disabled', false);
    };
  });

  //Disables the go to install button unless an install is chosen
  if($("#event-install-dropdown").val() == null){
    $('#install-button').prop('disabled', true);      
  }else{ 
    $('#install-button').prop('disabled', false);
  };

  $("body").on("change", "#event-install-dropdown", function(){
    console.log("change")
    if($("#event-install-dropdown").val() == null){
      $('#install-button').prop('disabled', true);      
    }else{ 
      $('#install-button').prop('disabled', false);
    };
  });




  //Directs user to chosen install page on install dropdown (Create script or create game call sheet)
	$("#install-button").click(function(){
		var url = "events/" + $("#event-install-dropdown").val();
		window.location.href = url;
	});

	//Opens corresponding install page when script button is clicked in script update modal
  $(document).on("click", ".script-button", function(){
		var url = "events/" + $(this).next().text();
		window.location.href = url;
	});

  //Opens corresponding install page when game call sheet button is clicked in game call sheet update modal
  $(document).on("click", ".gamecall-button", function(){
    var url = "events/" + $(this).next().text();
    window.location.href= url;
  });

	//Makes the create event modal draggable 
  $("#mynewevent").draggable({ handle: ".modal-content" });
 
});


