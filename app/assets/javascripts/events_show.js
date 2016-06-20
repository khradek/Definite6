var set_positions;
set_positions = function(){
  // loop through and give each task a data-pos attribute that holds its position in the DOM
  $('.play-table').each(function(i){
      $(this).attr("data-pos",i+1);
  });
}

$(".events.show").ready(function() {

	set_positions();

  //Makes the plays table sortable; cancel line disallows sort on the header and footer
	$('.sortable').sortable({
		cancel: "#plays-thead, #plays-tfoot"
	});


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

  //Makes the create play modal draggable 
  $("#mynewplay").draggable({ handle: ".modal-content" });

  //Makes the create script modal draggable 
  $("#mynewscript").draggable({ handle: ".modal-content" });


	//Updates the Period Play Count divs asynchronously (every second)
	var renewPeriod1Count;
	renewPeriod1Count = function(count) {
	  return $('#period1-count').text(count);
	};
	gon.watch('period1_count', {
	  interval: 1000
	}, renewPeriod1Count);

	var renewPeriod2Count;
	renewPeriod2Count = function(count) {
	  return $('#period2-count').text(count);
	};
	gon.watch('period2_count', {
	  interval: 1000
	}, renewPeriod2Count);

	var renewPeriod3Count;
	renewPeriod3Count = function(count) {
	  return $('#period3-count').text(count);
	};
	gon.watch('period3_count', {
	  interval: 1000
	}, renewPeriod3Count);

	var renewPeriod4Count;
	renewPeriod4Count = function(count) {
	  return $('#period4-count').text(count);
	};
	gon.watch('period4_count', {
	  interval: 1000
	}, renewPeriod4Count);	
	
});