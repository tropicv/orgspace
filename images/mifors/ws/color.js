var ColorSet = new Array(
'ffffff', 'ccffff', 'ccccff', 'ccccff', 'ccccff', 'ccccff', 'ccccff', 'ccccff', 'ccccff', 'ccccff', 'ccccff', 'ffccff', 'ffcccc', 'ffcccc', 'ffcccc', 'ffcccc', 'ffcccc', 'ffcccc', 'ffcccc', 'ffcccc', 'ffcccc', 'ffffcc', 'ccffcc', 'ccffcc', 'ccffcc', 'ccffcc', 'ccffcc', 'ccffcc', 'ccffcc', 'ccffcc', 'ccffcc',
'cccccc', '99ffff', '99ccff', '9999ff', '9999ff', '9999ff', '9999ff', '9999ff', '9999ff', '9999ff', 'cc99ff', 'ff99ff', 'ff99cc', 'ff9999', 'ff9999', 'ff9999', 'ff9999', 'ff9999', 'ff9999', 'ff9999', 'ffcc99', 'ffff99', 'ccff99', '99ff99', '99ff99', '99ff99', '99ff99', '99ff99', '99ff99', '99ff99', '99ffcc',
'cccccc', '66ffff', '66ccff', '6699ff', '6666ff', '6666ff', '6666ff', '6666ff', '6666ff', '9966ff', 'cc66ff', 'ff66ff', 'ff66cc', 'ff6699', 'ff6666', 'ff6666', 'ff6666', 'ff6666', 'ff6666', 'ff9966', 'ffcc66', 'ffff66', 'ccff66', '99ff66', '66ff66', '66ff66', '66ff66', '66ff66', '66ff66', '66ff99', '66ffcc',
'999999', '33ffff', '33ccff', '3399ff', '3366ff', '3333ff', '3333ff', '3333ff', '6633ff', '9933ff', 'cc33ff', 'ff33ff', 'ff33cc', 'ff3399', 'ff3366', 'ff3333', 'ff3333', 'ff3333', 'ff6633', 'ff9933', 'ffcc33', 'ffff33', 'ccff33', '99ff33', '66ff33', '33ff33', '33ff33', '33ff33', '33ff66', '33ff99', '33ffcc',
'999999', '00ffff', '00ccff', '0099ff', '0066ff', '0000ff', '0000ff', '0000ff', '6600ff', '9900ff', 'cc00ff', 'ff00ff', 'ff00cc', 'ff0099', 'ff0066', 'ff0033', 'ff0000', 'ff3300', 'ff6600', 'ff9900', 'ffcc00', 'ffff00', 'ccff00', '99ff00', '66ff00', '00ff00', '00ff00', '00ff00', '00ff66', '00ff99', '00ffcc',
'666666', '00cccc', '00cccc', '0099cc', '0066cc', '0033cc', '0000cc', '3300cc', '6600cc', '9900cc', 'cc00cc', 'cc00cc', 'cc00cc', 'cc0099', 'cc0066', 'cc0033', 'cc0000', 'cc3300', 'cc6600', 'cc9900', 'cccc00', 'cccc00', 'cccc00', '99cc00', '66cc00', '33cc00', '00cc00', '00cc33', '00cc66', '00cc99', '00cccc',
'666666', '009999', '009999', '009999', '006699', '003399', '000099', '330099', '660099', '990099', '990099', '990099', '990099', '990099', '990066', '990033', '990000', '993300', '996600', '999900', '999900', '999900', '999900', '999900', '669900', '339900', '009900', '009933', '009966', '009999', '009999',
'333333', '006666', '006666', '006666', '006666', '003366', '000066', '330066', '660066', '660066', '660066', '660066', '660066', '660066', '660066', '660033', '660000', '663300', '666600', '666600', '666600', '666600', '666600', '666600', '666600', '336600', '006600', '006633', '006666', '006666', '006666',
'000000', '003333', '003333', '003333', '003333', '003333', '000033', '330033', '330033', '330033', '330033', '330033', '330033', '330033', '330033', '330033', '330000', '333300', '333300', '333300', '333300', '333300', '333300', '333300', '333300', '333300', '003300', '003333', '003333', '003333', '333333'
);

function WriteColorTab() {
  for (i = 0; i < 9; i++) {
    document.write('<tr>');
    for (j = 0; j < 30; j++) {
      document.write('<td bgcolor=\"#' + ColorSet[j+i*31] + '\" width=\"16\" height=\"16\">&nbsp;&nbsp;&nbsp;&nbsp;</td>');
    }
    document.write('</tr>');
  }
}

function TabMouseOver() {
  document.all['TempColor'].bgColor = event.srcElement.bgColor;
}

function TabMouseOut() {
  document.all['TempColor'].bgColor = "#ffffff";
}

function SelectColor() {
  document.all['SelColor'].bgColor = document.all['TempColor'].bgColor;
}

function SaveColor() {
  window.returnValue = document.all['SelColor'].bgColor;
  window.close();
}