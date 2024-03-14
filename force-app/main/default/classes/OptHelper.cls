public class OptHelper {
    public Decimal largestOutOfTwonumbers(Decimal a, Decimal b){
        Decimal maxNum;

        if (a>=b) {
            maxNum=a;
            
        }else {
            maxNum=b;
        }
        return maxNum;
    }

    public Decimal smallestOutOfThreeNun(Decimal x, Decimal y, Decimal z){
        Decimal minnum;

        if ((x<y) && (X<z)) {
            minnum=x;
        }else if ((y<X) && (y<z)) {
            minnum=y;
        }else if ((z<x) && (z<y)) {
            minnum=z;
        }
        return minnum;
    }

    public Integer sumOfPositiveNum(Integer d1){
        Integer sum;
        if (d1<0) {
            sum=null;
            system.debug('We are not calculating the sum for negative numbers');
        }else {
            sum=0;
        }

        return sum;
    }
}