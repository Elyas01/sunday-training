public  class Students {
    public string firstName;
    public string lastName;
    public Integer classyear;
    public string major;
    public string generateReport(){
        system.debug('Report Generated for ' + firstName +' ' + lastName + 'of' + classyear);
        return major;
    }
}
