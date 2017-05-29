$(".events.quick_assign").ready(function() {

  //Shows/hides pseudo header when user scrolls down quick-assign-box
  $('.quick-assign-box').scroll(function() {
    if ($('.quick-assign-box').scrollTop() > 15) {
      // > 15px from top - show div
      $('.quick-assign-pseudo').show();
      $('.quick-assign-header').children().addClass("invisible-text");
    }
    else {
      // <= 15px from top - hide div
      $('.quick-assign-pseudo').hide();
      $('.quick-assign-header').children().removeClass("invisible-text")
    }
  });


  //Checkbox functionality
  $("body").on("change", ".situation1-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation1_toggle",
      data: { 
        play: { situation1: checked }
      }        
    });
  });

  $("body").on("change", ".situation2-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation2_toggle",
      data: { 
        play: { situation2: checked }
      }        
    });
  });

  $("body").on("change", ".situation3-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation3_toggle",
      data: { 
        play: { situation3: checked }
      }        
    });
  });

  $("body").on("change", ".situation4-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation4_toggle",
      data: { 
        play: { situation4: checked }
      }        
    });
  });

  $("body").on("change", ".situation5-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation5_toggle",
      data: { 
        play: { situation5: checked }
      }        
    });
  });

  $("body").on("change", ".situation6-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation6_toggle",
      data: { 
        play: { situation6: checked }
      }        
    });
  });

  $("body").on("change", ".situation7-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation7_toggle",
      data: { 
        play: { situation7: checked }
      }        
    });
  });

  $("body").on("change", ".situation8-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation8_toggle",
      data: { 
        play: { situation8: checked }
      }        
    });
  });

  $("body").on("change", ".situation9-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation9_toggle",
      data: { 
        play: { situation9: checked }
      }        
    });
  });

  $("body").on("change", ".situation10-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation10_toggle",
      data: { 
        play: { situation10: checked }
      }        
    });
  });

  $("body").on("change", ".situation11-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation11_toggle",
      data: { 
        play: { situation11: checked }
      }        
    });
  });

  $("body").on("change", ".situation12-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation12_toggle",
      data: { 
        play: { situation12: checked }
      }        
    });
  });

  $("body").on("change", ".situation13-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation13_toggle",
      data: { 
        play: { situation13: checked }
      }        
    });
  });

  $("body").on("change", ".situation14-check", function(){  
    var checked; 
    if ($(this).is(':checked')) {
      checked = true;
    } else {
      checked = false;
    }
    $.ajax({
      type: "PUT",
      url: "/events/" + $(".event-id").text() + "/plays/" + $(this).val() + "/situation14_toggle",
      data: { 
        play: { situation14: checked }
      }        
    });
  });                        


});