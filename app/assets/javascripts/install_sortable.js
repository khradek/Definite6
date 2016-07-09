$(".events.sortable").ready(function() {

  var setData = $("#sortData").text();
  var replaceData = setData.replace(/'/g, '"');
  var sortData1 = JSON.parse(replaceData);

  $("#installSortable").handsontable({
    data: sortData1,
    minSpareCols: 0,
    minSpareRows: 0,
    width: 1150,
    height: 2000,
    renderAllRows: true,
    rowHeaders: true,
    colHeaders: ["Play", "Hash", "Type", "Opener", "1st/2nd & Ten", "2nd & Long", "2nd & Medium", "2nd & Short", "3rd & Long", "3rd & Medium", "3rd & Short", "Redzone", "Goaline", "Coming Out", "Custom 1", "Custom 2", "Custom 3"],
    contextMenu: ['undo', 'redo', 'alignment'],
    colWidths: [325, 60, 60, 77, 125, 105, 125, 110, 105, 125, 110, 85, 85, 110, 95, 95, 95],   
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: false,
    className: "htCenter",
    readOnly: true,
    fixedColumnsLeft: 3,
    sortIndicator: true,
    columnSorting: true
  });


});