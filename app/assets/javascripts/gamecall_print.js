$(".gamecalls.print").ready(function() {

  //Grabs game call sheet data (gdata) from hidden div and turns into JS array of arrays
  var setData = $("#gdata").text();
  var replaceData = setData.replace(/'/g, '"');
  var gdata = JSON.parse(replaceData);

  //Grabs game call sheet data for page two (gdata2) from hidden div and turns into JS array of arrays
  var setData2 = $("#gdata2").text();
  var replaceData2 = setData2.replace(/'/g, '"');
  var gdata2 = JSON.parse(replaceData2);


  $("#gamecallPrint1").handsontable({
    data: gdata,
    minSpareCols: 0,
    minSpareRows: 0,
    renderAllRows: true,
    rowHeaders: false,
    colHeaders: false,
    contextMenu: ['undo', 'redo', 'alignment'],
    colWidths: [274, 274, 274, 274],   
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: false,
    className: "htCenter",
    readOnly: true,
    mergeCells: [
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
    ],
    cell: [
      {row: 0, col: 0, className: "ulshade bold fontlarge htMiddle htCenter tallrow"},
      {row: 1, col: 0, className: "htlightwhite underline bold htCenter"},
      {row: 1, col: 2, className: "lightgreen underline bold htCenter"},                                                                 
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
    ],
  });


  $("#gamecallPrint2").handsontable({
    data: gdata2,
    minSpareCols: 0,
    minSpareRows: 0,
    renderAllRows: true,
    rowHeaders: false,
    colHeaders: false,
    contextMenu: ['undo', 'redo'],
    colWidths: [274, 274, 274, 274],
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: false,
    className: "htCenter",
    mergeCells: [
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
      {row: 54, col: 2, className: "lightgreen underline bold htCenter"}                                                                                                    
    ],
  });

});


