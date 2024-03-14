public  class PrimitiveDataType {

    public void printBasicDataType(){
        string batchName='Falons11';
        system.debug('Batch Name is ' + batchName);
    }

    public void printBasicDataType2( string el){

        string batchName = el;
        system.debug('Batch Name is ' + BatchName);
    }

    public void printBasicDataType3(string ba, Integer candidates, Boolean an){

        string batchName=ba;
        Integer candidate=Candidates;
        Boolean graduated=an;

        system.debug('Batch Name Is ' + batchName);
        system.debug('Total candidates ' + candidate);
        system.debug('Graduated ?' + Graduated);
    }

  
}