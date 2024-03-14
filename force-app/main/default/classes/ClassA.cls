public class ClassA {
    public ClassA() {

        if(GeneralSettings.printFlag!='off'){
        system.debug('Class A constructor');
        }
    }

    public ClassA(string p){

        if(GeneralSettings.printFlag!='off'){
        system.debug('Class A1 Param Constructor, ' + p);
        }
    }

    public static void classmethod1(){
        if(GeneralSettings.printFlag!='off'){
        system.debug('Class method 1 print');
        }
    }
}