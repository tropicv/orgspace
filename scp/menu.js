shift=0;
if((navigator.userAgent.toLowerCase().indexOf("msie 5")>-1) && (navigator.userAgent.toLowerCase().indexOf("mac")>-1)) shift=12;

menu_x_plus[1]=33+shift; menu_y_plus[1]=15+shift;
menu_x_plus[2]=23+shift; menu_y_plus[2]=15+shift;
menu_x_plus[3]=23+shift; menu_y_plus[3]=15+shift;
menu_x_plus[4]=23+shift; menu_y_plus[4]=15+shift;
menu_x_plus[5]=18+shift; menu_y_plus[5]=15+shift;

CreateLayer(make_txt(prod), 1, getY(document.dot1)+menu_y_plus[1], getX(document.dot1)+menu_x_plus[1], 140);
CreateLayer(make_txt(uslg), 2, getY(document.dot2)+menu_y_plus[2], getX(document.dot2)+menu_x_plus[2], 160);
CreateLayer(make_txt(khow), 3, getY(document.dot3)+menu_y_plus[3], getX(document.dot3)+menu_x_plus[3], 140);
CreateLayer(make_txt(buy), 4, getY(document.dot4)+menu_y_plus[4], getX(document.dot4)+menu_x_plus[4], 140);
CreateLayer(make_txt(org), 5, getY(document.dot5)+menu_y_plus[5], getX(document.dot5)+menu_y_plus[5], 140);

load_style();

init=1;
