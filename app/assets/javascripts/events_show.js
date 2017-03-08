
//Function for sort functionality of install table
var set_positions;
set_positions = function(){
  // loop through and give each task a data-pos attribute that holds its position in the DOM
  $('.play-table').each(function(i){
      $(this).attr("data-pos",i+1);
  });
}

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

	//Hides blank play table row on show page  
	$("#play_").hide();

	//Hides blank script table row on show page  
	$("#script_").hide();	

  //Makes the create script modal draggable 
  $("#mynewscript").draggable({ handle: ".modal-content" });

  //Makes the create game call modal draggable 
  $("#mynewgamecall").draggable({ handle: ".modal-content" });

  //Makes the import plays modal draggable 
  $("#importPlaysModal").draggable({ handle: ".modal-content" });

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

  //Segments checkbox AJAX functionality
  $("body").on("change", ".period1-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "POST",
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
      type: "POST",
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
      type: "POST",
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
      type: "POST",
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