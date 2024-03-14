public  class Sample {
    // Static 
    public static string samplestaticstring;
    public static void staticMethod(){
        system.debug('Static Method');
        system.debug(samplestaticstring);
    }

    public void nonStaticMethod(){
        system.debug('Non static Method');
    }
    //non-Static 
    public string sampleNonstaticstring;
}