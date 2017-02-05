var ready;
ready = function(){

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

  //Directs user to chosen install page on install dropdown (Create script or create game call sheet)
	$("#install-button").click(function(){
		var url = "events/" + $("#install-dropdown").val();
		window.location.href = url;
	});

	//Opens corresponding install page when script button is clicked in script update modal
	$(".script-button").click(function(){
		var url = "events/" + $(this).next().text();
    console.log(url);
		window.location.href = url;
	});

  //Opens corresponding install page when game call sheet button is clicked in game call sheet update modal
  $(".gamecall-button").click(function(){
    var url = "events/" + $(this).next().text();
    window.location.href= url;
  });

	//Makes the create event modal draggable 
  $("#mynewevent").draggable({ handle: ".modal-content" });
 
};

$(document).ready(ready);
$(document).on('page:load', ready);
