
//Function for sort functionality of install table
var set_positions;
set_positions = function(){
  // loop through and give each task a data-pos attribute that holds its position in the DOM
  $('.play-table').each(function(i){
      $(this).attr("data-pos",i+1);
  });
}

//Function to mark duplicate plays in install table red
function highlightDuplicateRows(selector) {
  var index = {},
  getText = function () {
    return $.trim( $(this).text() );
  };
  $(selector).find("tr").each(function (tr) {
    var rowKey = $(this).find(".play-box").map(getText).toArray().join("|");
    if (index.hasOwnProperty(rowKey)) {
       index[rowKey].push(this);
    } else {
      index[rowKey] = [this];
    }
  });
  $.each(index, function (rowKey, rows) {
    $(rows).toggleClass("tablered", rows.length > 1);
  });
}

$(".events.show").ready(function() {

	set_positions();

  //Makes the plays table sortable; cancel line disallows sort on the header and footer
	$('.sortable').sortable({
    cancel: ".no-sort"
  })

	// after the order changes
	$('.sortable').sortable().bind('sortupdate', function(e, ui) {
	    // array to store new order
	    updated_order = []
	    // set the updated positions
	    set_positions();

	    // populate the updated_order array with the new task positions
	    $('.play-table').each(function(i){
	        updated_order.push({ id: $(this).data("id"), position: i+1 });
	    });

      // send the updated order via ajax
      $.ajax({
          type: "PUT",
          url: 'events/plays/sort',
          data: { order: updated_order }
      });	    
	 });


  //////////Date format for scripts//////////
  //Changes date format before save on new script modal
  $("body").on("click", "#create-script-button", function(){
    var form = $('#new_script');
    var dateText = form.find($(".install-picker1")).val();
    var date = new Date(dateText);
    var d = date.getDate();
    var m =  date.getMonth();
    m += 1;  // JavaScript months are 0-11
    var y = date.getFullYear();
    var newDate = y + "-" + m + "-" + d
    form.find($(".install-picker1")).val(newDate);
    form.trigger('submit.rails');
  });

  //Shows the change date section on the update Script modals and clears the date when the section is hidden
  $("body").on("click", ".change-date-check", function(){
    var id = $(this).attr('id');
    var section = "script-" + id;
    var form = $("#edit_script_" + id);
    form.find($(".datetimepicker")).val('');
    $("#" + section).toggle(); 
  });

  //Changes date format before save on update script modal
  $("body").on("click", ".update-script-button", function(){
    var i = $(this).attr('id');
    var script = i.substr(3);
    var formID = "edit_script_" + script;
    var form = $("#" + formID);
    var dateText = form.find($(".datetimepicker")).val();
    if (dateText.length > 0) {
      var date = new Date(dateText);
      var d = date.getDate();
      var m =  date.getMonth();
      m += 1;  // JavaScript months are 0-11
      var y = date.getFullYear();
      var newDate = y + "-" + m + "-" + d
      form.find($(".datetimepicker")).val(newDate);
      form.trigger('submit.rails');
    } else {
      var oldDate = $("#date-" + script).text();
      var date = new Date(oldDate);
      var d = date.getDate();
      var m =  date.getMonth();
      m += 1;  // JavaScript months are 0-11
      var y = date.getFullYear();
      var newDate = y + "-" + m + "-" + d
      form.find($(".datetimepicker")).val(newDate);
      form.trigger('submit.rails');
    }
  }); 

  
  //////////Date format for call sheets//////////
  //Changes date format before save on new gamecall sheet modal
  $("body").on("click", "#create-gamecall-button", function(){
    var form = $('#new_gamecall');
    var dateText = form.find($(".install-picker2")).val();
    var date = new Date(dateText);
    var d = date.getDate();
    var m =  date.getMonth();
    m += 1;  // JavaScript months are 0-11
    var y = date.getFullYear();
    var newDate = y + "-" + m + "-" + d
    form.find($(".install-picker2")).val(newDate);
    form.trigger('submit.rails');
  });

  //Shows the change date section on the update Gamecall modals and clears the date when the section is hidden
  $("body").on("click", ".change-date-check", function(){
    var id = $(this).attr('id');
    var section = "gamecall-" + id;
    var form = $("#edit_gamecall_" + id);
    form.find($(".datetimepicker")).val('');
    $("#" + section).toggle(); 
  });

  //Changes date format before save on update gamecall modal
  $("body").on("click", ".update-call-button", function(){
    var i = $(this).attr('id');
    var gamecall = i.substr(8);
    var formID = "edit_gamecall_" + gamecall;
    var form = $("#" + formID);
    var dateText = form.find($(".datetimepicker")).val();
    if (dateText.length > 0) {
      var date = new Date(dateText);
      var d = date.getDate();
      var m =  date.getMonth();
      m += 1;  // Javascript months are 0-11
      var y = date.getFullYear();
      var newDate = y + "-" + m + "-" + d
      form.find($(".datetimepicker")).val(newDate);
      form.trigger('submit.rails');
    } else {
      var oldDate = $("#date-" + gamecall).text();
      var date = new Date(oldDate);
      var d = date.getDate();
      var m =  date.getMonth();
      m += 1;  // JavaScript months are 0-11
      var y = date.getFullYear();
      var newDate = y + "-" + m + "-" + d
      form.find($(".datetimepicker")).val(newDate);
      form.trigger('submit.rails');
    }
  });

	//Hides blank play table row on show page  
	$("#play_").hide();

	//Hides blank script table row on show page  
	$("#script_").hide();	

  //Makes the create script modal draggable 
  $("#mynewscript").draggable({ handle: ".modal-content" });

  //Makes the create game call modal draggable 
  $("#mynewgamecall").draggable({ handle: ".modal-content" });

  //Marks duplicate plays in red
  highlightDuplicateRows("#plays-body");

  //Disables the create button until the title and date fields are completed on the create script modal
  if($(".script-title").val().length == 0 || $(".install-picker1").val().length == 0){
    $('#create-script-button').prop('disabled', true);      
  }else{ 
    $('#create-script-button').prop('disabled', false);
  };

  $("body").on("change dp.change keyup", ".script-title, .install-picker1", function(){
    if($(".script-title").val().length == 0 || $(".install-picker1").val().length == 0){
      $('#create-script-button').prop('disabled', true);      
    }else{ 
      $('#create-script-button').prop('disabled', false);
    };
  });

  //Disables the create button until the title and date fields are completed on the create gamecall modal
  if($(".gamecall-title").val().length == 0 || $(".install-picker2").val().length == 0){
    $('#create-gamecall-button').prop('disabled', true);      
  }else{ 
    $('#create-gamecall-button').prop('disabled', false);
  };

  $("body").on("change dp.change keyup", ".gamecall-title, .install-picker2", function(){
    if($(".gamecall-title").val().length == 0 || $(".install-picker2").val().length == 0){
      $('#create-gamecall-button').prop('disabled', true);      
    }else{ 
      $('#create-gamecall-button').prop('disabled', false);
    };
  });

  //Run/Pass dropdown AJAX functionality
  $("body").on("change", ".styled-select", function(){
    var choice = $(this).val();
    var playID = $(this).attr('id');
    var numID = playID.substr(9);
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + numID + "/type_update",
      data: { 
        play: { play_type: choice }
      }        
    });
  });

  //Hash dropdown AJAX functionality
  $("body").on("change", ".styled-select2", function(){
    var choice = $(this).val();
    var playID = $(this).attr('id');
    var numID = playID.substr(14);
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + numID + "/hash_update",
      data: { 
        play: { hash_mark: choice }
      }        
    });
  });

  //Segments checkbox AJAX functionality
  $("body").on("change", ".period1-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/toggle1",
      data: { 
        play: { period1: checked }
      }        
    });
  });

  $("body").on("change", ".period2-check", function(){
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/toggle2",
      data: { 
        play: { period2: checked }
      }        
    });
  });

  $("body").on("change", ".period3-check", function(){
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/toggle3",
      data: { 
        play: { period3: checked }
      }        
    });
  });  

  $("body").on("change", ".period4-check", function(){
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/toggle4",
      data: { 
        play: { period4: checked }
      }        
    });
  });


  //Alert for over 25 plays for a period
  $("body").on("change", ".period1-check, .period2-check, .period3-check, .period4-check", function(){
    setTimeout( function(){
      var period1Count = $("#period1-count").text();
      var period2Count = $("#period2-count").text();
      var period3Count = $("#period3-count").text();
      var period4Count = $("#period4-count").text();
      if(period1Count > 25 || period2Count > 25 || period3Count > 25 || period4Count > 25) {
        $("#count-alert").addClass("hidden")
        $("#ph-count-alert").removeClass("hidden");
      }else {
        $("#count-alert").addClass("hidden")
        $("#ph-count-alert").addClass("hidden");
      } 
    }, 100);
  })  

	
}); 