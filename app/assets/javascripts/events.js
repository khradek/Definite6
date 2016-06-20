var ready;
ready = function(){

	//Displays/hides time from datetimepicker based on event_type
	var noTime = $(".no-time");
	var timeShowing = $(".time-showing");
	$("#event-select").change(function(){
		var choice = $("#event-select option:selected").text();	
		if (choice == "Script") {
				$("#non-script-body").append(noTime);
				(noTime).show();
				(timeShowing).detach();
				$("#select-install-select").toggle();
				$("#script-footer").toggle();
				$("#create-lower-body").hide();
				console.log("Script");
		}else if (choice == "Install" || choice == "Game Call Sheet") {
				$("#non-script-body").append(noTime);
				(noTime).show();
				(timeShowing).detach();
				$("#select-install-select").hide();
				$("#script-footer").hide();
				$("#create-lower-body").show();
				console.log("Install or GC Sheet");	
		}else {
				$("#non-script-body").append(timeShowing);
				(timeShowing).show();
				(noTime).detach();
				$("#select-install-select").hide();
				$("#script-footer").hide();
				$("#create-lower-body").show();
				console.log("Practice, Game, or Other");
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

	//Opens corresponding install page when script button is clicked in script update modal
	$(".script-button").click(function(){
		var url = "events/" + $(this).next().text();
		window.open(url);
	});

	//Makes the create event modal draggable 
  $("#mynewevent").draggable({ handle: ".modal-content" });

};

$(document).ready(ready);
$(document).on('page:load', ready);
