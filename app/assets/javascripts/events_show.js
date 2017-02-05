
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
	
}); 