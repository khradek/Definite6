$(".gamecalls.custom").ready(function() {

  //Grabs plays from hidden div and turns into JS array - used for play dropdown in script
  var splays = $("#gamecall-plays").text();
  var collection = splays.substring(0, splays.length-1);
  var allPlaysCollection = JSON.parse(collection);

  var splays1 = $("#gamecall-plays-sit1").text();
  var collection1 = splays1.substring(0, splays1.length-1);
  var sit1Collection = JSON.parse(collection1);

  var splays2 = $("#gamecall-plays-sit2").text();
  var collection2 = splays2.substring(0, splays2.length-1);
  var sit2Collection = JSON.parse(collection2);

  var splays3 = $("#gamecall-plays-sit3").text();
  var collection3 = splays3.substring(0, splays3.length-1);
  var sit3Collection = JSON.parse(collection3);

  var splays4 = $("#gamecall-plays-sit4").text();
  var collection4 = splays4.substring(0, splays4.length-1);
  var sit4Collection = JSON.parse(collection4);

  var splays5 = $("#gamecall-plays-sit5").text();
  var collection5 = splays5.substring(0, splays5.length-1);
  var sit5Collection = JSON.parse(collection5);

  var splays6 = $("#gamecall-plays-sit6").text();
  var collection6 = splays6.substring(0, splays6.length-1);
  var sit6Collection = JSON.parse(collection6);

  var splays7 = $("#gamecall-plays-sit7").text();
  var collection7 = splays7.substring(0, splays7.length-1);
  var sit7Collection = JSON.parse(collection7);
  
  var splays8 = $("#gamecall-plays-sit8").text();
  var collection8 = splays8.substring(0, splays8.length-1);
  var sit8Collection = JSON.parse(collection8);

  var splays9 = $("#gamecall-plays-sit9").text();
  var collection9 = splays9.substring(0, splays9.length-1);
  var sit9Collection = JSON.parse(collection9);

  var splays10 = $("#gamecall-plays-sit10").text();
  var collection10 = splays10.substring(0, splays10.length-1);
  var sit10Collection = JSON.parse(collection10);

  var splays11 = $("#gamecall-plays-sit11").text();
  var collection11 = splays11.substring(0, splays11.length-1);
  var sit11Collection = JSON.parse(collection11);

  var splays12 = $("#gamecall-plays-sit12").text();
  var collection12 = splays12.substring(0, splays12.length-1);
  var sit12Collection = JSON.parse(collection12);

  var splays13 = $("#gamecall-plays-sit13").text();
  var collection13 = splays13.substring(0, splays13.length-1);
  var sit13Collection = JSON.parse(collection13);

  var splays14 = $("#gamecall-plays-sit14").text();
  var collection14 = splays14.substring(0, splays14.length-1);
  var sit14Collection = JSON.parse(collection14);                     

  var setData = $("#data1").text();
  var replaceData = setData.replace(/'/g, '"');
  var gdata1 = JSON.parse(replaceData);

  var cellFormat = $("#cell-format1").text();
  var replace = cellFormat.replace(/'/g, '"');
  var formatData1 = JSON.parse(replace);

  var widths = $("#col-widths1").text();
  var colWidths1 = JSON.parse(widths);

  var cClass = $("#cell-class1").text();
  var replaceClass = cClass.replace(/'/g, '"');
  var addCollect = replaceClass.replace(/\[" ","Sit 1 Lt Play 1","Sit 1 Lt Play 2","Sit 1 Lt Play 3","Sit 1 Lt Play 4","Sit 1 Lt Play 5","Sit 1 Lt Play 6","Sit 1 Lt Play 7","Sit 1 Lt Play 8","Sit 1 Lt Play 9","Sit 1 Lt Play 10","Sit 1 Lt Play 11","Sit 1 Lt Play 12","Sit 1 Lt Play 13","Sit 1 Lt Play 14","Sit 1 Lt Play 15","Sit 1 Lt Play 16","Sit 1 Lt Play 17","Sit 1 Lt Play 18","Sit 1 Lt Play 19","Sit 1 Lt Play 20","Sit 1 Rt Play 1","Sit 1 Rt Play 2","Sit 1 Rt Play 3","Sit 1 Rt Play 4","Sit 1 Rt Play 5","Sit 1 Rt Play 6","Sit 1 Rt Play 7","Sit 1 Rt Play 8","Sit 1 Rt Play 9","Sit 1 Rt Play 10","Sit 1 Rt Play 11","Sit 1 Rt Play 12","Sit 1 Rt Play 13","Sit 1 Rt Play 14","Sit 1 Rt Play 15","Sit 1 Rt Play 16","Sit 1 Rt Play 17","Sit 1 Rt Play 18","Sit 1 Rt Play 19","Sit 1 Rt Play 20","Sit 2 Run Lt Play 1","Sit 2 Run Lt Play 2","Sit 2 Run Lt Play 3","Sit 2 Run Lt Play 4","Sit 2 Run Lt Play 5","Sit 2 Run Lt Play 6","Sit 2 Run Lt Play 7","Sit 2 Run Lt Play 8","Sit 2 Run Lt Play 9","Sit 2 Run Lt Play 10","Sit 2 Run Lt Play 11","Sit 2 Run Lt Play 12","Sit 2 Run Lt Play 13","Sit 2 Run Lt Play 14","Sit 2 Run Lt Play 15","Sit 2 Run Rt Play 1","Sit 2 Run Rt Play 2","Sit 2 Run Rt Play 3","Sit 2 Run Rt Play 4","Sit 2 Run Rt Play 5","Sit 2 Run Rt Play 6","Sit 2 Run Rt Play 7","Sit 2 Run Rt Play 8","Sit 2 Run Rt Play 9","Sit 2 Run Rt Play 10","Sit 2 Run Rt Play 11","Sit 2 Run Rt Play 12","Sit 2 Run Rt Play 13","Sit 2 Run Rt Play 14","Sit 2 Run Rt Play 15","Sit 2 Pass Lt Play 1","Sit 2 Pass Lt Play 2","Sit 2 Pass Lt Play 3","Sit 2 Pass Lt Play 4","Sit 2 Pass Lt Play 5","Sit 2 Pass Lt Play 6","Sit 2 Pass Lt Play 7","Sit 2 Pass Lt Play 8","Sit 2 Pass Lt Play 9","Sit 2 Pass Lt Play 10","Sit 2 Pass Lt Play 11","Sit 2 Pass Lt Play 12","Sit 2 Pass Lt Play 13","Sit 2 Pass Lt Play 14","Sit 2 Pass Lt Play 15","Sit 2 Pass Rt Play 1","Sit 2 Pass Rt Play 2","Sit 2 Pass Rt Play 3","Sit 2 Pass Rt Play 4","Sit 2 Pass Rt Play 5","Sit 2 Pass Rt Play 6","Sit 2 Pass Rt Play 7","Sit 2 Pass Rt Play 8","Sit 2 Pass Rt Play 9","Sit 2 Pass Rt Play 10","Sit 2 Pass Rt Play 11","Sit 2 Pass Rt Play 12","Sit 2 Pass Rt Play 13","Sit 2 Pass Rt Play 14","Sit 2 Pass Rt Play 15","Sit 3 Run Lt Play 1","Sit 3 Run Lt Play 2","Sit 3 Run Lt Play 3","Sit 3 Run Lt Play 4","Sit 3 Run Lt Play 5","Sit 3 Run Lt Play 6","Sit 3 Run Lt Play 7","Sit 3 Run Lt Play 8","Sit 3 Run Lt Play 9","Sit 3 Run Lt Play 10","Sit 3 Run Lt Play 11","Sit 3 Run Lt Play 12","Sit 3 Run Lt Play 13","Sit 3 Run Lt Play 14","Sit 3 Run Lt Play 15","Sit 3 Run Rt Play 1","Sit 3 Run Rt Play 2","Sit 3 Run Rt Play 3","Sit 3 Run Rt Play 4","Sit 3 Run Rt Play 5","Sit 3 Run Rt Play 6","Sit 3 Run Rt Play 7","Sit 3 Run Rt Play 8","Sit 3 Run Rt Play 9","Sit 3 Run Rt Play 10","Sit 3 Run Rt Play 11","Sit 3 Run Rt Play 12","Sit 3 Run Rt Play 13","Sit 3 Run Rt Play 14","Sit 3 Run Rt Play 15","Sit 3 Pass Lt Play 1","Sit 3 Pass Lt Play 2","Sit 3 Pass Lt Play 3","Sit 3 Pass Lt Play 4","Sit 3 Pass Lt Play 5","Sit 3 Pass Lt Play 6","Sit 3 Pass Lt Play 7","Sit 3 Pass Lt Play 8","Sit 3 Pass Lt Play 9","Sit 3 Pass Lt Play 10","Sit 3 Pass Lt Play 11","Sit 3 Pass Lt Play 12","Sit 3 Pass Lt Play 13","Sit 3 Pass Lt Play 14","Sit 3 Pass Lt Play 15","Sit 3 Pass Rt Play 1","Sit 3 Pass Rt Play 2","Sit 3 Pass Rt Play 3","Sit 3 Pass Rt Play 4","Sit 3 Pass Rt Play 5","Sit 3 Pass Rt Play 6","Sit 3 Pass Rt Play 7","Sit 3 Pass Rt Play 8","Sit 3 Pass Rt Play 9","Sit 3 Pass Rt Play 10","Sit 3 Pass Rt Play 11","Sit 3 Pass Rt Play 12","Sit 3 Pass Rt Play 13","Sit 3 Pass Rt Play 14","Sit 3 Pass Rt Play 15","Sit 4 Run Lt Play 1","Sit 4 Run Lt Play 2","Sit 4 Run Lt Play 3","Sit 4 Run Lt Play 4","Sit 4 Run Lt Play 5","Sit 4 Run Lt Play 6","Sit 4 Run Lt Play 7","Sit 4 Run Lt Play 8","Sit 4 Run Lt Play 9","Sit 4 Run Lt Play 10","Sit 4 Run Lt Play 11","Sit 4 Run Lt Play 12","Sit 4 Run Lt Play 13","Sit 4 Run Lt Play 14","Sit 4 Run Lt Play 15","Sit 4 Run Rt Play 1","Sit 4 Run Rt Play 2","Sit 4 Run Rt Play 3","Sit 4 Run Rt Play 4","Sit 4 Run Rt Play 5","Sit 4 Run Rt Play 6","Sit 4 Run Rt Play 7","Sit 4 Run Rt Play 8","Sit 4 Run Rt Play 9","Sit 4 Run Rt Play 10","Sit 4 Run Rt Play 11","Sit 4 Run Rt Play 12","Sit 4 Run Rt Play 13","Sit 4 Run Rt Play 14","Sit 4 Run Rt Play 15","Sit 4 Pass Lt Play 1","Sit 4 Pass Lt Play 2","Sit 4 Pass Lt Play 3","Sit 4 Pass Lt Play 4","Sit 4 Pass Lt Play 5","Sit 4 Pass Lt Play 6","Sit 4 Pass Lt Play 7","Sit 4 Pass Lt Play 8","Sit 4 Pass Lt Play 9","Sit 4 Pass Lt Play 10","Sit 4 Pass Lt Play 11","Sit 4 Pass Lt Play 12","Sit 4 Pass Lt Play 13","Sit 4 Pass Lt Play 14","Sit 4 Pass Lt Play 15","Sit 4 Pass Rt Play 1","Sit 4 Pass Rt Play 2","Sit 4 Pass Rt Play 3","Sit 4 Pass Rt Play 4","Sit 4 Pass Rt Play 5","Sit 4 Pass Rt Play 6","Sit 4 Pass Rt Play 7","Sit 4 Pass Rt Play 8","Sit 4 Pass Rt Play 9","Sit 4 Pass Rt Play 10","Sit 4 Pass Rt Play 11","Sit 4 Pass Rt Play 12","Sit 4 Pass Rt Play 13","Sit 4 Pass Rt Play 14","Sit 4 Pass Rt Play 15","Sit 5 Run Lt Play 1","Sit 5 Run Lt Play 2","Sit 5 Run Lt Play 3","Sit 5 Run Lt Play 4","Sit 5 Run Lt Play 5","Sit 5 Run Lt Play 6","Sit 5 Run Lt Play 7","Sit 5 Run Lt Play 8","Sit 5 Run Lt Play 9","Sit 5 Run Lt Play 10","Sit 5 Run Lt Play 11","Sit 5 Run Lt Play 12","Sit 5 Run Lt Play 13","Sit 5 Run Lt Play 14","Sit 5 Run Lt Play 15","Sit 5 Run Rt Play 1","Sit 5 Run Rt Play 2","Sit 5 Run Rt Play 3","Sit 5 Run Rt Play 4","Sit 5 Run Rt Play 5","Sit 5 Run Rt Play 6","Sit 5 Run Rt Play 7","Sit 5 Run Rt Play 8","Sit 5 Run Rt Play 9","Sit 5 Run Rt Play 10","Sit 5 Run Rt Play 11","Sit 5 Run Rt Play 12","Sit 5 Run Rt Play 13","Sit 5 Run Rt Play 14","Sit 5 Run Rt Play 15","Sit 5 Pass Lt Play 1","Sit 5 Pass Lt Play 2","Sit 5 Pass Lt Play 3","Sit 5 Pass Lt Play 4","Sit 5 Pass Lt Play 5","Sit 5 Pass Lt Play 6","Sit 5 Pass Lt Play 7","Sit 5 Pass Lt Play 8","Sit 5 Pass Lt Play 9","Sit 5 Pass Lt Play 10","Sit 5 Pass Lt Play 11","Sit 5 Pass Lt Play 12","Sit 5 Pass Lt Play 13","Sit 5 Pass Lt Play 14","Sit 5 Pass Lt Play 15","Sit 5 Pass Rt Play 1","Sit 5 Pass Rt Play 2","Sit 5 Pass Rt Play 3","Sit 5 Pass Rt Play 4","Sit 5 Pass Rt Play 5","Sit 5 Pass Rt Play 6","Sit 5 Pass Rt Play 7","Sit 5 Pass Rt Play 8","Sit 5 Pass Rt Play 9","Sit 5 Pass Rt Play 10","Sit 5 Pass Rt Play 11","Sit 5 Pass Rt Play 12","Sit 5 Pass Rt Play 13","Sit 5 Pass Rt Play 14","Sit 5 Pass Rt Play 15","Sit 6 Run Lt Play 1","Sit 6 Run Lt Play 2","Sit 6 Run Lt Play 3","Sit 6 Run Lt Play 4","Sit 6 Run Lt Play 5","Sit 6 Run Lt Play 6","Sit 6 Run Lt Play 7","Sit 6 Run Lt Play 8","Sit 6 Run Lt Play 9","Sit 6 Run Lt Play 10","Sit 6 Run Lt Play 11","Sit 6 Run Lt Play 12","Sit 6 Run Lt Play 13","Sit 6 Run Lt Play 14","Sit 6 Run Lt Play 15","Sit 6 Run Rt Play 1","Sit 6 Run Rt Play 2","Sit 6 Run Rt Play 3","Sit 6 Run Rt Play 4","Sit 6 Run Rt Play 5","Sit 6 Run Rt Play 6","Sit 6 Run Rt Play 7","Sit 6 Run Rt Play 8","Sit 6 Run Rt Play 9","Sit 6 Run Rt Play 10","Sit 6 Run Rt Play 11","Sit 6 Run Rt Play 12","Sit 6 Run Rt Play 13","Sit 6 Run Rt Play 14","Sit 6 Run Rt Play 15","Sit 6 Pass Lt Play 1","Sit 6 Pass Lt Play 2","Sit 6 Pass Lt Play 3","Sit 6 Pass Lt Play 4","Sit 6 Pass Lt Play 5","Sit 6 Pass Lt Play 6","Sit 6 Pass Lt Play 7","Sit 6 Pass Lt Play 8","Sit 6 Pass Lt Play 9","Sit 6 Pass Lt Play 10","Sit 6 Pass Lt Play 11","Sit 6 Pass Lt Play 12","Sit 6 Pass Lt Play 13","Sit 6 Pass Lt Play 14","Sit 6 Pass Lt Play 15","Sit 6 Pass Rt Play 1","Sit 6 Pass Rt Play 2","Sit 6 Pass Rt Play 3","Sit 6 Pass Rt Play 4","Sit 6 Pass Rt Play 5","Sit 6 Pass Rt Play 6","Sit 6 Pass Rt Play 7","Sit 6 Pass Rt Play 8","Sit 6 Pass Rt Play 9","Sit 6 Pass Rt Play 10","Sit 6 Pass Rt Play 11","Sit 6 Pass Rt Play 12","Sit 6 Pass Rt Play 13","Sit 6 Pass Rt Play 14","Sit 6 Pass Rt Play 15","Sit 7 Run Lt Play 1","Sit 7 Run Lt Play 2","Sit 7 Run Lt Play 3","Sit 7 Run Lt Play 4","Sit 7 Run Lt Play 5","Sit 7 Run Lt Play 6","Sit 7 Run Lt Play 7","Sit 7 Run Lt Play 8","Sit 7 Run Lt Play 9","Sit 7 Run Lt Play 10","Sit 7 Run Lt Play 11","Sit 7 Run Lt Play 12","Sit 7 Run Lt Play 13","Sit 7 Run Lt Play 14","Sit 7 Run Lt Play 15","Sit 7 Run Rt Play 1","Sit 7 Run Rt Play 2","Sit 7 Run Rt Play 3","Sit 7 Run Rt Play 4","Sit 7 Run Rt Play 5","Sit 7 Run Rt Play 6","Sit 7 Run Rt Play 7","Sit 7 Run Rt Play 8","Sit 7 Run Rt Play 9","Sit 7 Run Rt Play 10","Sit 7 Run Rt Play 11","Sit 7 Run Rt Play 12","Sit 7 Run Rt Play 13","Sit 7 Run Rt Play 14","Sit 7 Run Rt Play 15","Sit 7 Pass Lt Play 1","Sit 7 Pass Lt Play 2","Sit 7 Pass Lt Play 3","Sit 7 Pass Lt Play 4","Sit 7 Pass Lt Play 5","Sit 7 Pass Lt Play 6","Sit 7 Pass Lt Play 7","Sit 7 Pass Lt Play 8","Sit 7 Pass Lt Play 9","Sit 7 Pass Lt Play 10","Sit 7 Pass Lt Play 11","Sit 7 Pass Lt Play 12","Sit 7 Pass Lt Play 13","Sit 7 Pass Lt Play 14","Sit 7 Pass Lt Play 15","Sit 7 Pass Rt Play 1","Sit 7 Pass Rt Play 2","Sit 7 Pass Rt Play 3","Sit 7 Pass Rt Play 4","Sit 7 Pass Rt Play 5","Sit 7 Pass Rt Play 6","Sit 7 Pass Rt Play 7","Sit 7 Pass Rt Play 8","Sit 7 Pass Rt Play 9","Sit 7 Pass Rt Play 10","Sit 7 Pass Rt Play 11","Sit 7 Pass Rt Play 12","Sit 7 Pass Rt Play 13","Sit 7 Pass Rt Play 14","Sit 7 Pass Rt Play 15","Sit 8 Run Lt Play 1","Sit 8 Run Lt Play 2","Sit 8 Run Lt Play 3","Sit 8 Run Lt Play 4","Sit 8 Run Lt Play 5","Sit 8 Run Lt Play 6","Sit 8 Run Lt Play 7","Sit 8 Run Lt Play 8","Sit 8 Run Lt Play 9","Sit 8 Run Lt Play 10","Sit 8 Run Lt Play 11","Sit 8 Run Lt Play 12","Sit 8 Run Lt Play 13","Sit 8 Run Lt Play 14","Sit 8 Run Lt Play 15","Sit 8 Run Rt Play 1","Sit 8 Run Rt Play 2","Sit 8 Run Rt Play 3","Sit 8 Run Rt Play 4","Sit 8 Run Rt Play 5","Sit 8 Run Rt Play 6","Sit 8 Run Rt Play 7","Sit 8 Run Rt Play 8","Sit 8 Run Rt Play 9","Sit 8 Run Rt Play 10","Sit 8 Run Rt Play 11","Sit 8 Run Rt Play 12","Sit 8 Run Rt Play 13","Sit 8 Run Rt Play 14","Sit 8 Run Rt Play 15","Sit 8 Pass Lt Play 1","Sit 8 Pass Lt Play 2","Sit 8 Pass Lt Play 3","Sit 8 Pass Lt Play 4","Sit 8 Pass Lt Play 5","Sit 8 Pass Lt Play 6","Sit 8 Pass Lt Play 7","Sit 8 Pass Lt Play 8","Sit 8 Pass Lt Play 9","Sit 8 Pass Lt Play 10","Sit 8 Pass Lt Play 11","Sit 8 Pass Lt Play 12","Sit 8 Pass Lt Play 13","Sit 8 Pass Lt Play 14","Sit 8 Pass Lt Play 15","Sit 8 Pass Rt Play 1","Sit 8 Pass Rt Play 2","Sit 8 Pass Rt Play 3","Sit 8 Pass Rt Play 4","Sit 8 Pass Rt Play 5","Sit 8 Pass Rt Play 6","Sit 8 Pass Rt Play 7","Sit 8 Pass Rt Play 8","Sit 8 Pass Rt Play 9","Sit 8 Pass Rt Play 10","Sit 8 Pass Rt Play 11","Sit 8 Pass Rt Play 12","Sit 8 Pass Rt Play 13","Sit 8 Pass Rt Play 14","Sit 8 Pass Rt Play 15","Sit 9 Run Lt Play 1","Sit 9 Run Lt Play 2","Sit 9 Run Lt Play 3","Sit 9 Run Lt Play 4","Sit 9 Run Lt Play 5","Sit 9 Run Lt Play 6","Sit 9 Run Lt Play 7","Sit 9 Run Lt Play 8","Sit 9 Run Lt Play 9","Sit 9 Run Lt Play 10","Sit 9 Run Lt Play 11","Sit 9 Run Lt Play 12","Sit 9 Run Lt Play 13","Sit 9 Run Lt Play 14","Sit 9 Run Lt Play 15","Sit 9 Run Rt Play 1","Sit 9 Run Rt Play 2","Sit 9 Run Rt Play 3","Sit 9 Run Rt Play 4","Sit 9 Run Rt Play 5","Sit 9 Run Rt Play 6","Sit 9 Run Rt Play 7","Sit 9 Run Rt Play 8","Sit 9 Run Rt Play 9","Sit 9 Run Rt Play 10","Sit 9 Run Rt Play 11","Sit 9 Run Rt Play 12","Sit 9 Run Rt Play 13","Sit 9 Run Rt Play 14","Sit 9 Run Rt Play 15","Sit 9 Pass Lt Play 1","Sit 9 Pass Lt Play 2","Sit 9 Pass Lt Play 3","Sit 9 Pass Lt Play 4","Sit 9 Pass Lt Play 5","Sit 9 Pass Lt Play 6","Sit 9 Pass Lt Play 7","Sit 9 Pass Lt Play 8","Sit 9 Pass Lt Play 9","Sit 9 Pass Lt Play 10","Sit 9 Pass Lt Play 11","Sit 9 Pass Lt Play 12","Sit 9 Pass Lt Play 13","Sit 9 Pass Lt Play 14","Sit 9 Pass Lt Play 15","Sit 9 Pass Rt Play 1","Sit 9 Pass Rt Play 2","Sit 9 Pass Rt Play 3","Sit 9 Pass Rt Play 4","Sit 9 Pass Rt Play 5","Sit 9 Pass Rt Play 6","Sit 9 Pass Rt Play 7","Sit 9 Pass Rt Play 8","Sit 9 Pass Rt Play 9","Sit 9 Pass Rt Play 10","Sit 9 Pass Rt Play 11","Sit 9 Pass Rt Play 12","Sit 9 Pass Rt Play 13","Sit 9 Pass Rt Play 14","Sit 9 Pass Rt Play 15","Sit 10 Run Lt Play 1","Sit 10 Run Lt Play 2","Sit 10 Run Lt Play 3","Sit 10 Run Lt Play 4","Sit 10 Run Lt Play 5","Sit 10 Run Lt Play 6","Sit 10 Run Lt Play 7","Sit 10 Run Lt Play 8","Sit 10 Run Lt Play 9","Sit 10 Run Lt Play 10","Sit 10 Run Lt Play 11","Sit 10 Run Lt Play 12","Sit 10 Run Lt Play 13","Sit 10 Run Lt Play 14","Sit 10 Run Lt Play 15","Sit 10 Run Rt Play 1","Sit 10 Run Rt Play 2","Sit 10 Run Rt Play 3","Sit 10 Run Rt Play 4","Sit 10 Run Rt Play 5","Sit 10 Run Rt Play 6","Sit 10 Run Rt Play 7","Sit 10 Run Rt Play 8","Sit 10 Run Rt Play 9","Sit 10 Run Rt Play 10","Sit 10 Run Rt Play 11","Sit 10 Run Rt Play 12","Sit 10 Run Rt Play 13","Sit 10 Run Rt Play 14","Sit 10 Run Rt Play 15","Sit 10 Pass Lt Play 1","Sit 10 Pass Lt Play 2","Sit 10 Pass Lt Play 3","Sit 10 Pass Lt Play 4","Sit 10 Pass Lt Play 5","Sit 10 Pass Lt Play 6","Sit 10 Pass Lt Play 7","Sit 10 Pass Lt Play 8","Sit 10 Pass Lt Play 9","Sit 10 Pass Lt Play 10","Sit 10 Pass Lt Play 11","Sit 10 Pass Lt Play 12","Sit 10 Pass Lt Play 13","Sit 10 Pass Lt Play 14","Sit 10 Pass Lt Play 15","Sit 10 Pass Rt Play 1","Sit 10 Pass Rt Play 2","Sit 10 Pass Rt Play 3","Sit 10 Pass Rt Play 4","Sit 10 Pass Rt Play 5","Sit 10 Pass Rt Play 6","Sit 10 Pass Rt Play 7","Sit 10 Pass Rt Play 8","Sit 10 Pass Rt Play 9","Sit 10 Pass Rt Play 10","Sit 10 Pass Rt Play 11","Sit 10 Pass Rt Play 12","Sit 10 Pass Rt Play 13","Sit 10 Pass Rt Play 14","Sit 10 Pass Rt Play 15","Sit 11 Run Lt Play 1","Sit 11 Run Lt Play 2","Sit 11 Run Lt Play 3","Sit 11 Run Lt Play 4","Sit 11 Run Lt Play 5","Sit 11 Run Lt Play 6","Sit 11 Run Lt Play 7","Sit 11 Run Lt Play 8","Sit 11 Run Lt Play 9","Sit 11 Run Lt Play 10","Sit 11 Run Lt Play 11","Sit 11 Run Lt Play 12","Sit 11 Run Lt Play 13","Sit 11 Run Lt Play 14","Sit 11 Run Lt Play 15","Sit 11 Run Rt Play 1","Sit 11 Run Rt Play 2","Sit 11 Run Rt Play 3","Sit 11 Run Rt Play 4","Sit 11 Run Rt Play 5","Sit 11 Run Rt Play 6","Sit 11 Run Rt Play 7","Sit 11 Run Rt Play 8","Sit 11 Run Rt Play 9","Sit 11 Run Rt Play 10","Sit 11 Run Rt Play 11","Sit 11 Run Rt Play 12","Sit 11 Run Rt Play 13","Sit 11 Run Rt Play 14","Sit 11 Run Rt Play 15","Sit 11 Pass Lt Play 1","Sit 11 Pass Lt Play 2","Sit 11 Pass Lt Play 3","Sit 11 Pass Lt Play 4","Sit 11 Pass Lt Play 5","Sit 11 Pass Lt Play 6","Sit 11 Pass Lt Play 7","Sit 11 Pass Lt Play 8","Sit 11 Pass Lt Play 9","Sit 11 Pass Lt Play 10","Sit 11 Pass Lt Play 11","Sit 11 Pass Lt Play 12","Sit 11 Pass Lt Play 13","Sit 11 Pass Lt Play 14","Sit 11 Pass Lt Play 15","Sit 11 Pass Rt Play 1","Sit 11 Pass Rt Play 2","Sit 11 Pass Rt Play 3","Sit 11 Pass Rt Play 4","Sit 11 Pass Rt Play 5","Sit 11 Pass Rt Play 6","Sit 11 Pass Rt Play 7","Sit 11 Pass Rt Play 8","Sit 11 Pass Rt Play 9","Sit 11 Pass Rt Play 10","Sit 11 Pass Rt Play 11","Sit 11 Pass Rt Play 12","Sit 11 Pass Rt Play 13","Sit 11 Pass Rt Play 14","Sit 11 Pass Rt Play 15","Sit 12 Run Lt Play 1","Sit 12 Run Lt Play 2","Sit 12 Run Lt Play 3","Sit 12 Run Lt Play 4","Sit 12 Run Lt Play 5","Sit 12 Run Lt Play 6","Sit 12 Run Lt Play 7","Sit 12 Run Lt Play 8","Sit 12 Run Lt Play 9","Sit 12 Run Lt Play 10","Sit 12 Run Lt Play 11","Sit 12 Run Lt Play 12","Sit 12 Run Lt Play 13","Sit 12 Run Lt Play 14","Sit 12 Run Lt Play 15","Sit 12 Run Rt Play 1","Sit 12 Run Rt Play 2","Sit 12 Run Rt Play 3","Sit 12 Run Rt Play 4","Sit 12 Run Rt Play 5","Sit 12 Run Rt Play 6","Sit 12 Run Rt Play 7","Sit 12 Run Rt Play 8","Sit 12 Run Rt Play 9","Sit 12 Run Rt Play 10","Sit 12 Run Rt Play 11","Sit 12 Run Rt Play 12","Sit 12 Run Rt Play 13","Sit 12 Run Rt Play 14","Sit 12 Run Rt Play 15","Sit 12 Pass Lt Play 1","Sit 12 Pass Lt Play 2","Sit 12 Pass Lt Play 3","Sit 12 Pass Lt Play 4","Sit 12 Pass Lt Play 5","Sit 12 Pass Lt Play 6","Sit 12 Pass Lt Play 7","Sit 12 Pass Lt Play 8","Sit 12 Pass Lt Play 9","Sit 12 Pass Lt Play 10","Sit 12 Pass Lt Play 11","Sit 12 Pass Lt Play 12","Sit 12 Pass Lt Play 13","Sit 12 Pass Lt Play 14","Sit 12 Pass Lt Play 15","Sit 12 Pass Rt Play 1","Sit 12 Pass Rt Play 2","Sit 12 Pass Rt Play 3","Sit 12 Pass Rt Play 4","Sit 12 Pass Rt Play 5","Sit 12 Pass Rt Play 6","Sit 12 Pass Rt Play 7","Sit 12 Pass Rt Play 8","Sit 12 Pass Rt Play 9","Sit 12 Pass Rt Play 10","Sit 12 Pass Rt Play 11","Sit 12 Pass Rt Play 12","Sit 12 Pass Rt Play 13","Sit 12 Pass Rt Play 14","Sit 12 Pass Rt Play 15","Sit 13 Run Lt Play 1","Sit 13 Run Lt Play 2","Sit 13 Run Lt Play 3","Sit 13 Run Lt Play 4","Sit 13 Run Lt Play 5","Sit 13 Run Lt Play 6","Sit 13 Run Lt Play 7","Sit 13 Run Lt Play 8","Sit 13 Run Lt Play 9","Sit 13 Run Lt Play 10","Sit 13 Run Lt Play 11","Sit 13 Run Lt Play 12","Sit 13 Run Lt Play 13","Sit 13 Run Lt Play 14","Sit 13 Run Lt Play 15","Sit 13 Run Rt Play 1","Sit 13 Run Rt Play 2","Sit 13 Run Rt Play 3","Sit 13 Run Rt Play 4","Sit 13 Run Rt Play 5","Sit 13 Run Rt Play 6","Sit 13 Run Rt Play 7","Sit 13 Run Rt Play 8","Sit 13 Run Rt Play 9","Sit 13 Run Rt Play 10","Sit 13 Run Rt Play 11","Sit 13 Run Rt Play 12","Sit 13 Run Rt Play 13","Sit 13 Run Rt Play 14","Sit 13 Run Rt Play 15","Sit 13 Pass Lt Play 1","Sit 13 Pass Lt Play 2","Sit 13 Pass Lt Play 3","Sit 13 Pass Lt Play 4","Sit 13 Pass Lt Play 5","Sit 13 Pass Lt Play 6","Sit 13 Pass Lt Play 7","Sit 13 Pass Lt Play 8","Sit 13 Pass Lt Play 9","Sit 13 Pass Lt Play 10","Sit 13 Pass Lt Play 11","Sit 13 Pass Lt Play 12","Sit 13 Pass Lt Play 13","Sit 13 Pass Lt Play 14","Sit 13 Pass Lt Play 15","Sit 13 Pass Rt Play 1","Sit 13 Pass Rt Play 2","Sit 13 Pass Rt Play 3","Sit 13 Pass Rt Play 4","Sit 13 Pass Rt Play 5","Sit 13 Pass Rt Play 6","Sit 13 Pass Rt Play 7","Sit 13 Pass Rt Play 8","Sit 13 Pass Rt Play 9","Sit 13 Pass Rt Play 10","Sit 13 Pass Rt Play 11","Sit 13 Pass Rt Play 12","Sit 13 Pass Rt Play 13","Sit 13 Pass Rt Play 14","Sit 13 Pass Rt Play 15","Sit 14 Lt Play 1","Sit 14 Lt Play 2","Sit 14 Lt Play 3","Sit 14 Lt Play 4","Sit 14 Lt Play 5","Sit 14 Lt Play 6","Sit 14 Lt Play 7","Sit 14 Lt Play 8","Sit 14 Lt Play 9","Sit 14 Lt Play 10","Sit 14 Lt Play 11","Sit 14 Lt Play 12","Sit 14 Lt Play 13","Sit 14 Lt Play 14","Sit 14 Lt Play 15","Sit 14 Lt Play 16","Sit 14 Lt Play 17","Sit 14 Lt Play 18","Sit 14 Lt Play 19","Sit 14 Lt Play 20","Sit 14 Rt Play 1","Sit 14 Rt Play 2","Sit 14 Rt Play 3","Sit 14 Rt Play 4","Sit 14 Rt Play 5","Sit 14 Rt Play 6","Sit 14 Rt Play 7","Sit 14 Rt Play 8","Sit 14 Rt Play 9","Sit 14 Rt Play 10","Sit 14 Rt Play 11","Sit 14 Rt Play 12","Sit 14 Rt Play 13","Sit 14 Rt Play 14","Sit 14 Rt Play 15","Sit 14 Rt Play 16","Sit 14 Rt Play 17","Sit 14 Rt Play 18","Sit 14 Rt Play 19","Sit 14 Rt Play 20"\]/g, collection);
      addCollect = addCollect.replace(/\[" ","Sit 1 Lt Play 1","Sit 1 Lt Play 2","Sit 1 Lt Play 3","Sit 1 Lt Play 4","Sit 1 Lt Play 5","Sit 1 Lt Play 6","Sit 1 Lt Play 7","Sit 1 Lt Play 8","Sit 1 Lt Play 9","Sit 1 Lt Play 10","Sit 1 Lt Play 11","Sit 1 Lt Play 12","Sit 1 Lt Play 13","Sit 1 Lt Play 14","Sit 1 Lt Play 15","Sit 1 Lt Play 16","Sit 1 Lt Play 17","Sit 1 Lt Play 18","Sit 1 Lt Play 19","Sit 1 Lt Play 20","Sit 1 Rt Play 1","Sit 1 Rt Play 2","Sit 1 Rt Play 3","Sit 1 Rt Play 4","Sit 1 Rt Play 5","Sit 1 Rt Play 6","Sit 1 Rt Play 7","Sit 1 Rt Play 8","Sit 1 Rt Play 9","Sit 1 Rt Play 10","Sit 1 Rt Play 11","Sit 1 Rt Play 12","Sit 1 Rt Play 13","Sit 1 Rt Play 14","Sit 1 Rt Play 15","Sit 1 Rt Play 16","Sit 1 Rt Play 17","Sit 1 Rt Play 18","Sit 1 Rt Play 19","Sit 1 Rt Play 20"\]/g, collection1); 
      addCollect = addCollect.replace(/\[" ","Sit 2 Run Lt Play 1","Sit 2 Run Lt Play 2","Sit 2 Run Lt Play 3","Sit 2 Run Lt Play 4","Sit 2 Run Lt Play 5","Sit 2 Run Lt Play 6","Sit 2 Run Lt Play 7","Sit 2 Run Lt Play 8","Sit 2 Run Lt Play 9","Sit 2 Run Lt Play 10","Sit 2 Run Lt Play 11","Sit 2 Run Lt Play 12","Sit 2 Run Lt Play 13","Sit 2 Run Lt Play 14","Sit 2 Run Lt Play 15","Sit 2 Run Rt Play 1","Sit 2 Run Rt Play 2","Sit 2 Run Rt Play 3","Sit 2 Run Rt Play 4","Sit 2 Run Rt Play 5","Sit 2 Run Rt Play 6","Sit 2 Run Rt Play 7","Sit 2 Run Rt Play 8","Sit 2 Run Rt Play 9","Sit 2 Run Rt Play 10","Sit 2 Run Rt Play 11","Sit 2 Run Rt Play 12","Sit 2 Run Rt Play 13","Sit 2 Run Rt Play 14","Sit 2 Run Rt Play 15","Sit 2 Pass Lt Play 1","Sit 2 Pass Lt Play 2","Sit 2 Pass Lt Play 3","Sit 2 Pass Lt Play 4","Sit 2 Pass Lt Play 5","Sit 2 Pass Lt Play 6","Sit 2 Pass Lt Play 7","Sit 2 Pass Lt Play 8","Sit 2 Pass Lt Play 9","Sit 2 Pass Lt Play 10","Sit 2 Pass Lt Play 11","Sit 2 Pass Lt Play 12","Sit 2 Pass Lt Play 13","Sit 2 Pass Lt Play 14","Sit 2 Pass Lt Play 15","Sit 2 Pass Rt Play 1","Sit 2 Pass Rt Play 2","Sit 2 Pass Rt Play 3","Sit 2 Pass Rt Play 4","Sit 2 Pass Rt Play 5","Sit 2 Pass Rt Play 6","Sit 2 Pass Rt Play 7","Sit 2 Pass Rt Play 8","Sit 2 Pass Rt Play 9","Sit 2 Pass Rt Play 10","Sit 2 Pass Rt Play 11","Sit 2 Pass Rt Play 12","Sit 2 Pass Rt Play 13","Sit 2 Pass Rt Play 14","Sit 2 Pass Rt Play 15"\]/g, collection2); 
      addCollect = addCollect.replace(/\[" ","Sit 3 Run Lt Play 1","Sit 3 Run Lt Play 2","Sit 3 Run Lt Play 3","Sit 3 Run Lt Play 4","Sit 3 Run Lt Play 5","Sit 3 Run Lt Play 6","Sit 3 Run Lt Play 7","Sit 3 Run Lt Play 8","Sit 3 Run Lt Play 9","Sit 3 Run Lt Play 10","Sit 3 Run Lt Play 11","Sit 3 Run Lt Play 12","Sit 3 Run Lt Play 13","Sit 3 Run Lt Play 14","Sit 3 Run Lt Play 15","Sit 3 Run Rt Play 1","Sit 3 Run Rt Play 2","Sit 3 Run Rt Play 3","Sit 3 Run Rt Play 4","Sit 3 Run Rt Play 5","Sit 3 Run Rt Play 6","Sit 3 Run Rt Play 7","Sit 3 Run Rt Play 8","Sit 3 Run Rt Play 9","Sit 3 Run Rt Play 10","Sit 3 Run Rt Play 11","Sit 3 Run Rt Play 12","Sit 3 Run Rt Play 13","Sit 3 Run Rt Play 14","Sit 3 Run Rt Play 15","Sit 3 Pass Lt Play 1","Sit 3 Pass Lt Play 2","Sit 3 Pass Lt Play 3","Sit 3 Pass Lt Play 4","Sit 3 Pass Lt Play 5","Sit 3 Pass Lt Play 6","Sit 3 Pass Lt Play 7","Sit 3 Pass Lt Play 8","Sit 3 Pass Lt Play 9","Sit 3 Pass Lt Play 10","Sit 3 Pass Lt Play 11","Sit 3 Pass Lt Play 12","Sit 3 Pass Lt Play 13","Sit 3 Pass Lt Play 14","Sit 3 Pass Lt Play 15","Sit 3 Pass Rt Play 1","Sit 3 Pass Rt Play 2","Sit 3 Pass Rt Play 3","Sit 3 Pass Rt Play 4","Sit 3 Pass Rt Play 5","Sit 3 Pass Rt Play 6","Sit 3 Pass Rt Play 7","Sit 3 Pass Rt Play 8","Sit 3 Pass Rt Play 9","Sit 3 Pass Rt Play 10","Sit 3 Pass Rt Play 11","Sit 3 Pass Rt Play 12","Sit 3 Pass Rt Play 13","Sit 3 Pass Rt Play 14","Sit 3 Pass Rt Play 15"\]/g, collection3); 
      addCollect = addCollect.replace(/\[" ","Sit 4 Run Lt Play 1","Sit 4 Run Lt Play 2","Sit 4 Run Lt Play 3","Sit 4 Run Lt Play 4","Sit 4 Run Lt Play 5","Sit 4 Run Lt Play 6","Sit 4 Run Lt Play 7","Sit 4 Run Lt Play 8","Sit 4 Run Lt Play 9","Sit 4 Run Lt Play 10","Sit 4 Run Lt Play 11","Sit 4 Run Lt Play 12","Sit 4 Run Lt Play 13","Sit 4 Run Lt Play 14","Sit 4 Run Lt Play 15","Sit 4 Run Rt Play 1","Sit 4 Run Rt Play 2","Sit 4 Run Rt Play 3","Sit 4 Run Rt Play 4","Sit 4 Run Rt Play 5","Sit 4 Run Rt Play 6","Sit 4 Run Rt Play 7","Sit 4 Run Rt Play 8","Sit 4 Run Rt Play 9","Sit 4 Run Rt Play 10","Sit 4 Run Rt Play 11","Sit 4 Run Rt Play 12","Sit 4 Run Rt Play 13","Sit 4 Run Rt Play 14","Sit 4 Run Rt Play 15","Sit 4 Pass Lt Play 1","Sit 4 Pass Lt Play 2","Sit 4 Pass Lt Play 3","Sit 4 Pass Lt Play 4","Sit 4 Pass Lt Play 5","Sit 4 Pass Lt Play 6","Sit 4 Pass Lt Play 7","Sit 4 Pass Lt Play 8","Sit 4 Pass Lt Play 9","Sit 4 Pass Lt Play 10","Sit 4 Pass Lt Play 11","Sit 4 Pass Lt Play 12","Sit 4 Pass Lt Play 13","Sit 4 Pass Lt Play 14","Sit 4 Pass Lt Play 15","Sit 4 Pass Rt Play 1","Sit 4 Pass Rt Play 2","Sit 4 Pass Rt Play 3","Sit 4 Pass Rt Play 4","Sit 4 Pass Rt Play 5","Sit 4 Pass Rt Play 6","Sit 4 Pass Rt Play 7","Sit 4 Pass Rt Play 8","Sit 4 Pass Rt Play 9","Sit 4 Pass Rt Play 10","Sit 4 Pass Rt Play 11","Sit 4 Pass Rt Play 12","Sit 4 Pass Rt Play 13","Sit 4 Pass Rt Play 14","Sit 4 Pass Rt Play 15"\]/g, collection4); 
      addCollect = addCollect.replace(/\[" ","Sit 5 Run Lt Play 1","Sit 5 Run Lt Play 2","Sit 5 Run Lt Play 3","Sit 5 Run Lt Play 4","Sit 5 Run Lt Play 5","Sit 5 Run Lt Play 6","Sit 5 Run Lt Play 7","Sit 5 Run Lt Play 8","Sit 5 Run Lt Play 9","Sit 5 Run Lt Play 10","Sit 5 Run Lt Play 11","Sit 5 Run Lt Play 12","Sit 5 Run Lt Play 13","Sit 5 Run Lt Play 14","Sit 5 Run Lt Play 15","Sit 5 Run Rt Play 1","Sit 5 Run Rt Play 2","Sit 5 Run Rt Play 3","Sit 5 Run Rt Play 4","Sit 5 Run Rt Play 5","Sit 5 Run Rt Play 6","Sit 5 Run Rt Play 7","Sit 5 Run Rt Play 8","Sit 5 Run Rt Play 9","Sit 5 Run Rt Play 10","Sit 5 Run Rt Play 11","Sit 5 Run Rt Play 12","Sit 5 Run Rt Play 13","Sit 5 Run Rt Play 14","Sit 5 Run Rt Play 15","Sit 5 Pass Lt Play 1","Sit 5 Pass Lt Play 2","Sit 5 Pass Lt Play 3","Sit 5 Pass Lt Play 4","Sit 5 Pass Lt Play 5","Sit 5 Pass Lt Play 6","Sit 5 Pass Lt Play 7","Sit 5 Pass Lt Play 8","Sit 5 Pass Lt Play 9","Sit 5 Pass Lt Play 10","Sit 5 Pass Lt Play 11","Sit 5 Pass Lt Play 12","Sit 5 Pass Lt Play 13","Sit 5 Pass Lt Play 14","Sit 5 Pass Lt Play 15","Sit 5 Pass Rt Play 1","Sit 5 Pass Rt Play 2","Sit 5 Pass Rt Play 3","Sit 5 Pass Rt Play 4","Sit 5 Pass Rt Play 5","Sit 5 Pass Rt Play 6","Sit 5 Pass Rt Play 7","Sit 5 Pass Rt Play 8","Sit 5 Pass Rt Play 9","Sit 5 Pass Rt Play 10","Sit 5 Pass Rt Play 11","Sit 5 Pass Rt Play 12","Sit 5 Pass Rt Play 13","Sit 5 Pass Rt Play 14","Sit 5 Pass Rt Play 15"\]/g, collection5); 
      addCollect = addCollect.replace(/\[" ","Sit 6 Run Lt Play 1","Sit 6 Run Lt Play 2","Sit 6 Run Lt Play 3","Sit 6 Run Lt Play 4","Sit 6 Run Lt Play 5","Sit 6 Run Lt Play 6","Sit 6 Run Lt Play 7","Sit 6 Run Lt Play 8","Sit 6 Run Lt Play 9","Sit 6 Run Lt Play 10","Sit 6 Run Lt Play 11","Sit 6 Run Lt Play 12","Sit 6 Run Lt Play 13","Sit 6 Run Lt Play 14","Sit 6 Run Lt Play 15","Sit 6 Run Rt Play 1","Sit 6 Run Rt Play 2","Sit 6 Run Rt Play 3","Sit 6 Run Rt Play 4","Sit 6 Run Rt Play 5","Sit 6 Run Rt Play 6","Sit 6 Run Rt Play 7","Sit 6 Run Rt Play 8","Sit 6 Run Rt Play 9","Sit 6 Run Rt Play 10","Sit 6 Run Rt Play 11","Sit 6 Run Rt Play 12","Sit 6 Run Rt Play 13","Sit 6 Run Rt Play 14","Sit 6 Run Rt Play 15","Sit 6 Pass Lt Play 1","Sit 6 Pass Lt Play 2","Sit 6 Pass Lt Play 3","Sit 6 Pass Lt Play 4","Sit 6 Pass Lt Play 5","Sit 6 Pass Lt Play 6","Sit 6 Pass Lt Play 7","Sit 6 Pass Lt Play 8","Sit 6 Pass Lt Play 9","Sit 6 Pass Lt Play 10","Sit 6 Pass Lt Play 11","Sit 6 Pass Lt Play 12","Sit 6 Pass Lt Play 13","Sit 6 Pass Lt Play 14","Sit 6 Pass Lt Play 15","Sit 6 Pass Rt Play 1","Sit 6 Pass Rt Play 2","Sit 6 Pass Rt Play 3","Sit 6 Pass Rt Play 4","Sit 6 Pass Rt Play 5","Sit 6 Pass Rt Play 6","Sit 6 Pass Rt Play 7","Sit 6 Pass Rt Play 8","Sit 6 Pass Rt Play 9","Sit 6 Pass Rt Play 10","Sit 6 Pass Rt Play 11","Sit 6 Pass Rt Play 12","Sit 6 Pass Rt Play 13","Sit 6 Pass Rt Play 14","Sit 6 Pass Rt Play 15"\]/g, collection6); 
      addCollect = addCollect.replace(/\[" ","Sit 7 Run Lt Play 1","Sit 7 Run Lt Play 2","Sit 7 Run Lt Play 3","Sit 7 Run Lt Play 4","Sit 7 Run Lt Play 5","Sit 7 Run Lt Play 6","Sit 7 Run Lt Play 7","Sit 7 Run Lt Play 8","Sit 7 Run Lt Play 9","Sit 7 Run Lt Play 10","Sit 7 Run Lt Play 11","Sit 7 Run Lt Play 12","Sit 7 Run Lt Play 13","Sit 7 Run Lt Play 14","Sit 7 Run Lt Play 15","Sit 7 Run Rt Play 1","Sit 7 Run Rt Play 2","Sit 7 Run Rt Play 3","Sit 7 Run Rt Play 4","Sit 7 Run Rt Play 5","Sit 7 Run Rt Play 6","Sit 7 Run Rt Play 7","Sit 7 Run Rt Play 8","Sit 7 Run Rt Play 9","Sit 7 Run Rt Play 10","Sit 7 Run Rt Play 11","Sit 7 Run Rt Play 12","Sit 7 Run Rt Play 13","Sit 7 Run Rt Play 14","Sit 7 Run Rt Play 15","Sit 7 Pass Lt Play 1","Sit 7 Pass Lt Play 2","Sit 7 Pass Lt Play 3","Sit 7 Pass Lt Play 4","Sit 7 Pass Lt Play 5","Sit 7 Pass Lt Play 6","Sit 7 Pass Lt Play 7","Sit 7 Pass Lt Play 8","Sit 7 Pass Lt Play 9","Sit 7 Pass Lt Play 10","Sit 7 Pass Lt Play 11","Sit 7 Pass Lt Play 12","Sit 7 Pass Lt Play 13","Sit 7 Pass Lt Play 14","Sit 7 Pass Lt Play 15","Sit 7 Pass Rt Play 1","Sit 7 Pass Rt Play 2","Sit 7 Pass Rt Play 3","Sit 7 Pass Rt Play 4","Sit 7 Pass Rt Play 5","Sit 7 Pass Rt Play 6","Sit 7 Pass Rt Play 7","Sit 7 Pass Rt Play 8","Sit 7 Pass Rt Play 9","Sit 7 Pass Rt Play 10","Sit 7 Pass Rt Play 11","Sit 7 Pass Rt Play 12","Sit 7 Pass Rt Play 13","Sit 7 Pass Rt Play 14","Sit 7 Pass Rt Play 15"\]/g, collection7);
      addCollect = addCollect.replace(/\[" ","Sit 8 Run Lt Play 1","Sit 8 Run Lt Play 2","Sit 8 Run Lt Play 3","Sit 8 Run Lt Play 4","Sit 8 Run Lt Play 5","Sit 8 Run Lt Play 6","Sit 8 Run Lt Play 7","Sit 8 Run Lt Play 8","Sit 8 Run Lt Play 9","Sit 8 Run Lt Play 10","Sit 8 Run Lt Play 11","Sit 8 Run Lt Play 12","Sit 8 Run Lt Play 13","Sit 8 Run Lt Play 14","Sit 8 Run Lt Play 15","Sit 8 Run Rt Play 1","Sit 8 Run Rt Play 2","Sit 8 Run Rt Play 3","Sit 8 Run Rt Play 4","Sit 8 Run Rt Play 5","Sit 8 Run Rt Play 6","Sit 8 Run Rt Play 7","Sit 8 Run Rt Play 8","Sit 8 Run Rt Play 9","Sit 8 Run Rt Play 10","Sit 8 Run Rt Play 11","Sit 8 Run Rt Play 12","Sit 8 Run Rt Play 13","Sit 8 Run Rt Play 14","Sit 8 Run Rt Play 15","Sit 8 Pass Lt Play 1","Sit 8 Pass Lt Play 2","Sit 8 Pass Lt Play 3","Sit 8 Pass Lt Play 4","Sit 8 Pass Lt Play 5","Sit 8 Pass Lt Play 6","Sit 8 Pass Lt Play 7","Sit 8 Pass Lt Play 8","Sit 8 Pass Lt Play 9","Sit 8 Pass Lt Play 10","Sit 8 Pass Lt Play 11","Sit 8 Pass Lt Play 12","Sit 8 Pass Lt Play 13","Sit 8 Pass Lt Play 14","Sit 8 Pass Lt Play 15","Sit 8 Pass Rt Play 1","Sit 8 Pass Rt Play 2","Sit 8 Pass Rt Play 3","Sit 8 Pass Rt Play 4","Sit 8 Pass Rt Play 5","Sit 8 Pass Rt Play 6","Sit 8 Pass Rt Play 7","Sit 8 Pass Rt Play 8","Sit 8 Pass Rt Play 9","Sit 8 Pass Rt Play 10","Sit 8 Pass Rt Play 11","Sit 8 Pass Rt Play 12","Sit 8 Pass Rt Play 13","Sit 8 Pass Rt Play 14","Sit 8 Pass Rt Play 15"\]/g, collection8);
      addCollect = addCollect.replace(/\[" ","Sit 9 Run Lt Play 1","Sit 9 Run Lt Play 2","Sit 9 Run Lt Play 3","Sit 9 Run Lt Play 4","Sit 9 Run Lt Play 5","Sit 9 Run Lt Play 6","Sit 9 Run Lt Play 7","Sit 9 Run Lt Play 8","Sit 9 Run Lt Play 9","Sit 9 Run Lt Play 10","Sit 9 Run Lt Play 11","Sit 9 Run Lt Play 12","Sit 9 Run Lt Play 13","Sit 9 Run Lt Play 14","Sit 9 Run Lt Play 15","Sit 9 Run Rt Play 1","Sit 9 Run Rt Play 2","Sit 9 Run Rt Play 3","Sit 9 Run Rt Play 4","Sit 9 Run Rt Play 5","Sit 9 Run Rt Play 6","Sit 9 Run Rt Play 7","Sit 9 Run Rt Play 8","Sit 9 Run Rt Play 9","Sit 9 Run Rt Play 10","Sit 9 Run Rt Play 11","Sit 9 Run Rt Play 12","Sit 9 Run Rt Play 13","Sit 9 Run Rt Play 14","Sit 9 Run Rt Play 15","Sit 9 Pass Lt Play 1","Sit 9 Pass Lt Play 2","Sit 9 Pass Lt Play 3","Sit 9 Pass Lt Play 4","Sit 9 Pass Lt Play 5","Sit 9 Pass Lt Play 6","Sit 9 Pass Lt Play 7","Sit 9 Pass Lt Play 8","Sit 9 Pass Lt Play 9","Sit 9 Pass Lt Play 10","Sit 9 Pass Lt Play 11","Sit 9 Pass Lt Play 12","Sit 9 Pass Lt Play 13","Sit 9 Pass Lt Play 14","Sit 9 Pass Lt Play 15","Sit 9 Pass Rt Play 1","Sit 9 Pass Rt Play 2","Sit 9 Pass Rt Play 3","Sit 9 Pass Rt Play 4","Sit 9 Pass Rt Play 5","Sit 9 Pass Rt Play 6","Sit 9 Pass Rt Play 7","Sit 9 Pass Rt Play 8","Sit 9 Pass Rt Play 9","Sit 9 Pass Rt Play 10","Sit 9 Pass Rt Play 11","Sit 9 Pass Rt Play 12","Sit 9 Pass Rt Play 13","Sit 9 Pass Rt Play 14","Sit 9 Pass Rt Play 15"\]/g, collection9); 
      addCollect = addCollect.replace(/\[" ","Sit 10 Run Lt Play 1","Sit 10 Run Lt Play 2","Sit 10 Run Lt Play 3","Sit 10 Run Lt Play 4","Sit 10 Run Lt Play 5","Sit 10 Run Lt Play 6","Sit 10 Run Lt Play 7","Sit 10 Run Lt Play 8","Sit 10 Run Lt Play 9","Sit 10 Run Lt Play 10","Sit 10 Run Lt Play 11","Sit 10 Run Lt Play 12","Sit 10 Run Lt Play 13","Sit 10 Run Lt Play 14","Sit 10 Run Lt Play 15","Sit 10 Run Rt Play 1","Sit 10 Run Rt Play 2","Sit 10 Run Rt Play 3","Sit 10 Run Rt Play 4","Sit 10 Run Rt Play 5","Sit 10 Run Rt Play 6","Sit 10 Run Rt Play 7","Sit 10 Run Rt Play 8","Sit 10 Run Rt Play 9","Sit 10 Run Rt Play 10","Sit 10 Run Rt Play 11","Sit 10 Run Rt Play 12","Sit 10 Run Rt Play 13","Sit 10 Run Rt Play 14","Sit 10 Run Rt Play 15","Sit 10 Pass Lt Play 1","Sit 10 Pass Lt Play 2","Sit 10 Pass Lt Play 3","Sit 10 Pass Lt Play 4","Sit 10 Pass Lt Play 5","Sit 10 Pass Lt Play 6","Sit 10 Pass Lt Play 7","Sit 10 Pass Lt Play 8","Sit 10 Pass Lt Play 9","Sit 10 Pass Lt Play 10","Sit 10 Pass Lt Play 11","Sit 10 Pass Lt Play 12","Sit 10 Pass Lt Play 13","Sit 10 Pass Lt Play 14","Sit 10 Pass Lt Play 15","Sit 10 Pass Rt Play 1","Sit 10 Pass Rt Play 2","Sit 10 Pass Rt Play 3","Sit 10 Pass Rt Play 4","Sit 10 Pass Rt Play 5","Sit 10 Pass Rt Play 6","Sit 10 Pass Rt Play 7","Sit 10 Pass Rt Play 8","Sit 10 Pass Rt Play 9","Sit 10 Pass Rt Play 10","Sit 10 Pass Rt Play 11","Sit 10 Pass Rt Play 12","Sit 10 Pass Rt Play 13","Sit 10 Pass Rt Play 14","Sit 10 Pass Rt Play 15"\]/g, collection10); 
      addCollect = addCollect.replace(/\[" ","Sit 11 Run Lt Play 1","Sit 11 Run Lt Play 2","Sit 11 Run Lt Play 3","Sit 11 Run Lt Play 4","Sit 11 Run Lt Play 5","Sit 11 Run Lt Play 6","Sit 11 Run Lt Play 7","Sit 11 Run Lt Play 8","Sit 11 Run Lt Play 9","Sit 11 Run Lt Play 10","Sit 11 Run Lt Play 11","Sit 11 Run Lt Play 12","Sit 11 Run Lt Play 13","Sit 11 Run Lt Play 14","Sit 11 Run Lt Play 15","Sit 11 Run Rt Play 1","Sit 11 Run Rt Play 2","Sit 11 Run Rt Play 3","Sit 11 Run Rt Play 4","Sit 11 Run Rt Play 5","Sit 11 Run Rt Play 6","Sit 11 Run Rt Play 7","Sit 11 Run Rt Play 8","Sit 11 Run Rt Play 9","Sit 11 Run Rt Play 10","Sit 11 Run Rt Play 11","Sit 11 Run Rt Play 12","Sit 11 Run Rt Play 13","Sit 11 Run Rt Play 14","Sit 11 Run Rt Play 15","Sit 11 Pass Lt Play 1","Sit 11 Pass Lt Play 2","Sit 11 Pass Lt Play 3","Sit 11 Pass Lt Play 4","Sit 11 Pass Lt Play 5","Sit 11 Pass Lt Play 6","Sit 11 Pass Lt Play 7","Sit 11 Pass Lt Play 8","Sit 11 Pass Lt Play 9","Sit 11 Pass Lt Play 10","Sit 11 Pass Lt Play 11","Sit 11 Pass Lt Play 12","Sit 11 Pass Lt Play 13","Sit 11 Pass Lt Play 14","Sit 11 Pass Lt Play 15","Sit 11 Pass Rt Play 1","Sit 11 Pass Rt Play 2","Sit 11 Pass Rt Play 3","Sit 11 Pass Rt Play 4","Sit 11 Pass Rt Play 5","Sit 11 Pass Rt Play 6","Sit 11 Pass Rt Play 7","Sit 11 Pass Rt Play 8","Sit 11 Pass Rt Play 9","Sit 11 Pass Rt Play 10","Sit 11 Pass Rt Play 11","Sit 11 Pass Rt Play 12","Sit 11 Pass Rt Play 13","Sit 11 Pass Rt Play 14","Sit 11 Pass Rt Play 15"\]/g, collection11);
      addCollect = addCollect.replace(/\[" ","Sit 12 Run Lt Play 1","Sit 12 Run Lt Play 2","Sit 12 Run Lt Play 3","Sit 12 Run Lt Play 4","Sit 12 Run Lt Play 5","Sit 12 Run Lt Play 6","Sit 12 Run Lt Play 7","Sit 12 Run Lt Play 8","Sit 12 Run Lt Play 9","Sit 12 Run Lt Play 10","Sit 12 Run Lt Play 11","Sit 12 Run Lt Play 12","Sit 12 Run Lt Play 13","Sit 12 Run Lt Play 14","Sit 12 Run Lt Play 15","Sit 12 Run Rt Play 1","Sit 12 Run Rt Play 2","Sit 12 Run Rt Play 3","Sit 12 Run Rt Play 4","Sit 12 Run Rt Play 5","Sit 12 Run Rt Play 6","Sit 12 Run Rt Play 7","Sit 12 Run Rt Play 8","Sit 12 Run Rt Play 9","Sit 12 Run Rt Play 10","Sit 12 Run Rt Play 11","Sit 12 Run Rt Play 12","Sit 12 Run Rt Play 13","Sit 12 Run Rt Play 14","Sit 12 Run Rt Play 15","Sit 12 Pass Lt Play 1","Sit 12 Pass Lt Play 2","Sit 12 Pass Lt Play 3","Sit 12 Pass Lt Play 4","Sit 12 Pass Lt Play 5","Sit 12 Pass Lt Play 6","Sit 12 Pass Lt Play 7","Sit 12 Pass Lt Play 8","Sit 12 Pass Lt Play 9","Sit 12 Pass Lt Play 10","Sit 12 Pass Lt Play 11","Sit 12 Pass Lt Play 12","Sit 12 Pass Lt Play 13","Sit 12 Pass Lt Play 14","Sit 12 Pass Lt Play 15","Sit 12 Pass Rt Play 1","Sit 12 Pass Rt Play 2","Sit 12 Pass Rt Play 3","Sit 12 Pass Rt Play 4","Sit 12 Pass Rt Play 5","Sit 12 Pass Rt Play 6","Sit 12 Pass Rt Play 7","Sit 12 Pass Rt Play 8","Sit 12 Pass Rt Play 9","Sit 12 Pass Rt Play 10","Sit 12 Pass Rt Play 11","Sit 12 Pass Rt Play 12","Sit 12 Pass Rt Play 13","Sit 12 Pass Rt Play 14","Sit 12 Pass Rt Play 15"\]/g, collection12);
      addCollect = addCollect.replace(/\[" ","Sit 13 Run Lt Play 1","Sit 13 Run Lt Play 2","Sit 13 Run Lt Play 3","Sit 13 Run Lt Play 4","Sit 13 Run Lt Play 5","Sit 13 Run Lt Play 6","Sit 13 Run Lt Play 7","Sit 13 Run Lt Play 8","Sit 13 Run Lt Play 9","Sit 13 Run Lt Play 10","Sit 13 Run Lt Play 11","Sit 13 Run Lt Play 12","Sit 13 Run Lt Play 13","Sit 13 Run Lt Play 14","Sit 13 Run Lt Play 15","Sit 13 Run Rt Play 1","Sit 13 Run Rt Play 2","Sit 13 Run Rt Play 3","Sit 13 Run Rt Play 4","Sit 13 Run Rt Play 5","Sit 13 Run Rt Play 6","Sit 13 Run Rt Play 7","Sit 13 Run Rt Play 8","Sit 13 Run Rt Play 9","Sit 13 Run Rt Play 10","Sit 13 Run Rt Play 11","Sit 13 Run Rt Play 12","Sit 13 Run Rt Play 13","Sit 13 Run Rt Play 14","Sit 13 Run Rt Play 15","Sit 13 Pass Lt Play 1","Sit 13 Pass Lt Play 2","Sit 13 Pass Lt Play 3","Sit 13 Pass Lt Play 4","Sit 13 Pass Lt Play 5","Sit 13 Pass Lt Play 6","Sit 13 Pass Lt Play 7","Sit 13 Pass Lt Play 8","Sit 13 Pass Lt Play 9","Sit 13 Pass Lt Play 10","Sit 13 Pass Lt Play 11","Sit 13 Pass Lt Play 12","Sit 13 Pass Lt Play 13","Sit 13 Pass Lt Play 14","Sit 13 Pass Lt Play 15","Sit 13 Pass Rt Play 1","Sit 13 Pass Rt Play 2","Sit 13 Pass Rt Play 3","Sit 13 Pass Rt Play 4","Sit 13 Pass Rt Play 5","Sit 13 Pass Rt Play 6","Sit 13 Pass Rt Play 7","Sit 13 Pass Rt Play 8","Sit 13 Pass Rt Play 9","Sit 13 Pass Rt Play 10","Sit 13 Pass Rt Play 11","Sit 13 Pass Rt Play 12","Sit 13 Pass Rt Play 13","Sit 13 Pass Rt Play 14","Sit 13 Pass Rt Play 15"\]/g, collection13);
      addCollect = addCollect.replace(/\[" ","Sit 14 Lt Play 1","Sit 14 Lt Play 2","Sit 14 Lt Play 3","Sit 14 Lt Play 4","Sit 14 Lt Play 5","Sit 14 Lt Play 6","Sit 14 Lt Play 7","Sit 14 Lt Play 8","Sit 14 Lt Play 9","Sit 14 Lt Play 10","Sit 14 Lt Play 11","Sit 14 Lt Play 12","Sit 14 Lt Play 13","Sit 14 Lt Play 14","Sit 14 Lt Play 15","Sit 14 Lt Play 16","Sit 14 Lt Play 17","Sit 14 Lt Play 18","Sit 14 Lt Play 19","Sit 14 Lt Play 20","Sit 14 Rt Play 1","Sit 14 Rt Play 2","Sit 14 Rt Play 3","Sit 14 Rt Play 4","Sit 14 Rt Play 5","Sit 14 Rt Play 6","Sit 14 Rt Play 7","Sit 14 Rt Play 8","Sit 14 Rt Play 9","Sit 14 Rt Play 10","Sit 14 Rt Play 11","Sit 14 Rt Play 12","Sit 14 Rt Play 13","Sit 14 Rt Play 14","Sit 14 Rt Play 15","Sit 14 Rt Play 16","Sit 14 Rt Play 17","Sit 14 Rt Play 18","Sit 14 Rt Play 19","Sit 14 Rt Play 20"\]/g, collection14);
  var formatClass1 = JSON.parse(addCollect);

  var container = document.getElementById('custom-gamecall1'),
    hot;

  function removeClass(currentClasses, toRemove) {
    if (currentClasses) {
      var reg = new RegExp('(\\s|^)'+toRemove+'(\\s|$)');
      currentClasses=currentClasses.replace(reg,'');
    }
    return currentClasses;
  }

  hot = new Handsontable(container, {
    data: gdata1,
    minSpareCols: 0,
    minSpareRows: 0,
    maxRows: 55,
    renderAllRows: true,
    rowHeaders: true,
    colHeaders: true,
    colWidths: colWidths1,   
    manualColumnResize: true,
    manualRowResize: false,
    fillHandle: {
      autoInsertRow: false,
    },
    mergeCells: formatData1,
    cell: formatClass1,
    className: "myTable",
    contextMenuCopyPaste: true,     
    contextMenu: {
      items: {
        "copy": {name: "Copy"},
        "paste": {
          name: 'Paste',
          callback: function () {
              this.copyPaste.triggerPaste();
          }
        },
        "hsep2": "---------",
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
        "dropdowns":{
          name: "Dropdowns",
          submenu: {
            items: [
              {                
                name: $("#sit1_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit1Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:1"
              },
              {                
                name: $("#sit2_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit2Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:2"
              },
              {                
                name: $("#sit3_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit3Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:3"
              },
              {                
                name: $("#sit4_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit4Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:4"
              },
              {                
                name: $("#sit5_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit5Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:5"
              },
              {                
                name: $("#sit6_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit6Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:6"
              },     
              {                
                name: $("#sit7_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit7Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:7"
              },
              {                
                name: $("#sit8_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit8Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:8"
              },
              {                
                name: $("#sit9_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit9Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:9"
              },
              {                
                name: $("#sit10_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit10Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:10"
              },
              {                
                name: $("#sit11_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit11Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:11"
              },
              {                
                name: $("#sit12_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit12Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:12"
              },
              {                
                name: $("#sit13_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit13Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:13"
              },
              {                
                name: $("#sit14_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit14Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:14"
              }, 
              {                
                name: 'All Plays',
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
                      this.setCellMeta(row, col, 'source', allPlaysCollection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:15"
              },                                                                                                                                                                                 
              {  
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
                },
                key: "dropdowns:16"
              }
            ]
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
      $("#cell-class3").text(newX);
      var fFormat = JSON.stringify(this.mergeCells.mergedCellInfoCollection);
      $("#cell-format3").text(fFormat);
      $("#cell-class3").trigger("click")
    }     
  });

  //Re-renders table after context menu changes have been made
  $("#cell-class3").click(function() {
    var cClass3 = $("#cell-class3").text();
    var replaceClass3 = cClass3.replace(/'/g, '"');
    var formatClass3 = JSON.parse(replaceClass3);
    var cellFormat3 = $("#cell-format3").text();
    var replace3 = cellFormat3.replace(/'/g, '"');
    var formatData3 = JSON.parse(replace3);
    hot.updateSettings({ cell: formatClass3, mergeCells: formatData3 });
    hot.render();
  });

  //Page Two
  var setData2 = $("#data2").text();
  var replaceData2 = setData2.replace(/'/g, '"');
  var gdata2 = JSON.parse(replaceData2);

  var cellFormat2 = $("#cell-format2").text();
  var replace2 = cellFormat2.replace(/'/g, '"');
  var formatData2 = JSON.parse(replace2);

  var widths2 = $("#col-widths2").text();
  var colWidths2 = JSON.parse(widths2);

  var cClass2 = $("#cell-class2").text();
  var replaceClass2 = cClass2.replace(/'/g, '"');
  var addCollect2 = replaceClass2.replace(/\[" ","Sit 1 Lt Play 1","Sit 1 Lt Play 2","Sit 1 Lt Play 3","Sit 1 Lt Play 4","Sit 1 Lt Play 5","Sit 1 Lt Play 6","Sit 1 Lt Play 7","Sit 1 Lt Play 8","Sit 1 Lt Play 9","Sit 1 Lt Play 10","Sit 1 Lt Play 11","Sit 1 Lt Play 12","Sit 1 Lt Play 13","Sit 1 Lt Play 14","Sit 1 Lt Play 15","Sit 1 Lt Play 16","Sit 1 Lt Play 17","Sit 1 Lt Play 18","Sit 1 Lt Play 19","Sit 1 Lt Play 20","Sit 1 Rt Play 1","Sit 1 Rt Play 2","Sit 1 Rt Play 3","Sit 1 Rt Play 4","Sit 1 Rt Play 5","Sit 1 Rt Play 6","Sit 1 Rt Play 7","Sit 1 Rt Play 8","Sit 1 Rt Play 9","Sit 1 Rt Play 10","Sit 1 Rt Play 11","Sit 1 Rt Play 12","Sit 1 Rt Play 13","Sit 1 Rt Play 14","Sit 1 Rt Play 15","Sit 1 Rt Play 16","Sit 1 Rt Play 17","Sit 1 Rt Play 18","Sit 1 Rt Play 19","Sit 1 Rt Play 20","Sit 2 Run Lt Play 1","Sit 2 Run Lt Play 2","Sit 2 Run Lt Play 3","Sit 2 Run Lt Play 4","Sit 2 Run Lt Play 5","Sit 2 Run Lt Play 6","Sit 2 Run Lt Play 7","Sit 2 Run Lt Play 8","Sit 2 Run Lt Play 9","Sit 2 Run Lt Play 10","Sit 2 Run Lt Play 11","Sit 2 Run Lt Play 12","Sit 2 Run Lt Play 13","Sit 2 Run Lt Play 14","Sit 2 Run Lt Play 15","Sit 2 Run Rt Play 1","Sit 2 Run Rt Play 2","Sit 2 Run Rt Play 3","Sit 2 Run Rt Play 4","Sit 2 Run Rt Play 5","Sit 2 Run Rt Play 6","Sit 2 Run Rt Play 7","Sit 2 Run Rt Play 8","Sit 2 Run Rt Play 9","Sit 2 Run Rt Play 10","Sit 2 Run Rt Play 11","Sit 2 Run Rt Play 12","Sit 2 Run Rt Play 13","Sit 2 Run Rt Play 14","Sit 2 Run Rt Play 15","Sit 2 Pass Lt Play 1","Sit 2 Pass Lt Play 2","Sit 2 Pass Lt Play 3","Sit 2 Pass Lt Play 4","Sit 2 Pass Lt Play 5","Sit 2 Pass Lt Play 6","Sit 2 Pass Lt Play 7","Sit 2 Pass Lt Play 8","Sit 2 Pass Lt Play 9","Sit 2 Pass Lt Play 10","Sit 2 Pass Lt Play 11","Sit 2 Pass Lt Play 12","Sit 2 Pass Lt Play 13","Sit 2 Pass Lt Play 14","Sit 2 Pass Lt Play 15","Sit 2 Pass Rt Play 1","Sit 2 Pass Rt Play 2","Sit 2 Pass Rt Play 3","Sit 2 Pass Rt Play 4","Sit 2 Pass Rt Play 5","Sit 2 Pass Rt Play 6","Sit 2 Pass Rt Play 7","Sit 2 Pass Rt Play 8","Sit 2 Pass Rt Play 9","Sit 2 Pass Rt Play 10","Sit 2 Pass Rt Play 11","Sit 2 Pass Rt Play 12","Sit 2 Pass Rt Play 13","Sit 2 Pass Rt Play 14","Sit 2 Pass Rt Play 15","Sit 3 Run Lt Play 1","Sit 3 Run Lt Play 2","Sit 3 Run Lt Play 3","Sit 3 Run Lt Play 4","Sit 3 Run Lt Play 5","Sit 3 Run Lt Play 6","Sit 3 Run Lt Play 7","Sit 3 Run Lt Play 8","Sit 3 Run Lt Play 9","Sit 3 Run Lt Play 10","Sit 3 Run Lt Play 11","Sit 3 Run Lt Play 12","Sit 3 Run Lt Play 13","Sit 3 Run Lt Play 14","Sit 3 Run Lt Play 15","Sit 3 Run Rt Play 1","Sit 3 Run Rt Play 2","Sit 3 Run Rt Play 3","Sit 3 Run Rt Play 4","Sit 3 Run Rt Play 5","Sit 3 Run Rt Play 6","Sit 3 Run Rt Play 7","Sit 3 Run Rt Play 8","Sit 3 Run Rt Play 9","Sit 3 Run Rt Play 10","Sit 3 Run Rt Play 11","Sit 3 Run Rt Play 12","Sit 3 Run Rt Play 13","Sit 3 Run Rt Play 14","Sit 3 Run Rt Play 15","Sit 3 Pass Lt Play 1","Sit 3 Pass Lt Play 2","Sit 3 Pass Lt Play 3","Sit 3 Pass Lt Play 4","Sit 3 Pass Lt Play 5","Sit 3 Pass Lt Play 6","Sit 3 Pass Lt Play 7","Sit 3 Pass Lt Play 8","Sit 3 Pass Lt Play 9","Sit 3 Pass Lt Play 10","Sit 3 Pass Lt Play 11","Sit 3 Pass Lt Play 12","Sit 3 Pass Lt Play 13","Sit 3 Pass Lt Play 14","Sit 3 Pass Lt Play 15","Sit 3 Pass Rt Play 1","Sit 3 Pass Rt Play 2","Sit 3 Pass Rt Play 3","Sit 3 Pass Rt Play 4","Sit 3 Pass Rt Play 5","Sit 3 Pass Rt Play 6","Sit 3 Pass Rt Play 7","Sit 3 Pass Rt Play 8","Sit 3 Pass Rt Play 9","Sit 3 Pass Rt Play 10","Sit 3 Pass Rt Play 11","Sit 3 Pass Rt Play 12","Sit 3 Pass Rt Play 13","Sit 3 Pass Rt Play 14","Sit 3 Pass Rt Play 15","Sit 4 Run Lt Play 1","Sit 4 Run Lt Play 2","Sit 4 Run Lt Play 3","Sit 4 Run Lt Play 4","Sit 4 Run Lt Play 5","Sit 4 Run Lt Play 6","Sit 4 Run Lt Play 7","Sit 4 Run Lt Play 8","Sit 4 Run Lt Play 9","Sit 4 Run Lt Play 10","Sit 4 Run Lt Play 11","Sit 4 Run Lt Play 12","Sit 4 Run Lt Play 13","Sit 4 Run Lt Play 14","Sit 4 Run Lt Play 15","Sit 4 Run Rt Play 1","Sit 4 Run Rt Play 2","Sit 4 Run Rt Play 3","Sit 4 Run Rt Play 4","Sit 4 Run Rt Play 5","Sit 4 Run Rt Play 6","Sit 4 Run Rt Play 7","Sit 4 Run Rt Play 8","Sit 4 Run Rt Play 9","Sit 4 Run Rt Play 10","Sit 4 Run Rt Play 11","Sit 4 Run Rt Play 12","Sit 4 Run Rt Play 13","Sit 4 Run Rt Play 14","Sit 4 Run Rt Play 15","Sit 4 Pass Lt Play 1","Sit 4 Pass Lt Play 2","Sit 4 Pass Lt Play 3","Sit 4 Pass Lt Play 4","Sit 4 Pass Lt Play 5","Sit 4 Pass Lt Play 6","Sit 4 Pass Lt Play 7","Sit 4 Pass Lt Play 8","Sit 4 Pass Lt Play 9","Sit 4 Pass Lt Play 10","Sit 4 Pass Lt Play 11","Sit 4 Pass Lt Play 12","Sit 4 Pass Lt Play 13","Sit 4 Pass Lt Play 14","Sit 4 Pass Lt Play 15","Sit 4 Pass Rt Play 1","Sit 4 Pass Rt Play 2","Sit 4 Pass Rt Play 3","Sit 4 Pass Rt Play 4","Sit 4 Pass Rt Play 5","Sit 4 Pass Rt Play 6","Sit 4 Pass Rt Play 7","Sit 4 Pass Rt Play 8","Sit 4 Pass Rt Play 9","Sit 4 Pass Rt Play 10","Sit 4 Pass Rt Play 11","Sit 4 Pass Rt Play 12","Sit 4 Pass Rt Play 13","Sit 4 Pass Rt Play 14","Sit 4 Pass Rt Play 15","Sit 5 Run Lt Play 1","Sit 5 Run Lt Play 2","Sit 5 Run Lt Play 3","Sit 5 Run Lt Play 4","Sit 5 Run Lt Play 5","Sit 5 Run Lt Play 6","Sit 5 Run Lt Play 7","Sit 5 Run Lt Play 8","Sit 5 Run Lt Play 9","Sit 5 Run Lt Play 10","Sit 5 Run Lt Play 11","Sit 5 Run Lt Play 12","Sit 5 Run Lt Play 13","Sit 5 Run Lt Play 14","Sit 5 Run Lt Play 15","Sit 5 Run Rt Play 1","Sit 5 Run Rt Play 2","Sit 5 Run Rt Play 3","Sit 5 Run Rt Play 4","Sit 5 Run Rt Play 5","Sit 5 Run Rt Play 6","Sit 5 Run Rt Play 7","Sit 5 Run Rt Play 8","Sit 5 Run Rt Play 9","Sit 5 Run Rt Play 10","Sit 5 Run Rt Play 11","Sit 5 Run Rt Play 12","Sit 5 Run Rt Play 13","Sit 5 Run Rt Play 14","Sit 5 Run Rt Play 15","Sit 5 Pass Lt Play 1","Sit 5 Pass Lt Play 2","Sit 5 Pass Lt Play 3","Sit 5 Pass Lt Play 4","Sit 5 Pass Lt Play 5","Sit 5 Pass Lt Play 6","Sit 5 Pass Lt Play 7","Sit 5 Pass Lt Play 8","Sit 5 Pass Lt Play 9","Sit 5 Pass Lt Play 10","Sit 5 Pass Lt Play 11","Sit 5 Pass Lt Play 12","Sit 5 Pass Lt Play 13","Sit 5 Pass Lt Play 14","Sit 5 Pass Lt Play 15","Sit 5 Pass Rt Play 1","Sit 5 Pass Rt Play 2","Sit 5 Pass Rt Play 3","Sit 5 Pass Rt Play 4","Sit 5 Pass Rt Play 5","Sit 5 Pass Rt Play 6","Sit 5 Pass Rt Play 7","Sit 5 Pass Rt Play 8","Sit 5 Pass Rt Play 9","Sit 5 Pass Rt Play 10","Sit 5 Pass Rt Play 11","Sit 5 Pass Rt Play 12","Sit 5 Pass Rt Play 13","Sit 5 Pass Rt Play 14","Sit 5 Pass Rt Play 15","Sit 6 Run Lt Play 1","Sit 6 Run Lt Play 2","Sit 6 Run Lt Play 3","Sit 6 Run Lt Play 4","Sit 6 Run Lt Play 5","Sit 6 Run Lt Play 6","Sit 6 Run Lt Play 7","Sit 6 Run Lt Play 8","Sit 6 Run Lt Play 9","Sit 6 Run Lt Play 10","Sit 6 Run Lt Play 11","Sit 6 Run Lt Play 12","Sit 6 Run Lt Play 13","Sit 6 Run Lt Play 14","Sit 6 Run Lt Play 15","Sit 6 Run Rt Play 1","Sit 6 Run Rt Play 2","Sit 6 Run Rt Play 3","Sit 6 Run Rt Play 4","Sit 6 Run Rt Play 5","Sit 6 Run Rt Play 6","Sit 6 Run Rt Play 7","Sit 6 Run Rt Play 8","Sit 6 Run Rt Play 9","Sit 6 Run Rt Play 10","Sit 6 Run Rt Play 11","Sit 6 Run Rt Play 12","Sit 6 Run Rt Play 13","Sit 6 Run Rt Play 14","Sit 6 Run Rt Play 15","Sit 6 Pass Lt Play 1","Sit 6 Pass Lt Play 2","Sit 6 Pass Lt Play 3","Sit 6 Pass Lt Play 4","Sit 6 Pass Lt Play 5","Sit 6 Pass Lt Play 6","Sit 6 Pass Lt Play 7","Sit 6 Pass Lt Play 8","Sit 6 Pass Lt Play 9","Sit 6 Pass Lt Play 10","Sit 6 Pass Lt Play 11","Sit 6 Pass Lt Play 12","Sit 6 Pass Lt Play 13","Sit 6 Pass Lt Play 14","Sit 6 Pass Lt Play 15","Sit 6 Pass Rt Play 1","Sit 6 Pass Rt Play 2","Sit 6 Pass Rt Play 3","Sit 6 Pass Rt Play 4","Sit 6 Pass Rt Play 5","Sit 6 Pass Rt Play 6","Sit 6 Pass Rt Play 7","Sit 6 Pass Rt Play 8","Sit 6 Pass Rt Play 9","Sit 6 Pass Rt Play 10","Sit 6 Pass Rt Play 11","Sit 6 Pass Rt Play 12","Sit 6 Pass Rt Play 13","Sit 6 Pass Rt Play 14","Sit 6 Pass Rt Play 15","Sit 7 Run Lt Play 1","Sit 7 Run Lt Play 2","Sit 7 Run Lt Play 3","Sit 7 Run Lt Play 4","Sit 7 Run Lt Play 5","Sit 7 Run Lt Play 6","Sit 7 Run Lt Play 7","Sit 7 Run Lt Play 8","Sit 7 Run Lt Play 9","Sit 7 Run Lt Play 10","Sit 7 Run Lt Play 11","Sit 7 Run Lt Play 12","Sit 7 Run Lt Play 13","Sit 7 Run Lt Play 14","Sit 7 Run Lt Play 15","Sit 7 Run Rt Play 1","Sit 7 Run Rt Play 2","Sit 7 Run Rt Play 3","Sit 7 Run Rt Play 4","Sit 7 Run Rt Play 5","Sit 7 Run Rt Play 6","Sit 7 Run Rt Play 7","Sit 7 Run Rt Play 8","Sit 7 Run Rt Play 9","Sit 7 Run Rt Play 10","Sit 7 Run Rt Play 11","Sit 7 Run Rt Play 12","Sit 7 Run Rt Play 13","Sit 7 Run Rt Play 14","Sit 7 Run Rt Play 15","Sit 7 Pass Lt Play 1","Sit 7 Pass Lt Play 2","Sit 7 Pass Lt Play 3","Sit 7 Pass Lt Play 4","Sit 7 Pass Lt Play 5","Sit 7 Pass Lt Play 6","Sit 7 Pass Lt Play 7","Sit 7 Pass Lt Play 8","Sit 7 Pass Lt Play 9","Sit 7 Pass Lt Play 10","Sit 7 Pass Lt Play 11","Sit 7 Pass Lt Play 12","Sit 7 Pass Lt Play 13","Sit 7 Pass Lt Play 14","Sit 7 Pass Lt Play 15","Sit 7 Pass Rt Play 1","Sit 7 Pass Rt Play 2","Sit 7 Pass Rt Play 3","Sit 7 Pass Rt Play 4","Sit 7 Pass Rt Play 5","Sit 7 Pass Rt Play 6","Sit 7 Pass Rt Play 7","Sit 7 Pass Rt Play 8","Sit 7 Pass Rt Play 9","Sit 7 Pass Rt Play 10","Sit 7 Pass Rt Play 11","Sit 7 Pass Rt Play 12","Sit 7 Pass Rt Play 13","Sit 7 Pass Rt Play 14","Sit 7 Pass Rt Play 15","Sit 8 Run Lt Play 1","Sit 8 Run Lt Play 2","Sit 8 Run Lt Play 3","Sit 8 Run Lt Play 4","Sit 8 Run Lt Play 5","Sit 8 Run Lt Play 6","Sit 8 Run Lt Play 7","Sit 8 Run Lt Play 8","Sit 8 Run Lt Play 9","Sit 8 Run Lt Play 10","Sit 8 Run Lt Play 11","Sit 8 Run Lt Play 12","Sit 8 Run Lt Play 13","Sit 8 Run Lt Play 14","Sit 8 Run Lt Play 15","Sit 8 Run Rt Play 1","Sit 8 Run Rt Play 2","Sit 8 Run Rt Play 3","Sit 8 Run Rt Play 4","Sit 8 Run Rt Play 5","Sit 8 Run Rt Play 6","Sit 8 Run Rt Play 7","Sit 8 Run Rt Play 8","Sit 8 Run Rt Play 9","Sit 8 Run Rt Play 10","Sit 8 Run Rt Play 11","Sit 8 Run Rt Play 12","Sit 8 Run Rt Play 13","Sit 8 Run Rt Play 14","Sit 8 Run Rt Play 15","Sit 8 Pass Lt Play 1","Sit 8 Pass Lt Play 2","Sit 8 Pass Lt Play 3","Sit 8 Pass Lt Play 4","Sit 8 Pass Lt Play 5","Sit 8 Pass Lt Play 6","Sit 8 Pass Lt Play 7","Sit 8 Pass Lt Play 8","Sit 8 Pass Lt Play 9","Sit 8 Pass Lt Play 10","Sit 8 Pass Lt Play 11","Sit 8 Pass Lt Play 12","Sit 8 Pass Lt Play 13","Sit 8 Pass Lt Play 14","Sit 8 Pass Lt Play 15","Sit 8 Pass Rt Play 1","Sit 8 Pass Rt Play 2","Sit 8 Pass Rt Play 3","Sit 8 Pass Rt Play 4","Sit 8 Pass Rt Play 5","Sit 8 Pass Rt Play 6","Sit 8 Pass Rt Play 7","Sit 8 Pass Rt Play 8","Sit 8 Pass Rt Play 9","Sit 8 Pass Rt Play 10","Sit 8 Pass Rt Play 11","Sit 8 Pass Rt Play 12","Sit 8 Pass Rt Play 13","Sit 8 Pass Rt Play 14","Sit 8 Pass Rt Play 15","Sit 9 Run Lt Play 1","Sit 9 Run Lt Play 2","Sit 9 Run Lt Play 3","Sit 9 Run Lt Play 4","Sit 9 Run Lt Play 5","Sit 9 Run Lt Play 6","Sit 9 Run Lt Play 7","Sit 9 Run Lt Play 8","Sit 9 Run Lt Play 9","Sit 9 Run Lt Play 10","Sit 9 Run Lt Play 11","Sit 9 Run Lt Play 12","Sit 9 Run Lt Play 13","Sit 9 Run Lt Play 14","Sit 9 Run Lt Play 15","Sit 9 Run Rt Play 1","Sit 9 Run Rt Play 2","Sit 9 Run Rt Play 3","Sit 9 Run Rt Play 4","Sit 9 Run Rt Play 5","Sit 9 Run Rt Play 6","Sit 9 Run Rt Play 7","Sit 9 Run Rt Play 8","Sit 9 Run Rt Play 9","Sit 9 Run Rt Play 10","Sit 9 Run Rt Play 11","Sit 9 Run Rt Play 12","Sit 9 Run Rt Play 13","Sit 9 Run Rt Play 14","Sit 9 Run Rt Play 15","Sit 9 Pass Lt Play 1","Sit 9 Pass Lt Play 2","Sit 9 Pass Lt Play 3","Sit 9 Pass Lt Play 4","Sit 9 Pass Lt Play 5","Sit 9 Pass Lt Play 6","Sit 9 Pass Lt Play 7","Sit 9 Pass Lt Play 8","Sit 9 Pass Lt Play 9","Sit 9 Pass Lt Play 10","Sit 9 Pass Lt Play 11","Sit 9 Pass Lt Play 12","Sit 9 Pass Lt Play 13","Sit 9 Pass Lt Play 14","Sit 9 Pass Lt Play 15","Sit 9 Pass Rt Play 1","Sit 9 Pass Rt Play 2","Sit 9 Pass Rt Play 3","Sit 9 Pass Rt Play 4","Sit 9 Pass Rt Play 5","Sit 9 Pass Rt Play 6","Sit 9 Pass Rt Play 7","Sit 9 Pass Rt Play 8","Sit 9 Pass Rt Play 9","Sit 9 Pass Rt Play 10","Sit 9 Pass Rt Play 11","Sit 9 Pass Rt Play 12","Sit 9 Pass Rt Play 13","Sit 9 Pass Rt Play 14","Sit 9 Pass Rt Play 15","Sit 10 Run Lt Play 1","Sit 10 Run Lt Play 2","Sit 10 Run Lt Play 3","Sit 10 Run Lt Play 4","Sit 10 Run Lt Play 5","Sit 10 Run Lt Play 6","Sit 10 Run Lt Play 7","Sit 10 Run Lt Play 8","Sit 10 Run Lt Play 9","Sit 10 Run Lt Play 10","Sit 10 Run Lt Play 11","Sit 10 Run Lt Play 12","Sit 10 Run Lt Play 13","Sit 10 Run Lt Play 14","Sit 10 Run Lt Play 15","Sit 10 Run Rt Play 1","Sit 10 Run Rt Play 2","Sit 10 Run Rt Play 3","Sit 10 Run Rt Play 4","Sit 10 Run Rt Play 5","Sit 10 Run Rt Play 6","Sit 10 Run Rt Play 7","Sit 10 Run Rt Play 8","Sit 10 Run Rt Play 9","Sit 10 Run Rt Play 10","Sit 10 Run Rt Play 11","Sit 10 Run Rt Play 12","Sit 10 Run Rt Play 13","Sit 10 Run Rt Play 14","Sit 10 Run Rt Play 15","Sit 10 Pass Lt Play 1","Sit 10 Pass Lt Play 2","Sit 10 Pass Lt Play 3","Sit 10 Pass Lt Play 4","Sit 10 Pass Lt Play 5","Sit 10 Pass Lt Play 6","Sit 10 Pass Lt Play 7","Sit 10 Pass Lt Play 8","Sit 10 Pass Lt Play 9","Sit 10 Pass Lt Play 10","Sit 10 Pass Lt Play 11","Sit 10 Pass Lt Play 12","Sit 10 Pass Lt Play 13","Sit 10 Pass Lt Play 14","Sit 10 Pass Lt Play 15","Sit 10 Pass Rt Play 1","Sit 10 Pass Rt Play 2","Sit 10 Pass Rt Play 3","Sit 10 Pass Rt Play 4","Sit 10 Pass Rt Play 5","Sit 10 Pass Rt Play 6","Sit 10 Pass Rt Play 7","Sit 10 Pass Rt Play 8","Sit 10 Pass Rt Play 9","Sit 10 Pass Rt Play 10","Sit 10 Pass Rt Play 11","Sit 10 Pass Rt Play 12","Sit 10 Pass Rt Play 13","Sit 10 Pass Rt Play 14","Sit 10 Pass Rt Play 15","Sit 11 Run Lt Play 1","Sit 11 Run Lt Play 2","Sit 11 Run Lt Play 3","Sit 11 Run Lt Play 4","Sit 11 Run Lt Play 5","Sit 11 Run Lt Play 6","Sit 11 Run Lt Play 7","Sit 11 Run Lt Play 8","Sit 11 Run Lt Play 9","Sit 11 Run Lt Play 10","Sit 11 Run Lt Play 11","Sit 11 Run Lt Play 12","Sit 11 Run Lt Play 13","Sit 11 Run Lt Play 14","Sit 11 Run Lt Play 15","Sit 11 Run Rt Play 1","Sit 11 Run Rt Play 2","Sit 11 Run Rt Play 3","Sit 11 Run Rt Play 4","Sit 11 Run Rt Play 5","Sit 11 Run Rt Play 6","Sit 11 Run Rt Play 7","Sit 11 Run Rt Play 8","Sit 11 Run Rt Play 9","Sit 11 Run Rt Play 10","Sit 11 Run Rt Play 11","Sit 11 Run Rt Play 12","Sit 11 Run Rt Play 13","Sit 11 Run Rt Play 14","Sit 11 Run Rt Play 15","Sit 11 Pass Lt Play 1","Sit 11 Pass Lt Play 2","Sit 11 Pass Lt Play 3","Sit 11 Pass Lt Play 4","Sit 11 Pass Lt Play 5","Sit 11 Pass Lt Play 6","Sit 11 Pass Lt Play 7","Sit 11 Pass Lt Play 8","Sit 11 Pass Lt Play 9","Sit 11 Pass Lt Play 10","Sit 11 Pass Lt Play 11","Sit 11 Pass Lt Play 12","Sit 11 Pass Lt Play 13","Sit 11 Pass Lt Play 14","Sit 11 Pass Lt Play 15","Sit 11 Pass Rt Play 1","Sit 11 Pass Rt Play 2","Sit 11 Pass Rt Play 3","Sit 11 Pass Rt Play 4","Sit 11 Pass Rt Play 5","Sit 11 Pass Rt Play 6","Sit 11 Pass Rt Play 7","Sit 11 Pass Rt Play 8","Sit 11 Pass Rt Play 9","Sit 11 Pass Rt Play 10","Sit 11 Pass Rt Play 11","Sit 11 Pass Rt Play 12","Sit 11 Pass Rt Play 13","Sit 11 Pass Rt Play 14","Sit 11 Pass Rt Play 15","Sit 12 Run Lt Play 1","Sit 12 Run Lt Play 2","Sit 12 Run Lt Play 3","Sit 12 Run Lt Play 4","Sit 12 Run Lt Play 5","Sit 12 Run Lt Play 6","Sit 12 Run Lt Play 7","Sit 12 Run Lt Play 8","Sit 12 Run Lt Play 9","Sit 12 Run Lt Play 10","Sit 12 Run Lt Play 11","Sit 12 Run Lt Play 12","Sit 12 Run Lt Play 13","Sit 12 Run Lt Play 14","Sit 12 Run Lt Play 15","Sit 12 Run Rt Play 1","Sit 12 Run Rt Play 2","Sit 12 Run Rt Play 3","Sit 12 Run Rt Play 4","Sit 12 Run Rt Play 5","Sit 12 Run Rt Play 6","Sit 12 Run Rt Play 7","Sit 12 Run Rt Play 8","Sit 12 Run Rt Play 9","Sit 12 Run Rt Play 10","Sit 12 Run Rt Play 11","Sit 12 Run Rt Play 12","Sit 12 Run Rt Play 13","Sit 12 Run Rt Play 14","Sit 12 Run Rt Play 15","Sit 12 Pass Lt Play 1","Sit 12 Pass Lt Play 2","Sit 12 Pass Lt Play 3","Sit 12 Pass Lt Play 4","Sit 12 Pass Lt Play 5","Sit 12 Pass Lt Play 6","Sit 12 Pass Lt Play 7","Sit 12 Pass Lt Play 8","Sit 12 Pass Lt Play 9","Sit 12 Pass Lt Play 10","Sit 12 Pass Lt Play 11","Sit 12 Pass Lt Play 12","Sit 12 Pass Lt Play 13","Sit 12 Pass Lt Play 14","Sit 12 Pass Lt Play 15","Sit 12 Pass Rt Play 1","Sit 12 Pass Rt Play 2","Sit 12 Pass Rt Play 3","Sit 12 Pass Rt Play 4","Sit 12 Pass Rt Play 5","Sit 12 Pass Rt Play 6","Sit 12 Pass Rt Play 7","Sit 12 Pass Rt Play 8","Sit 12 Pass Rt Play 9","Sit 12 Pass Rt Play 10","Sit 12 Pass Rt Play 11","Sit 12 Pass Rt Play 12","Sit 12 Pass Rt Play 13","Sit 12 Pass Rt Play 14","Sit 12 Pass Rt Play 15","Sit 13 Run Lt Play 1","Sit 13 Run Lt Play 2","Sit 13 Run Lt Play 3","Sit 13 Run Lt Play 4","Sit 13 Run Lt Play 5","Sit 13 Run Lt Play 6","Sit 13 Run Lt Play 7","Sit 13 Run Lt Play 8","Sit 13 Run Lt Play 9","Sit 13 Run Lt Play 10","Sit 13 Run Lt Play 11","Sit 13 Run Lt Play 12","Sit 13 Run Lt Play 13","Sit 13 Run Lt Play 14","Sit 13 Run Lt Play 15","Sit 13 Run Rt Play 1","Sit 13 Run Rt Play 2","Sit 13 Run Rt Play 3","Sit 13 Run Rt Play 4","Sit 13 Run Rt Play 5","Sit 13 Run Rt Play 6","Sit 13 Run Rt Play 7","Sit 13 Run Rt Play 8","Sit 13 Run Rt Play 9","Sit 13 Run Rt Play 10","Sit 13 Run Rt Play 11","Sit 13 Run Rt Play 12","Sit 13 Run Rt Play 13","Sit 13 Run Rt Play 14","Sit 13 Run Rt Play 15","Sit 13 Pass Lt Play 1","Sit 13 Pass Lt Play 2","Sit 13 Pass Lt Play 3","Sit 13 Pass Lt Play 4","Sit 13 Pass Lt Play 5","Sit 13 Pass Lt Play 6","Sit 13 Pass Lt Play 7","Sit 13 Pass Lt Play 8","Sit 13 Pass Lt Play 9","Sit 13 Pass Lt Play 10","Sit 13 Pass Lt Play 11","Sit 13 Pass Lt Play 12","Sit 13 Pass Lt Play 13","Sit 13 Pass Lt Play 14","Sit 13 Pass Lt Play 15","Sit 13 Pass Rt Play 1","Sit 13 Pass Rt Play 2","Sit 13 Pass Rt Play 3","Sit 13 Pass Rt Play 4","Sit 13 Pass Rt Play 5","Sit 13 Pass Rt Play 6","Sit 13 Pass Rt Play 7","Sit 13 Pass Rt Play 8","Sit 13 Pass Rt Play 9","Sit 13 Pass Rt Play 10","Sit 13 Pass Rt Play 11","Sit 13 Pass Rt Play 12","Sit 13 Pass Rt Play 13","Sit 13 Pass Rt Play 14","Sit 13 Pass Rt Play 15","Sit 14 Lt Play 1","Sit 14 Lt Play 2","Sit 14 Lt Play 3","Sit 14 Lt Play 4","Sit 14 Lt Play 5","Sit 14 Lt Play 6","Sit 14 Lt Play 7","Sit 14 Lt Play 8","Sit 14 Lt Play 9","Sit 14 Lt Play 10","Sit 14 Lt Play 11","Sit 14 Lt Play 12","Sit 14 Lt Play 13","Sit 14 Lt Play 14","Sit 14 Lt Play 15","Sit 14 Lt Play 16","Sit 14 Lt Play 17","Sit 14 Lt Play 18","Sit 14 Lt Play 19","Sit 14 Lt Play 20","Sit 14 Rt Play 1","Sit 14 Rt Play 2","Sit 14 Rt Play 3","Sit 14 Rt Play 4","Sit 14 Rt Play 5","Sit 14 Rt Play 6","Sit 14 Rt Play 7","Sit 14 Rt Play 8","Sit 14 Rt Play 9","Sit 14 Rt Play 10","Sit 14 Rt Play 11","Sit 14 Rt Play 12","Sit 14 Rt Play 13","Sit 14 Rt Play 14","Sit 14 Rt Play 15","Sit 14 Rt Play 16","Sit 14 Rt Play 17","Sit 14 Rt Play 18","Sit 14 Rt Play 19","Sit 14 Rt Play 20"\]/g, collection);
      addCollect2 = addCollect2.replace(/\[" ","Sit 1 Lt Play 1","Sit 1 Lt Play 2","Sit 1 Lt Play 3","Sit 1 Lt Play 4","Sit 1 Lt Play 5","Sit 1 Lt Play 6","Sit 1 Lt Play 7","Sit 1 Lt Play 8","Sit 1 Lt Play 9","Sit 1 Lt Play 10","Sit 1 Lt Play 11","Sit 1 Lt Play 12","Sit 1 Lt Play 13","Sit 1 Lt Play 14","Sit 1 Lt Play 15","Sit 1 Lt Play 16","Sit 1 Lt Play 17","Sit 1 Lt Play 18","Sit 1 Lt Play 19","Sit 1 Lt Play 20","Sit 1 Rt Play 1","Sit 1 Rt Play 2","Sit 1 Rt Play 3","Sit 1 Rt Play 4","Sit 1 Rt Play 5","Sit 1 Rt Play 6","Sit 1 Rt Play 7","Sit 1 Rt Play 8","Sit 1 Rt Play 9","Sit 1 Rt Play 10","Sit 1 Rt Play 11","Sit 1 Rt Play 12","Sit 1 Rt Play 13","Sit 1 Rt Play 14","Sit 1 Rt Play 15","Sit 1 Rt Play 16","Sit 1 Rt Play 17","Sit 1 Rt Play 18","Sit 1 Rt Play 19","Sit 1 Rt Play 20"\]/g, collection1); 
      addCollect2 = addCollect2.replace(/\[" ","Sit 2 Run Lt Play 1","Sit 2 Run Lt Play 2","Sit 2 Run Lt Play 3","Sit 2 Run Lt Play 4","Sit 2 Run Lt Play 5","Sit 2 Run Lt Play 6","Sit 2 Run Lt Play 7","Sit 2 Run Lt Play 8","Sit 2 Run Lt Play 9","Sit 2 Run Lt Play 10","Sit 2 Run Lt Play 11","Sit 2 Run Lt Play 12","Sit 2 Run Lt Play 13","Sit 2 Run Lt Play 14","Sit 2 Run Lt Play 15","Sit 2 Run Rt Play 1","Sit 2 Run Rt Play 2","Sit 2 Run Rt Play 3","Sit 2 Run Rt Play 4","Sit 2 Run Rt Play 5","Sit 2 Run Rt Play 6","Sit 2 Run Rt Play 7","Sit 2 Run Rt Play 8","Sit 2 Run Rt Play 9","Sit 2 Run Rt Play 10","Sit 2 Run Rt Play 11","Sit 2 Run Rt Play 12","Sit 2 Run Rt Play 13","Sit 2 Run Rt Play 14","Sit 2 Run Rt Play 15","Sit 2 Pass Lt Play 1","Sit 2 Pass Lt Play 2","Sit 2 Pass Lt Play 3","Sit 2 Pass Lt Play 4","Sit 2 Pass Lt Play 5","Sit 2 Pass Lt Play 6","Sit 2 Pass Lt Play 7","Sit 2 Pass Lt Play 8","Sit 2 Pass Lt Play 9","Sit 2 Pass Lt Play 10","Sit 2 Pass Lt Play 11","Sit 2 Pass Lt Play 12","Sit 2 Pass Lt Play 13","Sit 2 Pass Lt Play 14","Sit 2 Pass Lt Play 15","Sit 2 Pass Rt Play 1","Sit 2 Pass Rt Play 2","Sit 2 Pass Rt Play 3","Sit 2 Pass Rt Play 4","Sit 2 Pass Rt Play 5","Sit 2 Pass Rt Play 6","Sit 2 Pass Rt Play 7","Sit 2 Pass Rt Play 8","Sit 2 Pass Rt Play 9","Sit 2 Pass Rt Play 10","Sit 2 Pass Rt Play 11","Sit 2 Pass Rt Play 12","Sit 2 Pass Rt Play 13","Sit 2 Pass Rt Play 14","Sit 2 Pass Rt Play 15"\]/g, collection2); 
      addCollect2 = addCollect2.replace(/\[" ","Sit 3 Run Lt Play 1","Sit 3 Run Lt Play 2","Sit 3 Run Lt Play 3","Sit 3 Run Lt Play 4","Sit 3 Run Lt Play 5","Sit 3 Run Lt Play 6","Sit 3 Run Lt Play 7","Sit 3 Run Lt Play 8","Sit 3 Run Lt Play 9","Sit 3 Run Lt Play 10","Sit 3 Run Lt Play 11","Sit 3 Run Lt Play 12","Sit 3 Run Lt Play 13","Sit 3 Run Lt Play 14","Sit 3 Run Lt Play 15","Sit 3 Run Rt Play 1","Sit 3 Run Rt Play 2","Sit 3 Run Rt Play 3","Sit 3 Run Rt Play 4","Sit 3 Run Rt Play 5","Sit 3 Run Rt Play 6","Sit 3 Run Rt Play 7","Sit 3 Run Rt Play 8","Sit 3 Run Rt Play 9","Sit 3 Run Rt Play 10","Sit 3 Run Rt Play 11","Sit 3 Run Rt Play 12","Sit 3 Run Rt Play 13","Sit 3 Run Rt Play 14","Sit 3 Run Rt Play 15","Sit 3 Pass Lt Play 1","Sit 3 Pass Lt Play 2","Sit 3 Pass Lt Play 3","Sit 3 Pass Lt Play 4","Sit 3 Pass Lt Play 5","Sit 3 Pass Lt Play 6","Sit 3 Pass Lt Play 7","Sit 3 Pass Lt Play 8","Sit 3 Pass Lt Play 9","Sit 3 Pass Lt Play 10","Sit 3 Pass Lt Play 11","Sit 3 Pass Lt Play 12","Sit 3 Pass Lt Play 13","Sit 3 Pass Lt Play 14","Sit 3 Pass Lt Play 15","Sit 3 Pass Rt Play 1","Sit 3 Pass Rt Play 2","Sit 3 Pass Rt Play 3","Sit 3 Pass Rt Play 4","Sit 3 Pass Rt Play 5","Sit 3 Pass Rt Play 6","Sit 3 Pass Rt Play 7","Sit 3 Pass Rt Play 8","Sit 3 Pass Rt Play 9","Sit 3 Pass Rt Play 10","Sit 3 Pass Rt Play 11","Sit 3 Pass Rt Play 12","Sit 3 Pass Rt Play 13","Sit 3 Pass Rt Play 14","Sit 3 Pass Rt Play 15"\]/g, collection3); 
      addCollect2 = addCollect2.replace(/\[" ","Sit 4 Run Lt Play 1","Sit 4 Run Lt Play 2","Sit 4 Run Lt Play 3","Sit 4 Run Lt Play 4","Sit 4 Run Lt Play 5","Sit 4 Run Lt Play 6","Sit 4 Run Lt Play 7","Sit 4 Run Lt Play 8","Sit 4 Run Lt Play 9","Sit 4 Run Lt Play 10","Sit 4 Run Lt Play 11","Sit 4 Run Lt Play 12","Sit 4 Run Lt Play 13","Sit 4 Run Lt Play 14","Sit 4 Run Lt Play 15","Sit 4 Run Rt Play 1","Sit 4 Run Rt Play 2","Sit 4 Run Rt Play 3","Sit 4 Run Rt Play 4","Sit 4 Run Rt Play 5","Sit 4 Run Rt Play 6","Sit 4 Run Rt Play 7","Sit 4 Run Rt Play 8","Sit 4 Run Rt Play 9","Sit 4 Run Rt Play 10","Sit 4 Run Rt Play 11","Sit 4 Run Rt Play 12","Sit 4 Run Rt Play 13","Sit 4 Run Rt Play 14","Sit 4 Run Rt Play 15","Sit 4 Pass Lt Play 1","Sit 4 Pass Lt Play 2","Sit 4 Pass Lt Play 3","Sit 4 Pass Lt Play 4","Sit 4 Pass Lt Play 5","Sit 4 Pass Lt Play 6","Sit 4 Pass Lt Play 7","Sit 4 Pass Lt Play 8","Sit 4 Pass Lt Play 9","Sit 4 Pass Lt Play 10","Sit 4 Pass Lt Play 11","Sit 4 Pass Lt Play 12","Sit 4 Pass Lt Play 13","Sit 4 Pass Lt Play 14","Sit 4 Pass Lt Play 15","Sit 4 Pass Rt Play 1","Sit 4 Pass Rt Play 2","Sit 4 Pass Rt Play 3","Sit 4 Pass Rt Play 4","Sit 4 Pass Rt Play 5","Sit 4 Pass Rt Play 6","Sit 4 Pass Rt Play 7","Sit 4 Pass Rt Play 8","Sit 4 Pass Rt Play 9","Sit 4 Pass Rt Play 10","Sit 4 Pass Rt Play 11","Sit 4 Pass Rt Play 12","Sit 4 Pass Rt Play 13","Sit 4 Pass Rt Play 14","Sit 4 Pass Rt Play 15"\]/g, collection4); 
      addCollect2 = addCollect2.replace(/\[" ","Sit 5 Run Lt Play 1","Sit 5 Run Lt Play 2","Sit 5 Run Lt Play 3","Sit 5 Run Lt Play 4","Sit 5 Run Lt Play 5","Sit 5 Run Lt Play 6","Sit 5 Run Lt Play 7","Sit 5 Run Lt Play 8","Sit 5 Run Lt Play 9","Sit 5 Run Lt Play 10","Sit 5 Run Lt Play 11","Sit 5 Run Lt Play 12","Sit 5 Run Lt Play 13","Sit 5 Run Lt Play 14","Sit 5 Run Lt Play 15","Sit 5 Run Rt Play 1","Sit 5 Run Rt Play 2","Sit 5 Run Rt Play 3","Sit 5 Run Rt Play 4","Sit 5 Run Rt Play 5","Sit 5 Run Rt Play 6","Sit 5 Run Rt Play 7","Sit 5 Run Rt Play 8","Sit 5 Run Rt Play 9","Sit 5 Run Rt Play 10","Sit 5 Run Rt Play 11","Sit 5 Run Rt Play 12","Sit 5 Run Rt Play 13","Sit 5 Run Rt Play 14","Sit 5 Run Rt Play 15","Sit 5 Pass Lt Play 1","Sit 5 Pass Lt Play 2","Sit 5 Pass Lt Play 3","Sit 5 Pass Lt Play 4","Sit 5 Pass Lt Play 5","Sit 5 Pass Lt Play 6","Sit 5 Pass Lt Play 7","Sit 5 Pass Lt Play 8","Sit 5 Pass Lt Play 9","Sit 5 Pass Lt Play 10","Sit 5 Pass Lt Play 11","Sit 5 Pass Lt Play 12","Sit 5 Pass Lt Play 13","Sit 5 Pass Lt Play 14","Sit 5 Pass Lt Play 15","Sit 5 Pass Rt Play 1","Sit 5 Pass Rt Play 2","Sit 5 Pass Rt Play 3","Sit 5 Pass Rt Play 4","Sit 5 Pass Rt Play 5","Sit 5 Pass Rt Play 6","Sit 5 Pass Rt Play 7","Sit 5 Pass Rt Play 8","Sit 5 Pass Rt Play 9","Sit 5 Pass Rt Play 10","Sit 5 Pass Rt Play 11","Sit 5 Pass Rt Play 12","Sit 5 Pass Rt Play 13","Sit 5 Pass Rt Play 14","Sit 5 Pass Rt Play 15"\]/g, collection5); 
      addCollect2 = addCollect2.replace(/\[" ","Sit 6 Run Lt Play 1","Sit 6 Run Lt Play 2","Sit 6 Run Lt Play 3","Sit 6 Run Lt Play 4","Sit 6 Run Lt Play 5","Sit 6 Run Lt Play 6","Sit 6 Run Lt Play 7","Sit 6 Run Lt Play 8","Sit 6 Run Lt Play 9","Sit 6 Run Lt Play 10","Sit 6 Run Lt Play 11","Sit 6 Run Lt Play 12","Sit 6 Run Lt Play 13","Sit 6 Run Lt Play 14","Sit 6 Run Lt Play 15","Sit 6 Run Rt Play 1","Sit 6 Run Rt Play 2","Sit 6 Run Rt Play 3","Sit 6 Run Rt Play 4","Sit 6 Run Rt Play 5","Sit 6 Run Rt Play 6","Sit 6 Run Rt Play 7","Sit 6 Run Rt Play 8","Sit 6 Run Rt Play 9","Sit 6 Run Rt Play 10","Sit 6 Run Rt Play 11","Sit 6 Run Rt Play 12","Sit 6 Run Rt Play 13","Sit 6 Run Rt Play 14","Sit 6 Run Rt Play 15","Sit 6 Pass Lt Play 1","Sit 6 Pass Lt Play 2","Sit 6 Pass Lt Play 3","Sit 6 Pass Lt Play 4","Sit 6 Pass Lt Play 5","Sit 6 Pass Lt Play 6","Sit 6 Pass Lt Play 7","Sit 6 Pass Lt Play 8","Sit 6 Pass Lt Play 9","Sit 6 Pass Lt Play 10","Sit 6 Pass Lt Play 11","Sit 6 Pass Lt Play 12","Sit 6 Pass Lt Play 13","Sit 6 Pass Lt Play 14","Sit 6 Pass Lt Play 15","Sit 6 Pass Rt Play 1","Sit 6 Pass Rt Play 2","Sit 6 Pass Rt Play 3","Sit 6 Pass Rt Play 4","Sit 6 Pass Rt Play 5","Sit 6 Pass Rt Play 6","Sit 6 Pass Rt Play 7","Sit 6 Pass Rt Play 8","Sit 6 Pass Rt Play 9","Sit 6 Pass Rt Play 10","Sit 6 Pass Rt Play 11","Sit 6 Pass Rt Play 12","Sit 6 Pass Rt Play 13","Sit 6 Pass Rt Play 14","Sit 6 Pass Rt Play 15"\]/g, collection6); 
      addCollect2 = addCollect2.replace(/\[" ","Sit 7 Run Lt Play 1","Sit 7 Run Lt Play 2","Sit 7 Run Lt Play 3","Sit 7 Run Lt Play 4","Sit 7 Run Lt Play 5","Sit 7 Run Lt Play 6","Sit 7 Run Lt Play 7","Sit 7 Run Lt Play 8","Sit 7 Run Lt Play 9","Sit 7 Run Lt Play 10","Sit 7 Run Lt Play 11","Sit 7 Run Lt Play 12","Sit 7 Run Lt Play 13","Sit 7 Run Lt Play 14","Sit 7 Run Lt Play 15","Sit 7 Run Rt Play 1","Sit 7 Run Rt Play 2","Sit 7 Run Rt Play 3","Sit 7 Run Rt Play 4","Sit 7 Run Rt Play 5","Sit 7 Run Rt Play 6","Sit 7 Run Rt Play 7","Sit 7 Run Rt Play 8","Sit 7 Run Rt Play 9","Sit 7 Run Rt Play 10","Sit 7 Run Rt Play 11","Sit 7 Run Rt Play 12","Sit 7 Run Rt Play 13","Sit 7 Run Rt Play 14","Sit 7 Run Rt Play 15","Sit 7 Pass Lt Play 1","Sit 7 Pass Lt Play 2","Sit 7 Pass Lt Play 3","Sit 7 Pass Lt Play 4","Sit 7 Pass Lt Play 5","Sit 7 Pass Lt Play 6","Sit 7 Pass Lt Play 7","Sit 7 Pass Lt Play 8","Sit 7 Pass Lt Play 9","Sit 7 Pass Lt Play 10","Sit 7 Pass Lt Play 11","Sit 7 Pass Lt Play 12","Sit 7 Pass Lt Play 13","Sit 7 Pass Lt Play 14","Sit 7 Pass Lt Play 15","Sit 7 Pass Rt Play 1","Sit 7 Pass Rt Play 2","Sit 7 Pass Rt Play 3","Sit 7 Pass Rt Play 4","Sit 7 Pass Rt Play 5","Sit 7 Pass Rt Play 6","Sit 7 Pass Rt Play 7","Sit 7 Pass Rt Play 8","Sit 7 Pass Rt Play 9","Sit 7 Pass Rt Play 10","Sit 7 Pass Rt Play 11","Sit 7 Pass Rt Play 12","Sit 7 Pass Rt Play 13","Sit 7 Pass Rt Play 14","Sit 7 Pass Rt Play 15"\]/g, collection7);
      addCollect2 = addCollect2.replace(/\[" ","Sit 8 Run Lt Play 1","Sit 8 Run Lt Play 2","Sit 8 Run Lt Play 3","Sit 8 Run Lt Play 4","Sit 8 Run Lt Play 5","Sit 8 Run Lt Play 6","Sit 8 Run Lt Play 7","Sit 8 Run Lt Play 8","Sit 8 Run Lt Play 9","Sit 8 Run Lt Play 10","Sit 8 Run Lt Play 11","Sit 8 Run Lt Play 12","Sit 8 Run Lt Play 13","Sit 8 Run Lt Play 14","Sit 8 Run Lt Play 15","Sit 8 Run Rt Play 1","Sit 8 Run Rt Play 2","Sit 8 Run Rt Play 3","Sit 8 Run Rt Play 4","Sit 8 Run Rt Play 5","Sit 8 Run Rt Play 6","Sit 8 Run Rt Play 7","Sit 8 Run Rt Play 8","Sit 8 Run Rt Play 9","Sit 8 Run Rt Play 10","Sit 8 Run Rt Play 11","Sit 8 Run Rt Play 12","Sit 8 Run Rt Play 13","Sit 8 Run Rt Play 14","Sit 8 Run Rt Play 15","Sit 8 Pass Lt Play 1","Sit 8 Pass Lt Play 2","Sit 8 Pass Lt Play 3","Sit 8 Pass Lt Play 4","Sit 8 Pass Lt Play 5","Sit 8 Pass Lt Play 6","Sit 8 Pass Lt Play 7","Sit 8 Pass Lt Play 8","Sit 8 Pass Lt Play 9","Sit 8 Pass Lt Play 10","Sit 8 Pass Lt Play 11","Sit 8 Pass Lt Play 12","Sit 8 Pass Lt Play 13","Sit 8 Pass Lt Play 14","Sit 8 Pass Lt Play 15","Sit 8 Pass Rt Play 1","Sit 8 Pass Rt Play 2","Sit 8 Pass Rt Play 3","Sit 8 Pass Rt Play 4","Sit 8 Pass Rt Play 5","Sit 8 Pass Rt Play 6","Sit 8 Pass Rt Play 7","Sit 8 Pass Rt Play 8","Sit 8 Pass Rt Play 9","Sit 8 Pass Rt Play 10","Sit 8 Pass Rt Play 11","Sit 8 Pass Rt Play 12","Sit 8 Pass Rt Play 13","Sit 8 Pass Rt Play 14","Sit 8 Pass Rt Play 15"\]/g, collection8);
      addCollect2 = addCollect2.replace(/\[" ","Sit 9 Run Lt Play 1","Sit 9 Run Lt Play 2","Sit 9 Run Lt Play 3","Sit 9 Run Lt Play 4","Sit 9 Run Lt Play 5","Sit 9 Run Lt Play 6","Sit 9 Run Lt Play 7","Sit 9 Run Lt Play 8","Sit 9 Run Lt Play 9","Sit 9 Run Lt Play 10","Sit 9 Run Lt Play 11","Sit 9 Run Lt Play 12","Sit 9 Run Lt Play 13","Sit 9 Run Lt Play 14","Sit 9 Run Lt Play 15","Sit 9 Run Rt Play 1","Sit 9 Run Rt Play 2","Sit 9 Run Rt Play 3","Sit 9 Run Rt Play 4","Sit 9 Run Rt Play 5","Sit 9 Run Rt Play 6","Sit 9 Run Rt Play 7","Sit 9 Run Rt Play 8","Sit 9 Run Rt Play 9","Sit 9 Run Rt Play 10","Sit 9 Run Rt Play 11","Sit 9 Run Rt Play 12","Sit 9 Run Rt Play 13","Sit 9 Run Rt Play 14","Sit 9 Run Rt Play 15","Sit 9 Pass Lt Play 1","Sit 9 Pass Lt Play 2","Sit 9 Pass Lt Play 3","Sit 9 Pass Lt Play 4","Sit 9 Pass Lt Play 5","Sit 9 Pass Lt Play 6","Sit 9 Pass Lt Play 7","Sit 9 Pass Lt Play 8","Sit 9 Pass Lt Play 9","Sit 9 Pass Lt Play 10","Sit 9 Pass Lt Play 11","Sit 9 Pass Lt Play 12","Sit 9 Pass Lt Play 13","Sit 9 Pass Lt Play 14","Sit 9 Pass Lt Play 15","Sit 9 Pass Rt Play 1","Sit 9 Pass Rt Play 2","Sit 9 Pass Rt Play 3","Sit 9 Pass Rt Play 4","Sit 9 Pass Rt Play 5","Sit 9 Pass Rt Play 6","Sit 9 Pass Rt Play 7","Sit 9 Pass Rt Play 8","Sit 9 Pass Rt Play 9","Sit 9 Pass Rt Play 10","Sit 9 Pass Rt Play 11","Sit 9 Pass Rt Play 12","Sit 9 Pass Rt Play 13","Sit 9 Pass Rt Play 14","Sit 9 Pass Rt Play 15"\]/g, collection9); 
      addCollect2 = addCollect2.replace(/\[" ","Sit 10 Run Lt Play 1","Sit 10 Run Lt Play 2","Sit 10 Run Lt Play 3","Sit 10 Run Lt Play 4","Sit 10 Run Lt Play 5","Sit 10 Run Lt Play 6","Sit 10 Run Lt Play 7","Sit 10 Run Lt Play 8","Sit 10 Run Lt Play 9","Sit 10 Run Lt Play 10","Sit 10 Run Lt Play 11","Sit 10 Run Lt Play 12","Sit 10 Run Lt Play 13","Sit 10 Run Lt Play 14","Sit 10 Run Lt Play 15","Sit 10 Run Rt Play 1","Sit 10 Run Rt Play 2","Sit 10 Run Rt Play 3","Sit 10 Run Rt Play 4","Sit 10 Run Rt Play 5","Sit 10 Run Rt Play 6","Sit 10 Run Rt Play 7","Sit 10 Run Rt Play 8","Sit 10 Run Rt Play 9","Sit 10 Run Rt Play 10","Sit 10 Run Rt Play 11","Sit 10 Run Rt Play 12","Sit 10 Run Rt Play 13","Sit 10 Run Rt Play 14","Sit 10 Run Rt Play 15","Sit 10 Pass Lt Play 1","Sit 10 Pass Lt Play 2","Sit 10 Pass Lt Play 3","Sit 10 Pass Lt Play 4","Sit 10 Pass Lt Play 5","Sit 10 Pass Lt Play 6","Sit 10 Pass Lt Play 7","Sit 10 Pass Lt Play 8","Sit 10 Pass Lt Play 9","Sit 10 Pass Lt Play 10","Sit 10 Pass Lt Play 11","Sit 10 Pass Lt Play 12","Sit 10 Pass Lt Play 13","Sit 10 Pass Lt Play 14","Sit 10 Pass Lt Play 15","Sit 10 Pass Rt Play 1","Sit 10 Pass Rt Play 2","Sit 10 Pass Rt Play 3","Sit 10 Pass Rt Play 4","Sit 10 Pass Rt Play 5","Sit 10 Pass Rt Play 6","Sit 10 Pass Rt Play 7","Sit 10 Pass Rt Play 8","Sit 10 Pass Rt Play 9","Sit 10 Pass Rt Play 10","Sit 10 Pass Rt Play 11","Sit 10 Pass Rt Play 12","Sit 10 Pass Rt Play 13","Sit 10 Pass Rt Play 14","Sit 10 Pass Rt Play 15"\]/g, collection10); 
      addCollect2 = addCollect2.replace(/\[" ","Sit 11 Run Lt Play 1","Sit 11 Run Lt Play 2","Sit 11 Run Lt Play 3","Sit 11 Run Lt Play 4","Sit 11 Run Lt Play 5","Sit 11 Run Lt Play 6","Sit 11 Run Lt Play 7","Sit 11 Run Lt Play 8","Sit 11 Run Lt Play 9","Sit 11 Run Lt Play 10","Sit 11 Run Lt Play 11","Sit 11 Run Lt Play 12","Sit 11 Run Lt Play 13","Sit 11 Run Lt Play 14","Sit 11 Run Lt Play 15","Sit 11 Run Rt Play 1","Sit 11 Run Rt Play 2","Sit 11 Run Rt Play 3","Sit 11 Run Rt Play 4","Sit 11 Run Rt Play 5","Sit 11 Run Rt Play 6","Sit 11 Run Rt Play 7","Sit 11 Run Rt Play 8","Sit 11 Run Rt Play 9","Sit 11 Run Rt Play 10","Sit 11 Run Rt Play 11","Sit 11 Run Rt Play 12","Sit 11 Run Rt Play 13","Sit 11 Run Rt Play 14","Sit 11 Run Rt Play 15","Sit 11 Pass Lt Play 1","Sit 11 Pass Lt Play 2","Sit 11 Pass Lt Play 3","Sit 11 Pass Lt Play 4","Sit 11 Pass Lt Play 5","Sit 11 Pass Lt Play 6","Sit 11 Pass Lt Play 7","Sit 11 Pass Lt Play 8","Sit 11 Pass Lt Play 9","Sit 11 Pass Lt Play 10","Sit 11 Pass Lt Play 11","Sit 11 Pass Lt Play 12","Sit 11 Pass Lt Play 13","Sit 11 Pass Lt Play 14","Sit 11 Pass Lt Play 15","Sit 11 Pass Rt Play 1","Sit 11 Pass Rt Play 2","Sit 11 Pass Rt Play 3","Sit 11 Pass Rt Play 4","Sit 11 Pass Rt Play 5","Sit 11 Pass Rt Play 6","Sit 11 Pass Rt Play 7","Sit 11 Pass Rt Play 8","Sit 11 Pass Rt Play 9","Sit 11 Pass Rt Play 10","Sit 11 Pass Rt Play 11","Sit 11 Pass Rt Play 12","Sit 11 Pass Rt Play 13","Sit 11 Pass Rt Play 14","Sit 11 Pass Rt Play 15"\]/g, collection11);
      addCollect2 = addCollect2.replace(/\[" ","Sit 12 Run Lt Play 1","Sit 12 Run Lt Play 2","Sit 12 Run Lt Play 3","Sit 12 Run Lt Play 4","Sit 12 Run Lt Play 5","Sit 12 Run Lt Play 6","Sit 12 Run Lt Play 7","Sit 12 Run Lt Play 8","Sit 12 Run Lt Play 9","Sit 12 Run Lt Play 10","Sit 12 Run Lt Play 11","Sit 12 Run Lt Play 12","Sit 12 Run Lt Play 13","Sit 12 Run Lt Play 14","Sit 12 Run Lt Play 15","Sit 12 Run Rt Play 1","Sit 12 Run Rt Play 2","Sit 12 Run Rt Play 3","Sit 12 Run Rt Play 4","Sit 12 Run Rt Play 5","Sit 12 Run Rt Play 6","Sit 12 Run Rt Play 7","Sit 12 Run Rt Play 8","Sit 12 Run Rt Play 9","Sit 12 Run Rt Play 10","Sit 12 Run Rt Play 11","Sit 12 Run Rt Play 12","Sit 12 Run Rt Play 13","Sit 12 Run Rt Play 14","Sit 12 Run Rt Play 15","Sit 12 Pass Lt Play 1","Sit 12 Pass Lt Play 2","Sit 12 Pass Lt Play 3","Sit 12 Pass Lt Play 4","Sit 12 Pass Lt Play 5","Sit 12 Pass Lt Play 6","Sit 12 Pass Lt Play 7","Sit 12 Pass Lt Play 8","Sit 12 Pass Lt Play 9","Sit 12 Pass Lt Play 10","Sit 12 Pass Lt Play 11","Sit 12 Pass Lt Play 12","Sit 12 Pass Lt Play 13","Sit 12 Pass Lt Play 14","Sit 12 Pass Lt Play 15","Sit 12 Pass Rt Play 1","Sit 12 Pass Rt Play 2","Sit 12 Pass Rt Play 3","Sit 12 Pass Rt Play 4","Sit 12 Pass Rt Play 5","Sit 12 Pass Rt Play 6","Sit 12 Pass Rt Play 7","Sit 12 Pass Rt Play 8","Sit 12 Pass Rt Play 9","Sit 12 Pass Rt Play 10","Sit 12 Pass Rt Play 11","Sit 12 Pass Rt Play 12","Sit 12 Pass Rt Play 13","Sit 12 Pass Rt Play 14","Sit 12 Pass Rt Play 15"\]/g, collection12);
      addCollect2 = addCollect2.replace(/\[" ","Sit 13 Run Lt Play 1","Sit 13 Run Lt Play 2","Sit 13 Run Lt Play 3","Sit 13 Run Lt Play 4","Sit 13 Run Lt Play 5","Sit 13 Run Lt Play 6","Sit 13 Run Lt Play 7","Sit 13 Run Lt Play 8","Sit 13 Run Lt Play 9","Sit 13 Run Lt Play 10","Sit 13 Run Lt Play 11","Sit 13 Run Lt Play 12","Sit 13 Run Lt Play 13","Sit 13 Run Lt Play 14","Sit 13 Run Lt Play 15","Sit 13 Run Rt Play 1","Sit 13 Run Rt Play 2","Sit 13 Run Rt Play 3","Sit 13 Run Rt Play 4","Sit 13 Run Rt Play 5","Sit 13 Run Rt Play 6","Sit 13 Run Rt Play 7","Sit 13 Run Rt Play 8","Sit 13 Run Rt Play 9","Sit 13 Run Rt Play 10","Sit 13 Run Rt Play 11","Sit 13 Run Rt Play 12","Sit 13 Run Rt Play 13","Sit 13 Run Rt Play 14","Sit 13 Run Rt Play 15","Sit 13 Pass Lt Play 1","Sit 13 Pass Lt Play 2","Sit 13 Pass Lt Play 3","Sit 13 Pass Lt Play 4","Sit 13 Pass Lt Play 5","Sit 13 Pass Lt Play 6","Sit 13 Pass Lt Play 7","Sit 13 Pass Lt Play 8","Sit 13 Pass Lt Play 9","Sit 13 Pass Lt Play 10","Sit 13 Pass Lt Play 11","Sit 13 Pass Lt Play 12","Sit 13 Pass Lt Play 13","Sit 13 Pass Lt Play 14","Sit 13 Pass Lt Play 15","Sit 13 Pass Rt Play 1","Sit 13 Pass Rt Play 2","Sit 13 Pass Rt Play 3","Sit 13 Pass Rt Play 4","Sit 13 Pass Rt Play 5","Sit 13 Pass Rt Play 6","Sit 13 Pass Rt Play 7","Sit 13 Pass Rt Play 8","Sit 13 Pass Rt Play 9","Sit 13 Pass Rt Play 10","Sit 13 Pass Rt Play 11","Sit 13 Pass Rt Play 12","Sit 13 Pass Rt Play 13","Sit 13 Pass Rt Play 14","Sit 13 Pass Rt Play 15"\]/g, collection13);
      addCollect2 = addCollect2.replace(/\[" ","Sit 14 Lt Play 1","Sit 14 Lt Play 2","Sit 14 Lt Play 3","Sit 14 Lt Play 4","Sit 14 Lt Play 5","Sit 14 Lt Play 6","Sit 14 Lt Play 7","Sit 14 Lt Play 8","Sit 14 Lt Play 9","Sit 14 Lt Play 10","Sit 14 Lt Play 11","Sit 14 Lt Play 12","Sit 14 Lt Play 13","Sit 14 Lt Play 14","Sit 14 Lt Play 15","Sit 14 Lt Play 16","Sit 14 Lt Play 17","Sit 14 Lt Play 18","Sit 14 Lt Play 19","Sit 14 Lt Play 20","Sit 14 Rt Play 1","Sit 14 Rt Play 2","Sit 14 Rt Play 3","Sit 14 Rt Play 4","Sit 14 Rt Play 5","Sit 14 Rt Play 6","Sit 14 Rt Play 7","Sit 14 Rt Play 8","Sit 14 Rt Play 9","Sit 14 Rt Play 10","Sit 14 Rt Play 11","Sit 14 Rt Play 12","Sit 14 Rt Play 13","Sit 14 Rt Play 14","Sit 14 Rt Play 15","Sit 14 Rt Play 16","Sit 14 Rt Play 17","Sit 14 Rt Play 18","Sit 14 Rt Play 19","Sit 14 Rt Play 20"\]/g, collection14);
  var formatClass2 = JSON.parse(addCollect2);

  var container2 = document.getElementById('custom-gamecall2'),
    hot2;

  hot2 = new Handsontable(container2, {
    data: gdata2,
    minSpareCols: 0,
    minSpareRows: 0,
    maxRows: 50,
    renderAllRows: true,
    rowHeaders: true,
    colHeaders: true,
    colWidths: colWidths2,   
    manualColumnResize: true,
    manualRowResize: false,
    fillHandle: {
      autoInsertRow: false,
    },
    mergeCells: formatData2,
    cell: formatClass2,
    className: "myTable",
    contextMenuCopyPaste: true,     
    contextMenu: {
      items: {
        "copy": {name: "Copy"},
        "paste": {
          name: 'Paste',
          callback: function () {
              this.copyPaste.triggerPaste();
          }
        },
        "hsep2": "---------",
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
        "dropdowns":{
          name: "Dropdowns",
          submenu: {
            items: [
              {                
                name: $("#sit1_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit1Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:1"
              },
              {                
                name: $("#sit2_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit2Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:2"
              },
              {                
                name: $("#sit3_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit3Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:3"
              },
              {                
                name: $("#sit4_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit4Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:4"
              },
              {                
                name: $("#sit5_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit5Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:5"
              },
              {                
                name: $("#sit6_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit6Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:6"
              },     
              {                
                name: $("#sit7_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit7Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:7"
              },
              {                
                name: $("#sit8_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit8Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:8"
              },
              {                
                name: $("#sit9_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit9Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:9"
              },
              {                
                name: $("#sit10_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit10Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:10"
              },
              {                
                name: $("#sit11_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit11Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:11"
              },
              {                
                name: $("#sit12_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit12Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:12"
              },
              {                
                name: $("#sit13_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit13Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:13"
              },
              {                
                name: $("#sit14_name").text(),
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
                      this.setCellMeta(row, col, 'source', sit14Collection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:14"
              }, 
              {                
                name: 'All Plays',
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
                      this.setCellMeta(row, col, 'source', allPlaysCollection);
                    }
                  }   
                  this.render();
                }, 
                key: "dropdowns:15"
              },                                                                                                                                                                                 
              {  
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
                },
                key: "dropdowns:16"
              }
            ]
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
      $("#cell-class4").text(newX);
      var fFormat = JSON.stringify(this.mergeCells.mergedCellInfoCollection);
      $("#cell-format4").text(fFormat);
      $("#cell-class4").trigger("click")
    }     
  });

  //Re-renders table after context menu changes have been made
  $("#cell-class4").click(function() {
    var cClass4 = $("#cell-class4").text();
    var replaceClass4 = cClass4.replace(/'/g, '"');
    var formatClass4 = JSON.parse(replaceClass4);
    var cellFormat4 = $("#cell-format4").text();
    var replace4 = cellFormat4.replace(/'/g, '"');
    var formatData4 = JSON.parse(replace4);
    hot2.updateSettings({ cell: formatClass4, mergeCells: formatData4 });
    hot2.render();
  });



  $(".save-button").click(function() {
    var aposCheck = JSON.stringify(gdata1);
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
    var aposCheck2 = JSON.stringify(gdata2);
    var JSONData5 = aposCheck2.replace(/'/g, ' ');
    var JSONData6 = JSON.stringify(hot2.mergeCells.mergedCellInfoCollection);
    var cellClass2 = hot2.getCellsMeta().filter(function(meta) {
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
    var JSONData7 = JSON.stringify(cellClass2);
    
    var num_cols2 = hot2.countCols();
    var widths2 = [];
    var x2 = 0;
    for (var i = 0; i < num_cols2; i++){
      widths2.push(hot2.getColWidth(x2));
      x2++;
    }
    var JSONData8 = JSON.stringify(widths2);
    $.ajax({
      type: "PATCH",
      url: "/events/" + $("#event-id").text() + "/gamecalls/" + $("#gamecall-id").text(),
      data: {
        gamecall: {
          gdata: JSONData,
          g_format1: JSONData2,
          g_class1: JSONData3,
          col_widths1: JSONData4,
          gdata2: JSONData5,
          g_format2: JSONData6,
          g_class2: JSONData7,
          col_widths2: JSONData8          
        }
      },
      dataType: "json",
      success: function() {
        alert("Your Sheet has been saved");
      }
    });
    $("#data1").text(JSONData);
    $("#cell-format1").text(JSONData2);
    $("#cell-class1").text(JSONData3);
    $("#col-widths1").text(JSONData4);
    $("#data2").text(JSONData5);
    $("#cell-format2").text(JSONData6);
    $("#cell-class2").text(JSONData7);
    $("#col-widths2").text(JSONData8);        
  });

  var resetWidths = '[274,274,274,274]'

  //Reset Colum Widths (page one) button
  $("#reset-widths1-button").click(function() {
    if (confirm('------------------------------------------------------------\nAre you sure? This will restore the width of each column to its original size.\n------------------------------------------------------------\nIf the column sizes do not revert after clicking OK, please refresh the page.\n------------------------------------------------------------')) {
      var resetWidths = $("#orig-col-widths1").text();
      $.ajax({
        type: "PATCH",
        url: "/events/" + $("#event-id").text() + "/gamecalls/" + $("#gamecall-id").text(),
        data: {
          gamecall: {
            col_widths1: resetWidths
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

  //Reset Colum Widths (page two) button
  $("#reset-widths2-button").click(function() {
    if (confirm('------------------------------------------------------------\nAre you sure? This will restore the width of each column to its original size.\n------------------------------------------------------------\nIf the column sizes do not revert after clicking OK, please refresh the page.\n------------------------------------------------------------')) {
      var resetWidths = $("#orig-col-widths2").text();
      $.ajax({
        type: "PATCH",
        url: "/events/" + $("#event-id").text() + "/gamecalls/" + $("#gamecall-id").text(),
        data: {
          gamecall: {
            col_widths2: resetWidths
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