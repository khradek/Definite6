$(".events.sortable").ready(function() {

  var setHeader = $("#colHeadings").text();
  var replaceHeading = setHeader.replace(/'/g, '"');
  var colHeadings = JSON.parse(replaceHeading);

  var setData = $("#sortData").text();
  var replaceData = setData.replace(/'/g, '"');
  var sortData1 = JSON.parse(replaceData);

  $("#installSortable").handsontable({
    data: sortData1,
    minSpareCols: 0,
    minSpareRows: 0,
    width: 1150,
    height: 600,
    renderAllRows: true,
    rowHeaders: true,
    colHeaders: colHeadings, 
    contextMenu: ['undo', 'redo', 'alignment'],
    colWidths: [325, 65, 65, 80, 125, 125, 125, 125, 125, 125, 125, 125, 125, 125, 125, 125, 125, 125],   
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: false,
    className: "htCenter",
    readOnly: true,
    fixedColumnsLeft: 4,
    sortIndicator: true,
    columnSorting: true
  });

  var setData2 = $("#sortData2").text();
  var replaceData2 = setData2.replace(/'/g, '"');
  var sortData2 = JSON.parse(replaceData2);

  $("#installSituation").handsontable({
    data: sortData2,
    minSpareCols: 0,
    minSpareRows: 0,
    width: 1150,
    height: 600,
    renderAllRows: true,
    rowHeaders: true,
    colHeaders: ["<span>Play</span>", "Situation 1", "Situation 2", "Situation 3", "Situation 4", "Situation 5", "Situation 6", "Situation 7", "Situation 8", "Situation 9", "Situation 10"],
    contextMenu: ['undo', 'redo', 'alignment'],
    colWidths: [325, 140, 140, 140, 140, 140, 140, 140, 140, 140, 140],   
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: false,
    className: "htCenter",
    readOnly: true,
    fixedColumnsLeft: 1,
    sortIndicator: true,
    columnSorting: true
  });

});