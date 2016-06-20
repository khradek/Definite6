$(".events.show").ready(function() {

	//"Assign or Update Situation Info" button functionality on update play modal
	$('.update-situation-button').click(function() {
	  var id = $(this).attr("id")
	  $('#update-situations-' + id).toggle();
	});

	//"Add Another Situation" button functionality on update play modal
	$('.update-play-sit-button').click(function() {
	  var id = $(this).attr("id").slice(26);
	  var situation = $(this).attr("id").slice(23, 25);
	  var number = parseInt(situation) + 1;
	  var snumber = "";
	  if (number < 10){
	  	snumber = "0" + number.toString();
	  }else {
	  	snumber = number.toString();
	  }
	  $('#update-situation' + snumber + '-' + id).removeClass("hidden");
	  $('#update-situation' + snumber + '-' + id).toggle();
	  $(this).hide();
	});


	$('#assign-situation-button').click(function() {
	  $('#situations').toggle();
	});

	$('#situation-button1').click(function() {
	  $('#situation2').toggle();
	  $(this).hide();
	});

	$('#situation-button2').click(function() {
	  $('#situation3').toggle();
	  $(this).hide();
	});

	$('#situation-button3').click(function() {
	  $('#situation4').toggle();
	  $(this).hide();
	});

	$('#situation-button4').click(function() {
	  $('#situation5').toggle();
	  $(this).hide();
	});

	$('#situation-button5').click(function() {
	  $('#situation6').toggle();
	  $(this).hide();
	});

	$('#situation-button6').click(function() {
	  $('#situation7').toggle();
	  $(this).hide();
	});

	$('#situation-button7').click(function() {
	  $('#situation8').toggle();
	  $(this).hide();
	});

	$('#situation-button8').click(function() {
	  $('#situation9').toggle();
	  $(this).hide();
	});

	$('#situation-button9').click(function() {
	  $('#situation10').toggle();
	  $(this).hide();
	});
		
	//Shows/hides the saved formation & play dropdowns in the create play modal	
	$('.show-saved-plays').click(function() {
	  $('.saved-formations-and-plays').toggle();
	});

	//Adds the selected formation/play to the text fields in the create play modal
	$("#formation-dropdown").change(function(){
		var choice = $("#formation-dropdown option:selected").text();	
		if (choice == "Saved formations"){
			$("#formation").val('');
		}else{
			$("#formation").val(choice);
		};
	});

	$("#play-dropdown").change(function(){
		var choice = $("#play-dropdown option:selected").text();
		if (choice == "Saved plays"){
			$("#play-call").val('');
		}else{	
			$("#play-call").val(choice);
		};
	});

	//Shows/hides the saved formation & play dropdowns in the update play modal
	$('.show-saved-plays-update').click(function() {
		var id = $(this).attr("id").slice(18);
	  $('#formations-and-plays-' + id).toggle();
	});

	//Adds the selected formation/play to the text fields in the update play modal
	$(".formation-drop").change(function(){
		var choice = $(this).find('option:selected').text();
		var id = $(this).attr("id").slice(24);
		if (choice == "Saved formations"){
			$("#formation-text-" + id).val('');
		}else{
			$("#formation-text-" + id).val(choice);
		};
	});

	$(".play-drop").change(function(){
		var choice = $(this).find('option:selected').text();
		var id = $(this).attr("id").slice(19);
		console.log(id);
		if (choice == "Saved plays"){
			$("#play-text-" + id).val('');
		}else{
			$("#play-text-" + id).val(choice);
		};
	});	

});

