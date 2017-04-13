$(".practice_schedules.print").ready(function() {

  var setData = $("#data").text();
  var replaceData = setData.replace(/'/g, '"');
  var gdata = JSON.parse(replaceData);

  var cellFormat = $("#cell-format").text();
  var replace = cellFormat.replace(/'/g, '"');
  var formatData = JSON.parse(replace);

  var cClass = $("#cell-class").text();
  var replaceClass = cClass.replace(/'/g, '"');
  var formatClass = JSON.parse(replaceClass);

  textCellRenderer = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.renderers.TextRenderer.apply(this, arguments);
  };

  //Needed to stop dropdowns from appearing
  Handsontable.renderers.registerRenderer('textCellRenderer', textCellRenderer);

  var container = document.getElementById('myPrintTable'),
    hot;

  hot = new Handsontable(container, {
    data: gdata,
    colWidths: [44, 202, 202, 202, 202, 202],
    renderAllRows: true,
    readOnly: true,
    fillHandle: false,
    mergeCells: formatData,
    cell: formatClass,
    cells: function (row, col, prop) {
      var cellProperties = {};
      cellProperties.renderer = "textCellRenderer";
      return cellProperties;
    }
  });

});