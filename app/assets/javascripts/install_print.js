$(".events.print").ready(function() {

  var setData = $("#idata1").text();
  var replaceData = setData.replace(/'/g, '"');
  var idata = JSON.parse(replaceData);

  $("#installPrint1").handsontable({
    data: idata,
    minSpareCols: 0,
    minSpareRows: 0,
    renderAllRows: true,
    rowHeaders: false,
    colHeaders: false,
    contextMenu: ['undo', 'redo', 'alignment'],
    colWidths: [90, 200, 200],   
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: false,
    className: "htCenter",
    readOnly: true,
    mergeCells: [
      {row: 0, col: 0, rowspan: 1, colspan: 3}
    ],
    cell: [
      {row: 0, col: 0, className: "ulshade bold fontmedium htMiddle htCenter mediumrow"},
      {row: 1, col: 0, className: "ulshade bold fontmedium htMiddle htCenter mediumrow"},
      {row: 1, col: 1, className: "ulshade bold fontmedium htMiddle htCenter mediumrow"},
      {row: 1, col: 2, className: "ulshade bold fontmedium htMiddle htCenter mediumrow"}
    ],
  });

  var setData2 = $("#idata2").text();
  var replaceData2 = setData2.replace(/'/g, '"');
  var idata2 = JSON.parse(replaceData2);

  $("#installPrint2").handsontable({
    data: idata2,
    minSpareCols: 0,
    minSpareRows: 0,
    renderAllRows: true,
    rowHeaders: false,
    colHeaders: false,
    contextMenu: ['undo', 'redo', 'alignment'],
    colWidths: [90, 200, 200],   
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: false,
    className: "htCenter",
    readOnly: true,
    cell: [
      {row: 0, col: 0, className: "ulshade bold fontmedium htMiddle htCenter mediumrow"},
      {row: 0, col: 1, className: "ulshade bold fontmedium htMiddle htCenter mediumrow"},
      {row: 0, col: 2, className: "ulshade bold fontmedium htMiddle htCenter mediumrow"}
    ],    
  });

  var setData3 = $("#idata3").text();
  var replaceData3 = setData3.replace(/'/g, '"');
  var idata3 = JSON.parse(replaceData3);

  $("#installPrint3").handsontable({
    data: idata3,
    minSpareCols: 0,
    minSpareRows: 0,
    renderAllRows: true,
    rowHeaders: false,
    colHeaders: false,
    contextMenu: ['undo', 'redo', 'alignment'],
    colWidths: [90, 200, 200],   
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: false,
    className: "htCenter",
    readOnly: true,
    cell: [
      {row: 0, col: 0, className: "ulshade bold fontmedium htMiddle htCenter mediumrow"},
      {row: 0, col: 1, className: "ulshade bold fontmedium htMiddle htCenter mediumrow"},
      {row: 0, col: 2, className: "ulshade bold fontmedium htMiddle htCenter mediumrow"}
    ],    
  });


});