public  class SampleClass {
   //Static String
    public static string samplestaticstring;

    // Non-Static String
    public string samplestring;

    public static void samplestaticmethod(){
        system.debug('static method'); //satic method
        system.debug(samplestaticstring);
        
    }

    public void samplemethod(){
        system.debug('cls');
        system.debug(samplestring);
    }

}