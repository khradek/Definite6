$(".default_practices.show").ready(function() {

  var setData = $("#data").text();
  var replaceData = setData.replace(/'/g, '"');
  var gdata = JSON.parse(replaceData);

  var cellFormat = $("#cell-format").text();
  var replace = cellFormat.replace(/'/g, '"');
  var formatData = JSON.parse(replace);

  var cClass = $("#cell-class").text();
  var replaceClass = cClass.replace(/'/g, '"');
  var formatClass = JSON.parse(replaceClass);

  var widths = $("#col-widths").text();
  var colWidths = JSON.parse(widths);

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
    colWidths: colWidths,
    manualColumnResize: true,
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
        "col_left" : {},
        "col_right" : {},
        "remove_col" : {},
        "hsep3": "---------",
        "mergeCells" : {},
        "hsep4": "---------",        
        "alignment" : {},
        "hsep5": "---------", 
        "text_options":{
          name: "Text Options",
          submenu: {
            items: [
              {                
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
                },
                key: "text_options:1"
              },
              {  
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
                },
                key: "text_options:2"
              },
              {
                name: 'Unerline Text',
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
                        this.setCellMeta(row, col, 'className', 'underline');
                      } else if (cellMeta.className && cellMeta.className.indexOf('underline') < 0) {
                        this.setCellMeta(row, col, 'className', 'underline' + cellMeta.className);
                      }
                    }
                  }   
                  this.render();
                },
                key: "text_options:3"
              },
              {
                name: 'Remove Underline',
                callback: function(key, options) {
                  var selection = this.getSelectedRange();
                  var fromRow = Math.min(selection.from.row, selection.to.row);
                  var toRow = Math.max(selection.from.row, selection.to.row);
                  var fromCol = Math.min(selection.from.col, selection.to.col);
                  var toCol = Math.max(selection.from.col, selection.to.col);
                  
                  for (var row = fromRow; row <= toRow; row++) {
                    for (var col = fromCol; col <= toCol; col++) {
                      var cellMeta = this.getCellMeta(row, col);
                      var newClass = removeClass(cellMeta.className, 'underline');
                      this.setCellMeta(row, col, 'className', newClass);
                    }
                  }
                  this.render();
                },
                key: "text_options:4"
              },
              {
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
                },
                key: "text_options:5"
              },
              {
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
                },
                key: "text_options:6"
              }
            ]
          }
        },  
        "hsep6": "---------",
        "colors":{
          name: "Cell Colors",
          submenu: {
            items: [
              {                
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
                      var newClass1 = removeClass(cellMeta.className, 'lightgreen');
                      this.setCellMeta(row, col, 'className', newClass1);
                      var newClass2 = removeClass(cellMeta.className, 'htyellow');
                      this.setCellMeta(row, col, 'className', newClass2);
                      var newClass3 = removeClass(cellMeta.className, 'htred');
                      this.setCellMeta(row, col, 'className', newClass3);
                      var newClass4 = removeClass(cellMeta.className, 'htblue');
                      this.setCellMeta(row, col, 'className', newClass4);
                      var newClass5 = removeClass(cellMeta.className, 'htgold');
                      this.setCellMeta(row, col, 'className', newClass5);
                      var newClass6 = removeClass(cellMeta.className, 'htorange');
                      this.setCellMeta(row, col, 'className', newClass6);                
                      
                      if (!cellMeta.className) {
                        this.setCellMeta(row, col, 'className', 'htDShade');
                      } else if (cellMeta.className && cellMeta.className.indexOf('htDShade') < 0) {
                        this.setCellMeta(row, col, 'className', 'htDShade' + cellMeta.className);
                      }
                    }
                  }   
                  this.render();
                },
                key: "colors:1"
              },
              {  
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
                      var newClass1 = removeClass(cellMeta.className, 'lightgreen');
                      this.setCellMeta(row, col, 'className', newClass1);
                      var newClass2 = removeClass(cellMeta.className, 'htyellow');
                      this.setCellMeta(row, col, 'className', newClass2);
                      var newClass3 = removeClass(cellMeta.className, 'htred');
                      this.setCellMeta(row, col, 'className', newClass3);
                      var newClass4 = removeClass(cellMeta.className, 'htblue');
                      this.setCellMeta(row, col, 'className', newClass4);
                      var newClass5 = removeClass(cellMeta.className, 'htgold');
                      this.setCellMeta(row, col, 'className', newClass5);
                      var newClass6 = removeClass(cellMeta.className, 'htorange');
                      this.setCellMeta(row, col, 'className', newClass6);                
                      
                      if (!cellMeta.className) {
                        this.setCellMeta(row, col, 'className', 'htShade');
                      } else if (cellMeta.className && cellMeta.className.indexOf('htShade') < 0) {
                        this.setCellMeta(row, col, 'className', 'htShade' + cellMeta.className);
                      }
                    }
                  }   
                  this.render();
                },
                key: "colors:2"
              },
              {
                name: 'Gold',
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
                      var newClass1 = removeClass(cellMeta.className, 'htDShade');
                      this.setCellMeta(row, col, 'className', newClass1);
                      var newClass2 = removeClass(cellMeta.className, 'lightgreen');
                      this.setCellMeta(row, col, 'className', newClass2);
                      var newClass3 = removeClass(cellMeta.className, 'htred');
                      this.setCellMeta(row, col, 'className', newClass3);
                      var newClass4 = removeClass(cellMeta.className, 'htblue');
                      this.setCellMeta(row, col, 'className', newClass4);
                      var newClass5 = removeClass(cellMeta.className, 'htyellow');
                      this.setCellMeta(row, col, 'className', newClass5);
                      var newClass6 = removeClass(cellMeta.className, 'htorange');
                      this.setCellMeta(row, col, 'className', newClass6);

                      if (!cellMeta.className) {
                        this.setCellMeta(row, col, 'className', 'htgold');
                      } else if (cellMeta.className && cellMeta.className.indexOf('htgold') < 0) {
                        this.setCellMeta(row, col, 'className', 'htgold' + cellMeta.className);
                      }
                    }
                  }   
                  this.render();
                },
                key: "colors:3"
              },
              {
                name: 'Yellow',
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
                      var newClass1 = removeClass(cellMeta.className, 'htDShade');
                      this.setCellMeta(row, col, 'className', newClass1);
                      var newClass2 = removeClass(cellMeta.className, 'lightgreen');
                      this.setCellMeta(row, col, 'className', newClass2);
                      var newClass3 = removeClass(cellMeta.className, 'htred');
                      this.setCellMeta(row, col, 'className', newClass3);
                      var newClass4 = removeClass(cellMeta.className, 'htblue');
                      this.setCellMeta(row, col, 'className', newClass4);
                      var newClass5 = removeClass(cellMeta.className, 'htgold');
                      this.setCellMeta(row, col, 'className', newClass5);
                      var newClass6 = removeClass(cellMeta.className, 'htorange');
                      this.setCellMeta(row, col, 'className', newClass6);

                      if (!cellMeta.className) {
                        this.setCellMeta(row, col, 'className', 'htyellow');
                      } else if (cellMeta.className && cellMeta.className.indexOf('htyellow') < 0) {
                        this.setCellMeta(row, col, 'className', 'htyellow' + cellMeta.className);
                      }
                    }
                  }   
                  this.render();
                },
                key: "colors:4"
              },
              {
                name: 'Green',
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
                      var newClass1 = removeClass(cellMeta.className, 'htDShade');
                      this.setCellMeta(row, col, 'className', newClass1);
                      var newClass2 = removeClass(cellMeta.className, 'htyellow');
                      this.setCellMeta(row, col, 'className', newClass2);
                      var newClass3 = removeClass(cellMeta.className, 'htred');
                      this.setCellMeta(row, col, 'className', newClass3);
                      var newClass4 = removeClass(cellMeta.className, 'htblue');
                      this.setCellMeta(row, col, 'className', newClass4);
                      var newClass5 = removeClass(cellMeta.className, 'htgold');
                      this.setCellMeta(row, col, 'className', newClass5);
                      var newClass6 = removeClass(cellMeta.className, 'htorange');
                      this.setCellMeta(row, col, 'className', newClass6);

                      if (!cellMeta.className) {
                        this.setCellMeta(row, col, 'className', 'lightgreen');
                      } else if (cellMeta.className && cellMeta.className.indexOf('lightgreen') < 0) {
                        this.setCellMeta(row, col, 'className', 'lightgreen' + cellMeta.className);
                      }
                    }
                  }   
                  this.render();
                },
                key: "colors:5"
              },
              {
                name: 'Orange',
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
                      var newClass1 = removeClass(cellMeta.className, 'htDShade');
                      this.setCellMeta(row, col, 'className', newClass1);
                      var newClass2 = removeClass(cellMeta.className, 'lightgreen');
                      this.setCellMeta(row, col, 'className', newClass2);
                      var newClass3 = removeClass(cellMeta.className, 'htred');
                      this.setCellMeta(row, col, 'className', newClass3);
                      var newClass4 = removeClass(cellMeta.className, 'htblue');
                      this.setCellMeta(row, col, 'className', newClass4);
                      var newClass5 = removeClass(cellMeta.className, 'htgold');
                      this.setCellMeta(row, col, 'className', newClass5);
                      var newClass6 = removeClass(cellMeta.className, 'htyellow');
                      this.setCellMeta(row, col, 'className', newClass6);

                      if (!cellMeta.className) {
                        this.setCellMeta(row, col, 'className', 'htorange');
                      } else if (cellMeta.className && cellMeta.className.indexOf('htorange') < 0) {
                        this.setCellMeta(row, col, 'className', 'htorange' + cellMeta.className);
                      }
                    }
                  }   
                  this.render();
                },
                key: "colors:6"
              },
              {
                name: 'Red',
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
                      var newClass1 = removeClass(cellMeta.className, 'htDShade');
                      this.setCellMeta(row, col, 'className', newClass1);
                      var newClass2 = removeClass(cellMeta.className, 'lightgreen');
                      this.setCellMeta(row, col, 'className', newClass2);
                      var newClass3 = removeClass(cellMeta.className, 'htyellow');
                      this.setCellMeta(row, col, 'className', newClass3);
                      var newClass4 = removeClass(cellMeta.className, 'htblue');
                      this.setCellMeta(row, col, 'className', newClass4);
                      var newClass5 = removeClass(cellMeta.className, 'htgold');
                      this.setCellMeta(row, col, 'className', newClass5);
                      var newClass6 = removeClass(cellMeta.className, 'htorange');
                      this.setCellMeta(row, col, 'className', newClass6);

                      if (!cellMeta.className) {
                        this.setCellMeta(row, col, 'className', 'htred');
                      } else if (cellMeta.className && cellMeta.className.indexOf('htred') < 0) {
                        this.setCellMeta(row, col, 'className', 'htred' + cellMeta.className);
                      }
                    }
                  }   
                  this.render();
                },
                key: "colors:7"
              },
              {
                name: 'Blue',
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
                      var newClass1 = removeClass(cellMeta.className, 'htDShade');
                      this.setCellMeta(row, col, 'className', newClass1);
                      var newClass2 = removeClass(cellMeta.className, 'lightgreen');
                      this.setCellMeta(row, col, 'className', newClass2);
                      var newClass3 = removeClass(cellMeta.className, 'htred');
                      this.setCellMeta(row, col, 'className', newClass3);
                      var newClass4 = removeClass(cellMeta.className, 'htyellow');
                      this.setCellMeta(row, col, 'className', newClass4);
                      var newClass5 = removeClass(cellMeta.className, 'htgold');
                      this.setCellMeta(row, col, 'className', newClass5);
                      var newClass6 = removeClass(cellMeta.className, 'htorange');
                      this.setCellMeta(row, col, 'className', newClass6);

                      if (!cellMeta.className) {
                        this.setCellMeta(row, col, 'className', 'htblue');
                      } else if (cellMeta.className && cellMeta.className.indexOf('htblue') < 0) {
                        this.setCellMeta(row, col, 'className', 'htblue' + cellMeta.className);
                      }
                    }
                  }   
                  this.render();
                },
                key: "colors:8"
              },
              {
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
                      var newClass1 = removeClass(cellMeta.className, 'htDShade');
                      this.setCellMeta(row, col, 'className', newClass1);
                      var newClass2 = removeClass(cellMeta.className, 'lightgreen');
                      this.setCellMeta(row, col, 'className', newClass2);
                      var newClass3 = removeClass(cellMeta.className, 'htred');
                      this.setCellMeta(row, col, 'className', newClass3);
                      var newClass4 = removeClass(cellMeta.className, 'htblue');
                      this.setCellMeta(row, col, 'className', newClass4);
                      var newClass5 = removeClass(cellMeta.className, 'htgold');
                      this.setCellMeta(row, col, 'className', newClass5);
                      var newClass6 = removeClass(cellMeta.className, 'htyellow');
                      this.setCellMeta(row, col, 'className', newClass6); 
                      var newClass6 = removeClass(cellMeta.className, 'htorange');
                      this.setCellMeta(row, col, 'className', newClass6);                                
                    }
                  }
                  this.render();
                },
                key: "colors:9"
              }
            ]
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
      var separators = ['htLargeText', 'htShade', 'htDShade', 'lightgreen', 'htyellow', 'htred', 'htblue', 'htgold', 'htorange', 'htBold', 'htLeft', 'htCenter', 'htLeft', 'htRight', 'htJustify', 'htTop', 'htMiddle', 'htBottom', 'myTable', 'htAutocomplete', 'htInvalid', 'underline'];
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
    var aposCheck = JSON.stringify(gdata);
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
      url: "/default_practice",
      data: {
        default_practice: {
          up_data: JSONData,
          up_format: JSONData2,
          up_class: JSONData3,
          col_widths: JSONData4
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
    $("#col-widths").text(JSONData4);
  });

  var resetData = [["OFFENSIVE PRACTICE SCHEDULE\nDATE:\n--","","","","",""],["","","","","",""],["","","","","",""],["DRESS","","MEETINGS","","QB/CENTERS","UNDER THE POST"],["","","","","",""],["","","","","",""],["INSTALLATION","","","","",""],["RUN","","PROTECTIONS","CONCEPTS","FORMATIONS\nMOTION/MOVEMENT","SCREENS"],["","","","","",""],["","","","","",""],["","","","","",""],["","","","","",""],["","","","","",""],["DYNAMIC WARM UP and STRETCH/CONDITIONING","","","","",""],["PD#","OL","RB","QB","Y","WR"],["A","","","","",""],["B","","","","",""],["PRACTICE PLAN","","","","",""],["PD#","OL","RB","QB","Y","WR"],["1","","","","",""],["2","","","","",""],["3","","","","",""],["4","","","","",""],["5","","","","",""],["6","","","","",""],["7","","","","",""],["8","","","","",""],["9","","","","",""],["10","","","","",""],["11","","","","",""],["12","","","","",""],["13","","","","",""],["14","","","","",""],["15","","","","",""],["16","","","","",""],["17","","","","",""],["18","","","","",""],["19","","","","",""],["20","","","","",""],["21","","","","",""],["22","","","","",""],["23","","","","",""],["24","","","","",""],["25","","","","",""]]
  var resetFormat = [{"row":0,"col":0,"rowspan":3,"colspan":6},{"row":3,"col":0,"rowspan":1,"colspan":2},{"row":3,"col":2,"rowspan":1,"colspan":2},{"row":4,"col":0,"rowspan":2,"colspan":2},{"row":4,"col":2,"rowspan":2,"colspan":2},{"row":4,"col":4,"rowspan":2,"colspan":1},{"row":4,"col":5,"rowspan":2,"colspan":1},{"row":6,"col":0,"rowspan":1,"colspan":6},{"row":7,"col":0,"rowspan":2,"colspan":2},{"row":7,"col":2,"rowspan":2,"colspan":1},{"row":7,"col":3,"rowspan":2,"colspan":1},{"row":7,"col":4,"rowspan":2,"colspan":1},{"row":7,"col":5,"rowspan":2,"colspan":1},{"row":9,"col":2,"rowspan":4,"colspan":1},{"row":9,"col":3,"rowspan":4,"colspan":1},{"row":9,"col":4,"rowspan":4,"colspan":1},{"row":9,"col":5,"rowspan":4,"colspan":1},{"row":13,"col":0,"rowspan":1,"colspan":6},{"row":17,"col":0,"rowspan":1,"colspan":6},{"row":15,"col":1,"rowspan":2,"colspan":5},{"row":9,"col":0,"rowspan":4,"colspan":2}]
  var resetClass = [{"row":0,"col":0,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":1,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":2,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":3,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":4,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":5,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":0,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":1,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":2,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":3,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":4,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":5,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":2,"col":0,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":2,"col":1,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":2,"col":2,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":2,"col":3,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":2,"col":4,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":2,"col":5,"className":" htLargeText htDShade htBold myTable htCenter htMiddle","type":"text"},{"row":3,"col":0,"className":" htBold htShade myTable htCenter","type":"text"},{"row":3,"col":1,"className":" htBold htShade myTable htCenter","type":"text"},{"row":3,"col":2,"className":" htBold htShade myTable htCenter","type":"text"},{"row":3,"col":3,"className":" htBold htShade myTable htCenter","type":"text"},{"row":3,"col":4,"className":" htBold htShade myTable htCenter","type":"text"},{"row":3,"col":5,"className":" htBold htShade myTable htCenter","type":"text"},{"row":4,"col":0,"className":" myTable htMiddle htCenter","type":"text"},{"row":4,"col":1,"className":" myTable htMiddle htCenter","type":"text"},{"row":4,"col":2,"className":" myTable htCenter htMiddle","type":"text"},{"row":4,"col":3,"className":" myTable htCenter htMiddle","type":"text"},{"row":4,"col":4,"className":" myTable htCenter htMiddle","type":"text"},{"row":4,"col":5,"className":" myTable htCenter htMiddle","type":"text"},{"row":5,"col":0,"className":" myTable htMiddle htCenter","type":"text"},{"row":5,"col":1,"className":" myTable htMiddle htCenter","type":"text"},{"row":5,"col":2,"className":" myTable htCenter htMiddle","type":"text"},{"row":5,"col":3,"className":" myTable htCenter htMiddle","type":"text"},{"row":5,"col":4,"className":" myTable htCenter htMiddle","type":"text"},{"row":5,"col":5,"className":" myTable htCenter htMiddle","type":"text"},{"row":6,"col":0,"className":" htBold htShade myTable htCenter","type":"text"},{"row":6,"col":1,"className":" htBold htShade myTable htCenter","type":"text"},{"row":6,"col":2,"className":" htBold htShade myTable htCenter","type":"text"},{"row":6,"col":3,"className":" htBold htShade myTable htCenter","type":"text"},{"row":6,"col":4,"className":" htBold htShade myTable htCenter","type":"text"},{"row":6,"col":5,"className":" htBold htShade myTable htCenter","type":"text"},{"row":7,"col":0,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":7,"col":1,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":7,"col":2,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":7,"col":3,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":7,"col":4,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":7,"col":5,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":8,"col":0,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":8,"col":1,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":8,"col":2,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":8,"col":3,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":8,"col":4,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":8,"col":5,"className":" htBold myTable htCenter htMiddle","type":"text"},{"row":9,"col":0,"className":" myTable htCenter htMiddle","type":"text"},{"row":9,"col":1,"className":" myTable htCenter htMiddle","type":"text"},{"row":9,"col":2,"className":" myTable htCenter htMiddle","type":"text"},{"row":9,"col":3,"className":" myTable htCenter htMiddle","type":"text"},{"row":9,"col":4,"className":" myTable htCenter htMiddle","type":"text"},{"row":9,"col":5,"className":" myTable htMiddle htCenter","type":"text"},{"row":10,"col":0,"className":" myTable htCenter htMiddle","type":"text"},{"row":10,"col":1,"className":" myTable htCenter htMiddle","type":"text"},{"row":10,"col":2,"className":" myTable htCenter htMiddle","type":"text"},{"row":10,"col":3,"className":" myTable htCenter htMiddle","type":"text"},{"row":10,"col":4,"className":" myTable htCenter htMiddle","type":"text"},{"row":10,"col":5,"className":" myTable htMiddle htCenter","type":"text"},{"row":11,"col":0,"className":" myTable htCenter htMiddle","type":"text"},{"row":11,"col":1,"className":" myTable htCenter htMiddle","type":"text"},{"row":11,"col":2,"className":" myTable htCenter htMiddle","type":"text"},{"row":11,"col":3,"className":" myTable htCenter htMiddle","type":"text"},{"row":11,"col":4,"className":" myTable htCenter htMiddle","type":"text"},{"row":11,"col":5,"className":" myTable htMiddle htCenter","type":"text"},{"row":12,"col":0,"className":" myTable htCenter htMiddle","type":"text"},{"row":12,"col":1,"className":" myTable htCenter htMiddle","type":"text"},{"row":12,"col":2,"className":" myTable htCenter htMiddle","type":"text"},{"row":12,"col":3,"className":" myTable htCenter htMiddle","type":"text"},{"row":12,"col":4,"className":" myTable htCenter htMiddle","type":"text"},{"row":12,"col":5,"className":" myTable htMiddle htCenter","type":"text"},{"row":13,"col":0,"className":" htShade htBold myTable htCenter","type":"text"},{"row":13,"col":1,"className":" htShade htBold myTable htCenter","type":"text"},{"row":13,"col":2,"className":" htShade htBold myTable htCenter","type":"text"},{"row":13,"col":3,"className":" htShade htBold myTable htCenter","type":"text"},{"row":13,"col":4,"className":" htShade htBold myTable htCenter","type":"text"},{"row":13,"col":5,"className":" htShade htBold myTable htCenter","type":"text"},{"row":14,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":14,"col":1,"className":" htBold myTable htCenter","type":"text"},{"row":14,"col":2,"className":" htBold myTable htCenter","type":"text"},{"row":14,"col":3,"className":" htBold myTable htCenter","type":"text"},{"row":14,"col":4,"className":" htBold myTable htCenter","type":"text"},{"row":14,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":15,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":15,"col":1,"className":" myTable htCenter htMiddle","type":"text"},{"row":15,"col":2,"className":" myTable htCenter htMiddle","type":"text"},{"row":15,"col":3,"className":" myTable htCenter htMiddle","type":"text"},{"row":15,"col":4,"className":" myTable htCenter htMiddle","type":"text"},{"row":15,"col":5,"className":" myTable htCenter htMiddle","type":"text"},{"row":16,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":16,"col":1,"className":" myTable htCenter htMiddle","type":"text"},{"row":16,"col":2,"className":" myTable htCenter htMiddle","type":"text"},{"row":16,"col":3,"className":" myTable htCenter htMiddle","type":"text"},{"row":16,"col":4,"className":" myTable htCenter htMiddle","type":"text"},{"row":16,"col":5,"className":" myTable htCenter htMiddle","type":"text"},{"row":17,"col":0,"className":" htShade htBold myTable htCenter","type":"text"},{"row":17,"col":1,"className":" htShade htBold myTable htCenter","type":"text"},{"row":17,"col":2,"className":" htShade htBold myTable htCenter","type":"text"},{"row":17,"col":3,"className":" htShade htBold myTable htCenter","type":"text"},{"row":17,"col":4,"className":" htShade htBold myTable htCenter","type":"text"},{"row":17,"col":5,"className":" htShade htBold myTable htCenter","type":"text"},{"row":18,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":18,"col":1,"className":" htBold myTable htCenter","type":"text"},{"row":18,"col":2,"className":" htBold myTable htCenter","type":"text"},{"row":18,"col":3,"className":" htBold myTable htCenter","type":"text"},{"row":18,"col":4,"className":" htBold myTable htCenter","type":"text"},{"row":18,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":19,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":19,"col":1,"className":" myTable htCenter htMiddle","type":"text"},{"row":19,"col":2,"className":" myTable htCenter htMiddle","type":"text"},{"row":19,"col":3,"className":" myTable htCenter htMiddle","type":"text"},{"row":19,"col":4,"className":" myTable htCenter htMiddle","type":"text"},{"row":19,"col":5,"className":" myTable htCenter htMiddle","type":"text"},{"row":20,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":20,"col":1,"className":" myTable htCenter htMiddle","type":"text"},{"row":20,"col":2,"className":" myTable htCenter htMiddle","type":"text"},{"row":20,"col":3,"className":" myTable htCenter htMiddle","type":"text"},{"row":20,"col":4,"className":" myTable htCenter htMiddle","type":"text"},{"row":20,"col":5,"className":" myTable htCenter htMiddle","type":"text"},{"row":21,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":21,"col":1,"className":" myTable htCenter htMiddle","type":"text"},{"row":21,"col":2,"className":" myTable htCenter htMiddle","type":"text"},{"row":21,"col":3,"className":" myTable htCenter htMiddle","type":"text"},{"row":21,"col":4,"className":" myTable htCenter htMiddle","type":"text"},{"row":21,"col":5,"className":" myTable htCenter htMiddle","type":"text"},{"row":22,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":22,"col":1,"className":" myTable htCenter","type":"text"},{"row":22,"col":2,"className":" myTable htCenter","type":"text"},{"row":22,"col":3,"className":" myTable htCenter","type":"text"},{"row":22,"col":4,"className":" myTable htCenter","type":"text"},{"row":22,"col":5,"className":" myTable htCenter","type":"text"},{"row":23,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":23,"col":1,"className":" myTable htCenter","type":"text"},{"row":23,"col":2,"className":" myTable htCenter","type":"text"},{"row":23,"col":3,"className":" myTable htCenter","type":"text"},{"row":23,"col":4,"className":" myTable htCenter","type":"text"},{"row":23,"col":5,"className":" myTable htCenter","type":"text"},{"row":24,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":24,"col":1,"className":" myTable htCenter","type":"text"},{"row":24,"col":2,"className":" myTable htCenter","type":"text"},{"row":24,"col":3,"className":" myTable htCenter","type":"text"},{"row":24,"col":4,"className":" myTable htCenter","type":"text"},{"row":24,"col":5,"className":" myTable htCenter","type":"text"},{"row":25,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":25,"col":1,"className":" myTable htCenter","type":"text"},{"row":25,"col":2,"className":" myTable htCenter","type":"text"},{"row":25,"col":3,"className":" myTable htCenter","type":"text"},{"row":25,"col":4,"className":" myTable htCenter","type":"text"},{"row":25,"col":5,"className":" myTable htCenter","type":"text"},{"row":26,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":26,"col":1,"className":" myTable htCenter","type":"text"},{"row":26,"col":2,"className":" myTable htCenter","type":"text"},{"row":26,"col":3,"className":" myTable htCenter","type":"text"},{"row":26,"col":4,"className":" myTable htCenter","type":"text"},{"row":26,"col":5,"className":" myTable htCenter","type":"text"},{"row":27,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":27,"col":1,"className":" myTable htCenter","type":"text"},{"row":27,"col":2,"className":" myTable htCenter","type":"text"},{"row":27,"col":3,"className":" myTable htCenter","type":"text"},{"row":27,"col":4,"className":" myTable htCenter","type":"text"},{"row":27,"col":5,"className":" myTable htCenter","type":"text"},{"row":28,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":28,"col":1,"className":" myTable htCenter","type":"text"},{"row":28,"col":2,"className":" myTable htCenter","type":"text"},{"row":28,"col":3,"className":" myTable htCenter","type":"text"},{"row":28,"col":4,"className":" myTable htCenter","type":"text"},{"row":28,"col":5,"className":" myTable htCenter","type":"text"},{"row":29,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":29,"col":1,"className":" myTable htCenter","type":"text"},{"row":29,"col":2,"className":" myTable htCenter","type":"text"},{"row":29,"col":3,"className":" myTable htCenter","type":"text"},{"row":29,"col":4,"className":" myTable htCenter","type":"text"},{"row":29,"col":5,"className":" myTable htCenter","type":"text"},{"row":30,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":30,"col":1,"className":" myTable htCenter","type":"text"},{"row":30,"col":2,"className":" myTable htCenter","type":"text"},{"row":30,"col":3,"className":" myTable htCenter","type":"text"},{"row":30,"col":4,"className":" myTable htCenter","type":"text"},{"row":30,"col":5,"className":" myTable htCenter","type":"text"},{"row":31,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":31,"col":1,"className":" myTable htCenter","type":"text"},{"row":31,"col":2,"className":" myTable htCenter","type":"text"},{"row":31,"col":3,"className":" myTable htCenter","type":"text"},{"row":31,"col":4,"className":" myTable htCenter","type":"text"},{"row":31,"col":5,"className":" myTable htCenter","type":"text"},{"row":32,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":32,"col":1,"className":" myTable htCenter","type":"text"},{"row":32,"col":2,"className":" myTable htCenter","type":"text"},{"row":32,"col":3,"className":" myTable htCenter","type":"text"},{"row":32,"col":4,"className":" myTable htCenter","type":"text"},{"row":32,"col":5,"className":" myTable htCenter","type":"text"},{"row":33,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":33,"col":1,"className":" myTable htCenter","type":"text"},{"row":33,"col":2,"className":" myTable htCenter","type":"text"},{"row":33,"col":3,"className":" myTable htCenter","type":"text"},{"row":33,"col":4,"className":" myTable htCenter","type":"text"},{"row":33,"col":5,"className":" myTable htCenter","type":"text"},{"row":34,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":34,"col":1,"className":" myTable htCenter","type":"text"},{"row":34,"col":2,"className":" myTable htCenter","type":"text"},{"row":34,"col":3,"className":" myTable htCenter","type":"text"},{"row":34,"col":4,"className":" myTable htCenter","type":"text"},{"row":34,"col":5,"className":" myTable htCenter","type":"text"},{"row":35,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":35,"col":1,"className":" myTable htCenter","type":"text"},{"row":35,"col":2,"className":" myTable htCenter","type":"text"},{"row":35,"col":3,"className":" myTable htCenter","type":"text"},{"row":35,"col":4,"className":" myTable htCenter","type":"text"},{"row":35,"col":5,"className":" myTable htCenter","type":"text"},{"row":36,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":36,"col":1,"className":" myTable htCenter","type":"text"},{"row":36,"col":2,"className":" myTable htCenter","type":"text"},{"row":36,"col":3,"className":" myTable htCenter","type":"text"},{"row":36,"col":4,"className":" myTable htCenter","type":"text"},{"row":36,"col":5,"className":" myTable htCenter","type":"text"},{"row":37,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":37,"col":1,"className":" myTable htCenter","type":"text"},{"row":37,"col":2,"className":" myTable htCenter","type":"text"},{"row":37,"col":3,"className":" myTable htCenter","type":"text"},{"row":37,"col":4,"className":" myTable htCenter","type":"text"},{"row":37,"col":5,"className":" myTable htCenter","type":"text"},{"row":38,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":38,"col":1,"className":" myTable htCenter","type":"text"},{"row":38,"col":2,"className":" myTable htCenter","type":"text"},{"row":38,"col":3,"className":" myTable htCenter","type":"text"},{"row":38,"col":4,"className":" myTable htCenter","type":"text"},{"row":38,"col":5,"className":" myTable htCenter","type":"text"},{"row":39,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":39,"col":1,"className":" myTable htCenter","type":"text"},{"row":39,"col":2,"className":" myTable htCenter","type":"text"},{"row":39,"col":3,"className":" myTable htCenter","type":"text"},{"row":39,"col":4,"className":" myTable htCenter","type":"text"},{"row":39,"col":5,"className":" myTable htCenter","type":"text"},{"row":40,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":40,"col":1,"className":" myTable htCenter","type":"text"},{"row":40,"col":2,"className":" myTable htCenter","type":"text"},{"row":40,"col":3,"className":" myTable htCenter","type":"text"},{"row":40,"col":4,"className":" myTable htCenter","type":"text"},{"row":40,"col":5,"className":" myTable htCenter","type":"text"},{"row":41,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":41,"col":1,"className":" myTable htCenter","type":"text"},{"row":41,"col":2,"className":" myTable htCenter","type":"text"},{"row":41,"col":3,"className":" myTable htCenter","type":"text"},{"row":41,"col":4,"className":" myTable htCenter","type":"text"},{"row":41,"col":5,"className":" myTable htCenter","type":"text"},{"row":42,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":42,"col":1,"className":" myTable htCenter","type":"text"},{"row":42,"col":2,"className":" myTable htCenter","type":"text"},{"row":42,"col":3,"className":" myTable htCenter","type":"text"},{"row":42,"col":4,"className":" myTable htCenter","type":"text"},{"row":42,"col":5,"className":" myTable htCenter","type":"text"},{"row":43,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":43,"col":1,"className":" myTable htCenter","type":"text"},{"row":43,"col":2,"className":" myTable htCenter","type":"text"},{"row":43,"col":3,"className":" myTable htCenter","type":"text"},{"row":43,"col":4,"className":" myTable htCenter","type":"text"},{"row":43,"col":5,"className":" myTable htCenter","type":"text"}]
  
  var jResetData = JSON.stringify(resetData);
  var jResetFormat = JSON.stringify(resetFormat);
  var jResetClass = JSON.stringify(resetClass);
  var resetWidths = '[44,202,202,202,202,202]'

  //Reset Colum Widths button
  $("#reset-widths-button").click(function() {
    if (confirm('------------------------------------------------------------\nAre you sure? This will restore the width of each column to its default size.\n------------------------------------------------------------\nIf the column sizes do not revert after clicking OK, please refresh the page.\n------------------------------------------------------------')) {
      $.ajax({
        type: "PATCH",
        url: "/default_practice",
        data: {
          default_practice: {
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

  //Reset Table button
  $("#reset-table-button").click(function() {
    if (confirm('-----------------------------------------------------------\nAre you sure? This will reset the entire practice template and erase all changes.\n-----------------------------------------------------------')) {
      $.ajax({
        type: "PATCH",
        url: "/default_practice",
        data: {
          default_practice: {
            up_data: jResetData,
            up_format: jResetFormat,
            up_class: jResetClass,
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