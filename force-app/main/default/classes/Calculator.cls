public  class Calculator {

    Public void printNewMessage(string msg){
        //this is Inside of the method
        //we use msg (variable name of parameter Here)
        system.debug(msg);
    }
       
    public string printAndReturnMessage(string msg){
        string returnStr=msg+ 'OK Cool';
        return returnStr;
    }
    public Integer add(Integer a, Integer b ){
        Integer sum= a+b;
        return sum;
    }
    public Integer add(Integer i, integer j, Integer k){
        system.debug('inside add method with 3 params');
        Integer sum=i+j+k;
        return sum;
    }
}
