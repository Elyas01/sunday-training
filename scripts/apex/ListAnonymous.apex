list<string> shoppinglist = new list<string>();
shoppinglist.add('Iphone');
shoppinglist.add('Airpod');
shoppinglist.add('Macbook');
shoppinglist.add('Ipad');
shoppinglist.add('Wireless Charger');
system.debug(shoppinglist);

string item2=shoppinglist.get(2);
string item4=shoppinglist.get(4);
system.debug('item 2 ' + item2);
system.debug('item 4 ' + item4);

List<Date> birthdatelist= new List<date>();
date bt=date.newInstance(1998, 12, 30);
system.debug(bt);
date bt2=date.newInstance(1997, 1, 3);
system.debug(bt2);
date bt3=date.newInstance(1999, 7, 9); 
system.debug(bt3);
birthdatelist.add(date.newInstance(1999, 1 , 3));

List<Integer> num=new List<Integer>{1,3,5,7,9};
system.debug(num);