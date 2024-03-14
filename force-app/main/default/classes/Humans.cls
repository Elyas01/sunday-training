public class Humans {
    public string fullName(String firstName, String lastName){
        string fullName='';

        fullName =firstName.toUpperCase();
        fullName += '' + lastName.toUpperCase();


        return fullName;
    }
    public Integer age(Date birthtdate){
        integer a=0;
        date today=date.today();
        Integer dayage= birthtdate.daysBetween(today);
        a = Integer.valueOf(dayage/365);
        

        return a;
    }
}