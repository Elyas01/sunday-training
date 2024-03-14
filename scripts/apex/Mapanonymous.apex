Map<String,Integer> getquantity= new Map<String,Integer>();
getquantity.put('Apple', 5);
getquantity.put('Orange', 6);
getquantity.put('Football', 1);
getquantity.put('LED', 3);
getquantity.put('Notebook', 12);
getquantity.put('Pen', 25);


Integer sizeofmap = getquantity.size();
System.debug('Size of map is ' + sizeofmap);
/*String getquantityof='Apple';
Integer getquantityof1= getquantity.get(getquantityof);
System.debug(getquantityof + ' Quantity is ' + getquantityof1);*/
Integer getquantityof1= getquantity.get('Apple');
System.debug('Apple Quantity is ' + getquantityof1);

String getquantityof='Pen';
Integer getquantityof2= getquantity.get(getquantityof);
System.debug(getquantityof + ' Quantity is ' + getquantityof2);

String getquantity3='Apples';
Boolean contains= getquantity.containsKey(getquantity3);
if(contains){
    Integer getquantity3_1=getquantity.get(getquantity3);
    System.debug(getquantity3 + ' quantity is ' + getquantity3_1);
}else{
    System.debug(getquantity3 + ' Not in the store sorry ');
}

// Keys--> SET --> KeySet()
//Values--> List --> Values()

set<string> storekitems = getquantity.keySet();
system.debug('All items are ' + storekitems);

List<Integer> quantities= getquantity.values();
Integer sumof=0;
for(Integer q: quantities){
    sumof += q;
} System.debug(sumof);
