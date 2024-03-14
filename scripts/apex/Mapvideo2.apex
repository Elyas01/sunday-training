Map<String,Integer> itemQuantityMap= new Map<String,Integer>();
itemQuantityMap.put('Apple', 5);
itemQuantityMap.put('Orange', 6);
itemQuantityMap.put('Football', 1);
itemQuantityMap.put('LED', 3);
itemQuantityMap.put('Notebook', 12);
itemQuantityMap.put('Pen', 25);

Integer sizeMap=itemQuantityMap.size();
system.debug(sizeMap + ' Items to shop ');

// We are getting VALUE(integer) of a particular KEY(string)
//string getQuantityOf='Apple';
//Integer quantityIs=itemQuantityMap.get(getQuantityOf);
Integer quantityIs=itemQuantityMap.get('Apple');
system.debug(quantityIs + ' Apple to buy');

string getQuantityOf='Pen';
Integer quantityIs_2=itemQuantityMap.get(getQuantityOf);
system.debug(getQuantityOf + ' Quantity is ' + quantityIs_2);

string getQuantityOf_3='Apples';

if (itemQuantityMap.containsKey(getQuantityOf_3)) {
    Integer q4= itemQuantityMap.get(getQuantityOf_3);
    system.debug(getQuantityOf_3 + ' Quantity is ' + q4);
}else {
    system.debug(getQuantityOf_3 + ' Are not in the map ');
}

//Keys ---> SET<Key_Datatype> ---> KeySet();
//Values ---> List<Key_Datatype> ---> Values();

Set<String> items= itemQuantityMap.keySet();
System.debug('All items are ' + items);

List<Integer> quantities=itemQuantityMap.values();
Integer sumOfQ=0;
for (Integer q : quantities) {
    sumOfQ += q;
}
system.debug('All items are ' + sumOfQ);