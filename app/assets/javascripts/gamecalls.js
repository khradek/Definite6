$(".gamecalls.show").ready(function() {

  //Grabs game call sheet data (gdata) from hidden div and turns into JS array of arrays
  var setData = $("#gdata").text();
  var replaceData = setData.replace(/'/g, '"');
  var gdata = JSON.parse(replaceData);

  //Grabs game call sheet data for page two (gdata2) from hidden div and turns into JS array of arrays
  var setData2 = $("#gdata2").text();
  var replaceData2 = setData2.replace(/'/g, '"');
  var gdata2 = JSON.parse(replaceData2);

  //Grabs plays from hidden div and turns into JS array - used for play dropdown in script
  var splays = $("#gamecall-plays").text();
  var collection = splays.substring(0, splays.length-1);
  var jCollection = JSON.parse(collection);

  //Save button functionality
  $(".save-button").click(function() {
    var aposCheck = JSON.stringify(gdata);
    var JSONData = aposCheck.replace(/'/g, ' ');
    var aposCheck2 = JSON.stringify(gdata2);
    var JSONData2 = aposCheck2.replace(/'/g, ' ');
    $.ajax({
      type: "PATCH",
      url: "/events/" + $("#event-id").text() + "/gamecalls/" + $("#gamecall-id").text(),
      data: {
        gamecall: {
          gdata: JSONData,
          gdata2: JSONData2
        }
      },
      dataType: "json",
      success: function() {
        alert("Your updates have been saved");
      }
    });
    $("#gdata").text(JSONData); 
    $("#gdata2").text(JSONData2);   
  });

  //Grabs titles and title colors
  var sitTitle1 = $('#gamecall-title1').text();
  var sitTitle2 = $('#gamecall-title2').text();
  var sitTitle3 = $('#gamecall-title3').text();
  var sitTitle4 = $('#gamecall-title4').text();
  var sitTitle5 = $('#gamecall-title5').text();
  var sitTitle6 = $('#gamecall-title6').text();
  var sitTitle7 = $('#gamecall-title7').text();
  var sitTitle8 = $('#gamecall-title8').text();
  var sitTitle9 = $('#gamecall-title9').text();
  var sitTitle10 = $('#gamecall-title10').text();
  var sitTitle11 = $('#gamecall-title11').text();
  var sitTitle12 = $('#gamecall-title12').text();
  var sitTitle13 = $('#gamecall-title13').text();
  var sitTitle14 = $('#gamecall-title14').text();

  var sitColor1 = $('#gamecall-color1').text();
  var sitColor2 = $('#gamecall-color2').text();
  var sitColor3 = $('#gamecall-color3').text();
  var sitColor4 = $('#gamecall-color4').text();
  var sitColor5 = $('#gamecall-color5').text();
  var sitColor6 = $('#gamecall-color6').text();
  var sitColor7 = $('#gamecall-color7').text();
  var sitColor8 = $('#gamecall-color8').text();
  var sitColor9 = $('#gamecall-color9').text();
  var sitColor10 = $('#gamecall-color10').text();
  var sitColor11 = $('#gamecall-color11').text();
  var sitColor12 = $('#gamecall-color12').text();
  var sitColor13 = $('#gamecall-color13').text();
  var sitColor14 = $('#gamecall-color14').text();

  gcCellRenderer = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.renderers.TextRenderer.apply(this, arguments);
    if (row === 0 && col === 0){
      td.className = 'ulshade bold fontlarge htMiddle htCenter tallrow';
      td.setAttribute("colspan", 4);
    } else if (value === sitTitle1){
      td.className = sitColor1 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true;
    } else if (value ===  sitTitle2 + " - Run" || value === sitTitle2 + " - Pass"){
      td.className = sitColor2 + ' underline bold htCenter';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true;
    } else if (value ===  sitTitle3 + " - Run" || value === sitTitle3 + " - Pass"){
      td.className = sitColor3 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true; 
    } else if (value ===  sitTitle4 + " - Run" || value === sitTitle4 + " - Pass"){
      td.className = sitColor4 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true; 
    } else if (value ===  sitTitle5 + " - Run" || value === sitTitle5 + " - Pass"){
      td.className = sitColor5 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true;                 
    } else if (value ===  sitTitle6 + " - Run" || value === sitTitle6 + " - Pass"){
      td.className = sitColor6 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true;   
    } else if (value ===  sitTitle7 + " - Run" || value === sitTitle7 + " - Pass"){
      td.className = sitColor7 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true;    
    } else if (value ===  sitTitle8 + " - Run" || value === sitTitle8 + " - Pass"){
      td.className = sitColor8 + ' underline bold htCenter';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true;  
    } else if (value ===  sitTitle9 + " - Run" || value === sitTitle9 + " - Pass"){
      td.className = sitColor9 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true;  
    } else if (value ===  sitTitle10 + " - Run" || value === sitTitle10 + " - Pass"){
      td.className = sitColor10 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true; 
    } else if (value ===  sitTitle11 + " - Run" || value === sitTitle11 + " - Pass"){
      td.className = sitColor11 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true; 
    } else if (value ===  sitTitle12 + " - Run" || value === sitTitle12 + " - Pass"){
      td.className = sitColor12 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true; 
    } else if (value ===  sitTitle13 + " - Run" || value === sitTitle13 + " - Pass"){
      td.className = sitColor13 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true; 
    } else if (value ===  sitTitle14){
      td.className = sitColor14 + ' underline bold htCenter hide-next';
      td.setAttribute("colspan", 2);
      cellProperties.readOnly = true;                                           
    } else {
      Handsontable.AutocompleteCell.renderer.apply(this, arguments);
      cellProperties.type = 'dropdown';
      cellProperties.source = jCollection;
    }
    $(".hide-next").closest('td').next().addClass('hidden');
    return td;
  };

  Handsontable.renderers.registerRenderer('gcCellRenderer', gcCellRenderer);

  $("#gamecallGrid1").handsontable({
    data: gdata,
    minSpareCols: 0,
    minSpareRows: 0,
    maxRows: 54,
    renderAllRows: true,
    rowHeaders: false,
    colHeaders: false,
    contextMenu: ['undo', 'redo'],
    colWidths: [274, 274, 274, 274],   
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: false,
    className: "htCenter",
    allowEmpty: true,
    cells: function (row, col, prop) {
      var cellProperties = {};
      cellProperties.renderer = "gcCellRenderer";
      return cellProperties;
    }
  });

  $("#gamecallGrid2").handsontable({
    data: gdata2,
    minSpareCols: 0,
    minSpareRows: 0,
    maxRows: 49,    
    renderAllRows: true,
    rowHeaders: false,
    colHeaders: false,
    contextMenu: ['undo', 'redo'],
    colWidths: [274, 274, 274, 274],
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: false,
    allowEmpty: true,
    className: "htCenter",
    cells: function (row, col, prop) {
      var cellProperties = {};
      cellProperties.renderer = "gcCellRenderer";
      return cellProperties;
    }
  });

});


