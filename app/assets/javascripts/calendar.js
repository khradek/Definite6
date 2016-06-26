var ready;
ready = function(){

  $('.datetimepicker').datetimepicker({
    useCurrent: false,
    format: "DD/MM/YYYY"
  });
 
  $('#calendar').fullCalendar({
    events: '/events.json',
    eventTextColor: 'white',
    editable: false,
    selectable: true,
    nextDayThreshold: '00:00:00',
    header: {
      left: 'prev,next today', 
      center: 'title', 
      right: 'month basicWeek'
    },

    //Creates update modal when event is clicked; also makes update modal draggable
    eventClick: function(event) {
      var id = "#myupdateevent_" + event.id;
      $(id).modal();
      $(id).draggable({ handle: ".modal-content" });
      return false;
    },

    //Creates create modal when day in the calendar is clicked
    dayClick: function(date) {  
      $("#mynewevent").modal();
    }, 

    eventRender: function(event, element, view) { 
      if (event.event_type == "Install") {
        $(element).css("backgroundColor", "#363D45");
        $(element).css("borderColor", "#363D45");
        element.find('.fc-time').hide();
        $(element).css('height', 25);
        if(view.name === 'basicWeek') {
          $(element).height(200);
        };
      };
      if (event.event_type == "Script") {
        $(element).css("backgroundColor", "#8B9FCE");
        $(element).css("borderColor", "#8B9FCE");
        element.find('.fc-time').hide();
        $(element).css('height', 25);
        if(view.name === 'basicWeek') {
          $(element).height(200);
        };
      };
      if (event.event_type == "Gamecall") {
        $(element).css("backgroundColor", "#4C96E8");
        $(element).css("borderColor", "#4C96E8");
        element.find('.fc-time').hide();
        $(element).css('height', 25);
        if(view.name === 'basicWeek') {
          $(element).height(200);
        };
      };   
      if (event.event_type == "Practice") {
        $(element).css("backgroundColor", "#b5b5b7");
        $(element).css("borderColor", "#b5b5b7");
        $(element).css('height', 25);
        if(view.name === 'basicWeek') {
          $(element).height(200);
        };
      };    
      if (event.event_type == "Game") {
        $(element).css("backgroundColor", "#808080");
        $(element).css("borderColor", "#808080");
        $(element).css('height', 25);
        if(view.name === 'basicWeek') {
          $(element).height(200);
        };
      };  
      if (event.event_type == "Other") {
        $(element).css("backgroundColor", "#C8CDD2");
        $(element).css("borderColor", "#C8CDD2");
        $(element).css('height', 25);
        if(view.name === 'basicWeek') {
          $(element).height(200);
        };
      };            
    }

  });
};  

$(document).ready(ready);
$(document).on('page:load', ready);