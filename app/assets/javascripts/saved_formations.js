var set_positions;
set_positions = function(){
  // loop through and give each task a data-pos attribute that holds its position in the DOM
  $('.formation-table').each(function(i){
      $(this).attr("data-pos",i+1);
  });
}

$(".saved_formations.index").ready(function() {

	set_positions();

  //Makes the plays table sortable; cancel line disallows sort on the header and footer
	$('.sortable').sortable({
		cancel: "#formations-thead"
	});


	// after the order changes
	$('.sortable').sortable().bind('sortupdate', function(e, ui) {
	  // array to store new order
	  updated_order = []
	  // set the updated positions
	  set_positions();

	  // populate the updated_order array with the new task positions
	  $('.formation-table').each(function(i){
	  	updated_order.push({ id: $(this).data("id"), position: i+1 });
	  });

	  // send the updated order via ajax
	  $.ajax({
	    type: "PUT",
	    url: 'saved_formations/sort',
	    data: { order: updated_order }
	  });	 
	  console.log("what up")   
	});


});