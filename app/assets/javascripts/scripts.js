$(".scripts.show").ready(function() {

  //Grabs plays from hidden div and turns into JS array - used for play dropdown in script
  var splays = $("#script-plays").text();
  var collection = splays.substring(0, splays.length-1);
  var pCollection = JSON.parse(collection);
  
  var passSplays = $("#script-pass-plays").text();
  var paCollection = passSplays.substring(0, passSplays.length-1);
  var passCollection = JSON.parse(paCollection);

  var runSplays = $("#script-run-plays").text();
  var ruCollection = runSplays.substring(0, runSplays.length-1);
  var runCollection = JSON.parse(ruCollection);

  var hCollection = ["","L","M","R"];

  //Grabs script data (sdata) from hidden div and turns into JS array of arrays
  var setData = $("#sdata").text();
  var replaceData = setData.replace(/'/g, '"');
  var sdata = JSON.parse(replaceData);  

  var cellFormat = $("#cell-format").text();
  var replace = cellFormat.replace(/'/g, '"');
  var formatData = JSON.parse(replace);
 
  var cClass = $("#cell-class").text();
  var replaceClass = cClass.replace(/'/g, '"');
  var addCollect = replaceClass.replace(/"pCollection"/g, collection);
      addCollect = addCollect.replace(/\[" ","Run Play 1","Run Play 2","Run Play 3","Run Play 4","Run Play 5","Run Play 6","Run Play 7","Run Play 8","Run Play 9","Run Play 10","Run Play 11","Run Play 12","Run Play 13","Run Play 14","Run Play 15","Run Play 16","Run Play 17","Run Play 18","Run Play 19","Run Play 20","Run Play 21","Run Play 22","Run Play 23","Run Play 24","Run Play 25","Run Play 26","Run Play 27","Run Play 28","Run Play 29","Run Play 30","Run Play 31","Run Play 32","Run Play 33","Run Play 34","Run Play 35","Run Play 36","Run Play 37","Run Play 38","Run Play 39","Run Play 40","Run Play 41","Run Play 42","Run Play 43","Run Play 44","Run Play 45","Run Play 46","Run Play 47","Run Play 48","Run Play 49","Run Play 50","Run Play 51","Run Play 52"\]/g, ruCollection); 
      addCollect = addCollect.replace(/\[" ","Pass Play 1","Pass Play 2","Pass Play 3","Pass Play 4","Pass Play 5","Pass Play 6","Pass Play 7","Pass Play 8","Pass Play 9","Pass Play 10","Pass Play 11","Pass Play 12","Pass Play 13","Pass Play 14","Pass Play 15","Pass Play 16","Pass Play 17","Pass Play 18","Pass Play 19","Pass Play 20","Pass Play 21","Pass Play 22","Pass Play 23","Pass Play 24","Pass Play 25","Pass Play 26","Pass Play 27","Pass Play 28","Pass Play 29","Pass Play 30","Pass Play 31","Pass Play 32","Pass Play 33","Pass Play 34","Pass Play 35","Pass Play 36","Pass Play 37","Pass Play 38","Pass Play 39","Pass Play 40","Pass Play 41","Pass Play 42","Pass Play 43","Pass Play 44","Pass Play 45","Pass Play 46","Pass Play 47","Pass Play 48","Pass Play 49","Pass Play 50","Pass Play 51","Pass Play 52"\]/g, paCollection); 
      addCollect = addCollect.replace(/\[" ","Run Play 1","Pass Play 1","Run Play 2","Pass Play 2","Run Play 3","Pass Play 3","Run Play 4","Pass Play 4","Run Play 5","Pass Play 5","Run Play 6","Pass Play 6","Run Play 7","Pass Play 7","Run Play 8","Pass Play 8","Run Play 9","Pass Play 9","Run Play 10","Pass Play 10","Run Play 11","Pass Play 11","Run Play 12","Pass Play 12","Run Play 13","Pass Play 13","Run Play 14","Pass Play 14","Run Play 15","Pass Play 15","Run Play 16","Pass Play 16","Run Play 17","Pass Play 17","Run Play 18","Pass Play 18","Run Play 19","Pass Play 19","Run Play 20","Pass Play 20","Run Play 21","Pass Play 21","Run Play 22","Pass Play 22","Run Play 23","Pass Play 23","Run Play 24","Pass Play 24","Run Play 25","Pass Play 25","Run Play 26","Pass Play 26","Run Play 27","Pass Play 27","Run Play 28","Pass Play 28","Run Play 29","Pass Play 29","Run Play 30","Pass Play 30","Run Play 31","Pass Play 31","Run Play 32","Pass Play 32","Run Play 33","Pass Play 33","Run Play 34","Pass Play 34","Run Play 35","Pass Play 35","Run Play 36","Pass Play 36","Run Play 37","Pass Play 37","Run Play 38","Pass Play 38","Run Play 39","Pass Play 39","Run Play 40","Pass Play 40","Run Play 41","Pass Play 41","Run Play 42","Pass Play 42","Run Play 43","Pass Play 43","Run Play 44","Pass Play 44","Run Play 45","Pass Play 45","Run Play 46","Pass Play 46","Run Play 47","Pass Play 47","Run Play 48","Pass Play 48","Run Play 49","Pass Play 49","Run Play 50","Pass Play 50","Run Play 51","Pass Play 51","Run Play 52","Pass Play 52"\]/g, collection);   
  var formatClass = JSON.parse(addCollect);

  var widths = $("#col-widths").text();
  var colWidths = JSON.parse(widths);

  function removeClass(currentClasses, toRemove) {
    if (currentClasses) {
      var reg = new RegExp('(\\s|^)'+toRemove+'(\\s|$)');
      currentClasses=currentClasses.replace(reg,'');
    }
    return currentClasses;
  }

  var container = document.getElementById('scriptGrid'),
    hot;

  hot = new Handsontable(container, {
    data: sdata,
    minSpareCols: 0,
    minSpareRows: 0,
    maxRows: 60,
    renderAllRows: true,
    rowHeaders: true,
    colHeaders: true,
    colWidths: colWidths,
    manualColumnResize: true,
    manualRowResize: false,
    fillHandle: true,
    allowEmpty: true,
    className: "myTable",
    mergeCells: formatData, 
    cell: formatClass, 
    contextMenu: {
      items: {
        "row_above" : {},
        "row_below" : {},
        "remove_row" : {},
        "col_left" : {},
        "col_right" : {},
        "remove_col" : {},        
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
        "add_hash_dropdown": {
          name: "Add Hash Dropdown",
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                this.setCellMeta(row, col, 'type', 'dropdown');
                this.setCellMeta(row, col, 'source', hCollection);
              }
            }   
            this.render();
          }
        },
        "add_all_plays_dropdown": {
          name: 'Add All Plays Dropdown',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                this.setCellMeta(row, col, 'type', 'dropdown');
                this.setCellMeta(row, col, 'source', pCollection);
              }
            }   
            this.render();
          }
        },    
        "add_pass_plays_dropdown": {
          name: 'Add Pass Plays Dropdown',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                this.setCellMeta(row, col, 'type', 'dropdown');
                this.setCellMeta(row, col, 'source', passCollection);
              }
            }   
            this.render();
          }
        },  
        "add_run_plays_dropdown": {
          name: 'Add Run Plays Dropdown',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                this.setCellMeta(row, col, 'type', 'dropdown');
                this.setCellMeta(row, col, 'source', runCollection);
              }
            }   
            this.render();
          }
        },                    
        "remove_dropdown": {
          name: 'Remove Dropdown',
          callback: function(key, options) {
            var selection = this.getSelectedRange();
            var fromRow = Math.min(selection.from.row, selection.to.row);
            var toRow = Math.max(selection.from.row, selection.to.row);
            var fromCol = Math.min(selection.from.col, selection.to.col);
            var toCol = Math.max(selection.from.col, selection.to.col);
            
            for (var row = fromRow; row <= toRow; row++) {
              for (var col = fromCol; col <= toCol; col++) {
                var cellMeta = this.getCellMeta(row, col);
                this.setCellMeta(row, col, 'type', 'text');
                var newClass = removeClass(cellMeta.className, 'htAutocomplete');
                this.setCellMeta(row, col, 'className', newClass);
              }
            }
            this.render();
          }
        },        
        "hsep8": "---------",
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
      var separators = ['htLargeText', 'htShade', 'htDShade', 'htBold', 'htLeft', 'htCenter', 'htLeft', 'htRight', 'htJustify', 'htTop', 'htMiddle', 'htBottom', 'myTable', 'htAutocomplete', 'htInvalid'];
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
    var aposCheck = JSON.stringify(sdata);
    var JSONData = aposCheck.replace(/'/g, ' ');
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
    var num_cols = hot.countCols();
    var widths = [];
    var x = 0;
    for (var i = 0; i < num_cols; i++){
      widths.push(hot.getColWidth(x));
      x++;
    }
    var JSONData4 = JSON.stringify(widths);     
    $.ajax({
      type: "PATCH",
      url: "/events/" + $("#event-id").text() + "/scripts/" + $("#script-id").text(),
      data: {
        script: {
          sdata: JSONData,
          s_format: JSONData2,
          s_class: JSONData3,
          col_widths: JSONData4
        }
      },
      dataType: "json",
      success: function() {
        alert("Your Script has been saved");
      }
    });
    $("#sdata").text(JSONData);
    $("#cell-format").text(JSONData2);
    $("#cell-class").text(JSONData3);
    $("#col-widths").text(JSONData4);    
  });


  //Reset Colum Widths button
  var resetWidths = $("#orig-col-widths").text();
  $("#reset-widths-button").click(function() {
    if (confirm('------------------------------------------------------------\nAre you sure? This will restore the width of each column to its initial size.\n------------------------------------------------------------\nIf the column sizes do not revert after clicking OK, please refresh the page.\n------------------------------------------------------------')) {
      $.ajax({
        type: "PATCH",
        url: "/events/" + $("#event-id").text() + "/scripts/" + $("#script-id").text(),
        data: {
          script: {
            col_widths: resetWidths
          }
        },
        dataType: "json",
      });
      setTimeout(function(){
        $(".overlay").show();
        location.reload();
      }, 100);
    }
  });

});

