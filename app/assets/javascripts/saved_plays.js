var set_positions;
set_positions = function(){
  // loop through and give each task a data-pos attribute that holds its position in the DOM
  $('.saved-play-table').each(function(i){
      $(this).attr("data-pos",i+1);
  });
}

$(".saved_plays.index").ready(function() {

	set_positions();

  //Makes the plays table sortable; cancel line disallows sort on the header and footer
	$('.sortable').sortable({
		cancel: "#saved-plays-thead"
	});


	// after the order changes
	$('.sortable').sortable().bind('sortupdate', function(e, ui) {
	  // array to store new order
	  updated_order = []
	  // set the updated positions
	  set_positions();

	  // populate the updated_order array with the new task positions
	  $('.saved-play-table').each(function(i){
	  	updated_order.push({ id: $(this).data("id"), position: i+1 });
	  });

	  // send the updated order via ajax
	  $.ajax({
	    type: "PUT",
	    url: 'saved_plays/sort',
	    data: { order: updated_order }
	  });	   
	});
});