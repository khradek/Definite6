$(".scripts.print").ready(function() {

  var setData = $("#sdata").text();
  var replaceData = setData.replace(/'/g, '"');
  var sdata = JSON.parse(replaceData); 

  var cellFormat = $("#cell-format").text();
  var replace = cellFormat.replace(/'/g, '"');
  var formatData = JSON.parse(replace);

  var cClass = $("#cell-class").text();
  var replaceClass = cClass.replace(/'/g, '"');
  var formatClass = JSON.parse(replaceClass);

  var widths = $("#col-widths").text();
  var colWidths = JSON.parse(widths);

  textCellRenderer = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.renderers.TextRenderer.apply(this, arguments);
  };

  //Needed to stop dropdowns from appearing
  Handsontable.renderers.registerRenderer('textCellRenderer', textCellRenderer);

  $("#scriptPrint").handsontable({
    data: sdata,
    minSpareCols: 0,
    minSpareRows: 0,
    renderAllRows: true,
    rowHeaders: false,
    colHeaders: false,
    contextMenu: false,
    colWidths: colWidths,
    manualColumnResize: false,
    manualRowResize: false,
    fillHandle: false,
    readOnly: true,
    mergeCells: formatData,
    cell: formatClass,
    cells: function (row, col, prop) {
      var cellProperties = {};
      cellProperties.renderer = "textCellRenderer";
      return cellProperties;
    }

  });


})