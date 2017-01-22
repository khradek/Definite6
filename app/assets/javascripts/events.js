var ready;
ready = function(){




/*  $('.update-gamecall-button').click(function () {
    var id = $(this).attr("id").slice(16);
    console.log(id);
    // After the click, you force the modal to be shown
    $('#myupdategamecall_' + id).modal('show');
  });
*/


	//Displays/hides time from datetimepicker based on event_type
	var noTime = $(".no-time");
	var timeShowing = $(".time-showing");
	$("#event-select").change(function(){
		var choice = $("#event-select option:selected").text();	
		if (choice == "Script" || choice == "Game Call Sheet") {
				$("#non-script-body").append(noTime);
				(noTime).show();
				(timeShowing).detach();
				$("#select-install-select").show();
				$("#script-footer").show();
				$("#create-lower-body").hide();
		}else if (choice == "Install") {
				$("#non-script-body").append(noTime);
				(noTime).show();
				(timeShowing).detach();
				$("#select-install-select").hide();
				$("#script-footer").hide();
				$("#create-lower-body").show();
		}else {
				$("#non-script-body").append(timeShowing);
				(timeShowing).show();
				(noTime).detach();
				$("#select-install-select").hide();
				$("#script-footer").hide();
				$("#create-lower-body").show();
		};		
	});


	//Makes Fullcalendar refetch events when the script close button is clicked *Using refresh due to turbolinks issue
	$("#script-close").click(function(){
		location.reload();
		//$('#calendar').fullCalendar("refetchEvents");
	})
	
	//Directs user to chosen install page on install dropdown (Create script)
	$("#install-button").click(function(){
		var url = "events/" + $("#install-dropdown").val();
		window.open(url);
	});

	//Opens corresponding install page when script/gamecall button is clicked in script update modal
	$(".script-button").click(function(){
		var url = "events/" + $(this).next().text();
		window.open(url);
	});

	//Makes the create event modal draggable 
  $("#mynewevent").draggable({ handle: ".modal-content" });

  //Opens corresponding install page when game call sheet button is clicked in game call sheet update modal
  $(".gamecall-button").click(function(){
    var url = "events/" + $(this).next().text();
    window.open(url);
  });

 
};

$(document).ready(ready);
$(document).on('page:load', ready);
