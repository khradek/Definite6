$(".practice_schedules.show").ready(function() {

  var setData = $("#data").text();
  var replaceData = setData.replace(/'/g, '"');
  var gdata = JSON.parse(replaceData);

  var cellFormat = $("#cell-format").text();
  var replace = cellFormat.replace(/'/g, '"');
  var formatData = JSON.parse(replace);

  var cClass = $("#cell-class").text();
  var replaceClass = cClass.replace(/'/g, '"');
  var formatClass = JSON.parse(replaceClass);

  var container = document.getElementById('myTable'),
    hot;

  function removeClass(currentClasses, toRemove) {
    if (currentClasses) {
      var reg = new RegExp('(\\s|^)'+toRemove+'(\\s|$)');
      currentClasses=currentClasses.replace(reg,'');
    }
    return currentClasses;
  }

  hot = new Handsontable(container, {
    data: gdata,
    colWidths: [44, 202, 202, 202, 202, 202],
    manualColumnResize: false,
    manualRowResize: false,
    rowHeaders: true,
    colHeaders: true,
    maxRows: 60,
    renderAllRows: true,
    fillHandle: {
      autoInsertRow: false,
    },
    minSpareRows: 0,
    minSpareCols: 0,
    className: "myTable",
    mergeCells: formatData,
    cell: formatClass,
    contextMenu: {
      items: {
        "row_above" : {},
        "row_below" : {},
        "remove_row" : {},
        "hsep3": "---------",        
        "alignment" : {},
        "mergeCells" : {},
        "hsep4": "---------",
        "undo": {},
        "redo": {},
        "hsep5": "---------",        
        "make_bold": {
          name: 'Bold Text',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                
                if (!cellMeta.className) {
                  this.setCellMeta(row, col, 'className', 'htBold');
                } else if (cellMeta.className && cellMeta.className.indexOf('htBold') < 0) {
                  this.setCellMeta(row, col, 'className', 'htBold' + cellMeta.className);
                }
              }
            }   
            this.render();
          }
        },       
        "remove_bold": {
          name: 'Remove Bold',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                var newClass = removeClass(cellMeta.className, 'htBold');
                this.setCellMeta(row, col, 'className', newClass);
              }
            }
            this.render();
          }
        },
        "make_large": {
          name: 'Large Text',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                
                if (!cellMeta.className) {
                  this.setCellMeta(row, col, 'className', 'htLargeText');
                } else if (cellMeta.className && cellMeta.className.indexOf('htLargeText') < 0) {
                  this.setCellMeta(row, col, 'className', 'htLargeText' + cellMeta.className);
                }
              }
            }   
            this.render();
          }
        },   
        "normal_size": {
          name: 'Normal Text',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                var newClass = removeClass(cellMeta.className, 'htLargeText');
                this.setCellMeta(row, col, 'className', newClass);
              }
            }
            this.render();
          }
        }, 
        "hsep6": "---------",
        "add_light_shade": {
          name: 'Light Shade',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                var newClass = removeClass(cellMeta.className, 'htDShade');
                this.setCellMeta(row, col, 'className', newClass);
                
                if (!cellMeta.className) {
                  this.setCellMeta(row, col, 'className', 'htShade');
                } else if (cellMeta.className && cellMeta.className.indexOf('htShade') < 0) {
                  this.setCellMeta(row, col, 'className', 'htShade' + cellMeta.className);
                }
              }
            }   
            this.render();
          }
        },
        "add_dark_shade": {
          name: 'Dark Shade',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                var newClass = removeClass(cellMeta.className, 'htShade');
                this.setCellMeta(row, col, 'className', newClass);
                
                if (!cellMeta.className) {
                  this.setCellMeta(row, col, 'className', 'htDShade');
                } else if (cellMeta.className && cellMeta.className.indexOf('htDShade') < 0) {
                  this.setCellMeta(row, col, 'className', 'htDShade' + cellMeta.className);
                }
              }
            }   
            this.render();
          }
        },
        "clear_color": {
          name: 'Clear Color',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                var newClass = removeClass(cellMeta.className, 'htShade');
                this.setCellMeta(row, col, 'className', newClass);
              }
            }
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                var newClass = removeClass(cellMeta.className, 'htDShade');
                this.setCellMeta(row, col, 'className', newClass);
              }
            }
            this.render();
          }
        },
        "hsep7": "---------",
        "clear_format": {
          name: 'Clear All Formatting',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);                
                this.setCellMeta(row, col, 'className', '');
              }
            }   
            this.render();
          }
        },        
      }
    },
    //Ensures there is a space between class names
    afterContextMenuHide: function(){
      var separators = ['htShade', 'htDShade', 'htBold', 'htLeft', 'htCenter', 'htLeft', 'htRight', 'htJustify', 'htTop', 'htMiddle', 'htBottom', 'myTable', 'htAutocomplete'];
      var cClass = this.getCellsMeta().filter(function(meta) {
        return meta.className;
      }).map(function(meta) {
        return {
          row: meta.row,
          col: meta.col,
          className: meta.className,
          type: meta.type,
          source: meta.source
        }
      });

      var x = JSON.stringify(cClass);
      for (var i = 0; i < separators.length; i++) { 
        var rg = new RegExp("\\" + separators[i], "g"); 
        x = x.replace(rg, " " + separators[i]); 
      }
      newX = x.replace(/\s+/g,' ').trim();
      $("#cell-class2").text(newX);
      var fFormat = JSON.stringify(this.mergeCells.mergedCellInfoCollection);
      $("#cell-format2").text(fFormat);
      $("#cell-class2").trigger("click")
    }
  });

  //Re-renders table after context menu changes have been made
  $("#cell-class2").click(function() {
    var cClass2 = $("#cell-class2").text();
    var replaceClass2 = cClass2.replace(/'/g, '"');
    var formatClass2 = JSON.parse(replaceClass2);
    var cellFormat2 = $("#cell-format2").text();
    var replace2 = cellFormat2.replace(/'/g, '"');
    var formatData2 = JSON.parse(replace2);
    hot.updateSettings({ cell: formatClass2, mergeCells: formatData2 });
    hot.render();
  });

  $(".save-button").click(function() {
    var JSONData = JSON.stringify(gdata);
    var JSONData2 = JSON.stringify(hot.mergeCells.mergedCellInfoCollection);
    var cellClass = hot.getCellsMeta().filter(function(meta) {
      return meta.className;
    }).map(function(meta) {
      return {
        row: meta.row,
        col: meta.col,
        className: meta.className,
        type: meta.type,
        source: meta.source
      }
    });
    var JSONData3 = JSON.stringify(cellClass);
    var event = $("#event-id").text();
    var pracSched = $("#practice_schedule-id").text();
    $.ajax({
      type: "PATCH",
      url: "/events/" + event + "/practice_schedules/" + pracSched,
      data: {
        practice_schedule: {
          p_data: JSONData,
          p_format: JSONData2,
          p_class: JSONData3
        }
      },
      dataType: "json",
      success: function() {
        alert("Your updates have been saved");
      }
    });
    $("#data").text(JSONData); 
    $("#cell-format").text(JSONData2);
    $("#cell-class").text(JSONData3);
  });



});