public class SetDemo9 {
    public static void checkOdd(Set<Integer> sint){
        
        for( Integer i : sint){
            if(Math.mod(i, 2) ==0 ){
                System.debug(i+' IS NOT ODD');
            }else{
                System.debug(i+' IS ODD');
            }
        }
    }
}