public  class ClassB {
    public ClassB() {

        if(GeneralSettings.printFlag!='off'){
        system.debug('Class B constructor');
        }
    }

    public ClassB(string p){

        if(GeneralSettings.printFlag!='off'){
        system.debug('Class B1 Param Constructor, ' + p);
        }
    }

    public static void classmethodb1(){
        if(GeneralSettings.printFlag!='off'){
        system.debug('Class method b1 print');
        }
    }
}