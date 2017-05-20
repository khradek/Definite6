$(".gamecalls.custom_print").ready(function() {

  var setData = $("#data1").text();
  var replaceData = setData.replace(/'/g, '"');
  var gdata1 = JSON.parse(replaceData);

  var cellFormat = $("#cell-format1").text();
  var replace = cellFormat.replace(/'/g, '"');
  var formatData1 = JSON.parse(replace);

  var cClass = $("#cell-class1").text();
  var replaceClass = cClass.replace(/'/g, '"');
  var formatClass1 = JSON.parse(replaceClass);

  var widths = $("#col-widths1").text();
  var colWidths1 = JSON.parse(widths);

  var setData2 = $("#data2").text();
  var replaceData2 = setData2.replace(/'/g, '"');
  var gdata2 = JSON.parse(replaceData2);

  var cellFormat2 = $("#cell-format2").text();
  var replace2 = cellFormat2.replace(/'/g, '"');
  var formatData2 = JSON.parse(replace2);

  var cClass2 = $("#cell-class2").text();
  var replaceClass2 = cClass2.replace(/'/g, '"');
  var formatClass2 = JSON.parse(replaceClass2);

  var widths2 = $("#col-widths2").text();
  var colWidths2 = JSON.parse(widths2);

  textCellRenderer = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.renderers.TextRenderer.apply(this, arguments);
  };

  //Needed to stop dropdowns from appearing
  Handsontable.renderers.registerRenderer('textCellRenderer', textCellRenderer);

  var container1 = document.getElementById('myPrintTable1'),
    hot;

  hot = new Handsontable(container1, {
    data: gdata1,
    colWidths: colWidths1,
    mergeCells: formatData1,
    cell: formatClass1,        
    renderAllRows: true,
    readOnly: true,
    fillHandle: false,
    cells: function (row, col, prop) {
      var cellProperties = {};
      cellProperties.renderer = "textCellRenderer";
      return cellProperties;
    }    
  });

  var container2 = document.getElementById('myPrintTable2'),
    hot2;

  hot2 = new Handsontable(container2, {
    data: gdata2,
    colWidths: colWidths2,
    mergeCells: formatData2,
    cell: formatClass2,        
    renderAllRows: true,
    readOnly: true,
    fillHandle: false,
    cells: function (row, col, prop) {
      var cellProperties = {};
      cellProperties.renderer = "textCellRenderer";
      return cellProperties;
    }    
  });

});