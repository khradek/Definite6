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

  //Validates no special characters
  var char_validator = /^[a-zA-Z\d\s-_@&#$/]*$/;

  //Save button functionality
  $("#save-button").click(function() {
    var JSONData = JSON.stringify(gdata);
    var JSONData2 = JSON.stringify(gdata2);
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
      cellProperties.readOnly = true;
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
    } else if (value ===  sitTitle14 + " - Run" || value === sitTitle14 + " - Pass"){
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
    contextMenu: ['undo', 'redo', 'alignment'],
    colWidths: [274, 274, 274, 274],   
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: true,
    className: "htCenter",
    allowInvalid: false,
    allowEmpty: true,
    validator: char_validator,
    cells: function (row, col, prop) {
      var cellProperties = {};
      
      cellProperties.renderer = "gcCellRenderer";

      return cellProperties;
    }

   /* mergeCells: [
      {row: 0, col: 0, rowspan: 1, colspan: 4},
      {row: 1, col: 0, rowspan: 1, colspan: 2},
      {row: 1, col: 2, rowspan: 1, colspan: 2},    
      {row: 9, col: 2, rowspan: 1, colspan: 2},
      {row: 17, col: 0, rowspan: 1, colspan: 2},    
      {row: 17, col: 2, rowspan: 1, colspan: 2},
      {row: 21, col: 2, rowspan: 1, colspan: 2},
      {row: 23, col: 0, rowspan: 1, colspan: 2},    
      {row: 30, col: 0, rowspan: 1, colspan: 2},    
      {row: 30, col: 2, rowspan: 1, colspan: 2},
      {row: 36, col: 0, rowspan: 1, colspan: 2},    
      {row: 36, col: 2, rowspan: 1, colspan: 2},
      {row: 42, col: 0, rowspan: 1, colspan: 2},    
      {row: 42, col: 2, rowspan: 1, colspan: 2},
      {row: 48, col: 0, rowspan: 1, colspan: 2},    
      {row: 50, col: 2, rowspan: 1, colspan: 2}                                              
    ], */
    
   /* cell: [
      {row: 0, col: 0, className: "ulshade bold fontlarge htMiddle htCenter tallrow"},
      {row: 1, col: 0, className: "htlightwhite underline bold htCenter"},
      {row: 1, col: 2, className: "lightgreen underline bold htCenter"},
      {row: 2, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 2, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 2, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 2, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 3, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 3, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 3, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 3, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 4, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 4, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 4, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 4, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 5, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 5, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 5, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 5, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 6, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 6, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 6, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 6, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 7, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 7, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 7, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 7, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 8, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 8, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 8, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 8, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 9, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 9, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 10, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 10, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 10, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 10, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},      
      {row: 11, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 11, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 11, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 11, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 12, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 12, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 12, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 12, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 13, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 13, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 13, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 13, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 14, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 14, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 14, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 14, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 15, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 15, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 15, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 15, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 16, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 16, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 16, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 16, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},  
      {row: 18, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 18, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 18, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 18, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 19, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 19, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 19, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 19, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},       
      {row: 20, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 20, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 20, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 20, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 21, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 21, col: 1, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 22, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 22, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 22, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 22, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 23, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 23, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},       
      {row: 24, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 24, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 24, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 24, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 25, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 25, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},      
      {row: 25, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 25, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 26, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 26, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 26, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 26, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 27, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 27, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 27, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 27, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 28, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 28, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 28, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 28, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 29, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 29, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 29, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 29, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 31, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 31, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 31, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 31, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 32, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 32, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 32, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 32, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 33, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 33, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 33, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 33, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},       
      {row: 34, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 34, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 34, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 34, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 35, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 35, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 35, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 35, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 37, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 37, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 37, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 37, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 38, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 38, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 38, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 38, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 39, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 39, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 39, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 39, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 40, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 40, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 40, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 40, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},      
      {row: 41, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 41, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 41, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 41, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 43, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 43, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 43, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 43, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 44, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 44, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 44, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 44, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 45, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 45, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 45, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 45, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 46, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 46, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 46, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 46, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 47, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 47, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 47, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 47, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 48, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 48, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 49, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 49, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 49, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 49, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 50, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 50, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 51, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 51, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 51, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 51, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 52, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 52, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 52, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 52, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 53, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 53, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 53, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 53, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},       
      {row: 54, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 54, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 55, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 55, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 55, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 55, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}, 
      {row: 56, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 56, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 57, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 57, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 57, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 57, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 58, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 58, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 58, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 58, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 59, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 59, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 59, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 59, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 60, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 60, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 60, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 60, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 61, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 61, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 61, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 61, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},                                                                    
      {row: 9, col: 2, className: "lightgreen underline bold htCenter"},
      {row: 17, col: 0, className: "htorange underline bold htCenter"}, 
      {row: 17, col: 2, className: "htred underline bold htCenter"},
      {row: 21, col: 2, className: "htred underline bold htCenter"},
      {row: 23, col: 0, className: "htorange underline bold htCenter"}, 
      {row: 30, col: 0, className: "htblue underline bold htCenter"}, 
      {row: 30, col: 2, className: "ulshade underline bold htCenter"},
      {row: 36, col: 0, className: "htblue underline bold htCenter"}, 
      {row: 36, col: 2, className: "ulshade underline bold htCenter"},
      {row: 42, col: 0, className: "htlightwhite underline bold htCenter"}, 
      {row: 42, col: 2, className: "htyellow underline bold htCenter"},
      {row: 48, col: 0, className: "htlightwhite underline bold htCenter"},
      {row: 50, col: 2, className: "htyellow underline bold htCenter"}                                                
    ],*/
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
    fillHandle: true,
    allowInvalid: false,
    allowEmpty: true,
    validator: char_validator,
    className: "htCenter",
    cells: function (row, col, prop) {
      var cellProperties = {};
      
      cellProperties.renderer = "gcCellRenderer";

      return cellProperties;
    }


 /*   mergeCells: [
      {row: 0, col: 0, rowspan: 1, colspan: 4},
      {row: 1, col: 0, rowspan: 1, colspan: 2},
      {row: 1, col: 2, rowspan: 1, colspan: 2},
      {row: 9, col: 0, rowspan: 1, colspan: 2},    
      {row: 9, col: 2, rowspan: 1, colspan: 2},
      {row: 17, col: 0, rowspan: 1, colspan: 2},    
      {row: 17, col: 2, rowspan: 1, colspan: 2},
      {row: 25, col: 0, rowspan: 1, colspan: 2},    
      {row: 25, col: 2, rowspan: 1, colspan: 2},
      {row: 33, col: 0, rowspan: 1, colspan: 2},    
      {row: 33, col: 2, rowspan: 1, colspan: 2},
      {row: 41, col: 0, rowspan: 1, colspan: 2},          
      {row: 41, col: 2, rowspan: 1, colspan: 2},
      {row: 49, col: 2, rowspan: 1, colspan: 2},
      {row: 49, col: 0, rowspan: 1, colspan: 2},
      {row: 54, col: 0, rowspan: 1, colspan: 2},          
      {row: 54, col: 2, rowspan: 1, colspan: 2}                                              
    ],
    cell: [
      {row: 0, col: 0, className: "ulshade bold fontlarge htMiddle htCenter mediumrow"},
      {row: 1, col: 0, className: "htred underline bold htCenter"},
      {row: 1, col: 2, className: "lightgreen underline bold htCenter"},
      {row: 9, col: 0, className: "htred underline bold htCenter"}, 
      {row: 9, col: 2, className: "lightgreen underline bold htCenter"},
      {row: 17, col: 0, className: "htblue underline bold htCenter"}, 
      {row: 17, col: 2, className: "htyellow underline bold htCenter"},
      {row: 25, col: 0, className: "htblue underline bold htCenter"}, 
      {row: 25, col: 2, className: "htyellow underline bold htCenter"},
      {row: 33, col: 0, className: "htorange underline bold htCenter"}, 
      {row: 33, col: 2, className: "htlightwhite underline bold htCenter"},
      {row: 41, col: 0, className: "htorange underline bold htCenter"}, 
      {row: 41, col: 2, className: "htlightwhite underline bold htCenter"},
      {row: 49, col: 0, className: "ulshade underline bold htCenter"}, 
      {row: 49, col: 2, className: "lightgreen underline bold htCenter"},
      {row: 54, col: 0, className: "ulshade underline bold htCenter"}, 
      {row: 54, col: 2, className: "lightgreen underline bold htCenter"},
      {row: 2, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 2, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 2, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 2, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 3, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 3, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 3, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 3, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 4, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 4, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 4, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 4, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 5, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 5, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 5, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 5, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 6, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 6, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 6, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 6, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 7, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 7, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 7, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 7, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 8, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 8, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 8, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 8, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 10, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 10, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 10, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 10, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 11, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 11, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 11, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 11, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 12, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 12, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 12, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 12, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 13, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 13, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 13, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 13, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 14, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 14, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 14, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 14, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 15, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 15, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 15, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 15, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 16, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 16, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 16, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 16, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 18, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 18, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 18, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 18, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 19, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 19, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 19, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 19, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 20, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 20, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 20, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 20, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 21, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 21, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 21, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 21, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 22, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 22, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 22, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 22, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 23, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 23, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 23, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 23, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 24, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 24, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 24, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 24, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 26, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 26, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 26, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 26, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 27, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 27, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 27, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 27, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 28, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 28, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 28, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 28, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 29, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 29, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 29, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 29, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 30, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 30, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 30, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 30, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 31, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 31, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 31, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 31, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 32, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 32, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 32, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 32, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 34, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 34, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 34, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 34, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 35, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 35, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 35, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 35, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 36, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 36, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 36, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 36, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 37, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 37, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 37, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 37, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 38, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 38, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 38, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 38, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 39, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 39, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 39, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 39, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 40, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 40, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 40, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 40, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 42, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 42, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 42, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 42, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 43, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 43, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 43, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 43, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 44, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 44, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 44, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 44, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 45, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 45, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 45, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 45, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 46, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 46, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 46, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 46, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 47, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 47, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 47, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 47, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 48, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 48, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 48, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 48, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 50, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 50, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 50, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 50, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 51, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 51, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 51, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 51, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 52, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 52, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 52, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 52, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 53, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 53, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 53, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 53, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 55, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 55, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 55, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 55, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 56, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 56, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 56, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 56, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 57, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 57, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 57, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 57, col: 3, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 58, col: 0, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 58, col: 1, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 58, col: 2, className: "htCenter", type: 'dropdown', source: jCollection},
      {row: 58, col: 3, className: "htCenter", type: 'dropdown', source: jCollection}                                                                                                  
    ],   */
  });

});


