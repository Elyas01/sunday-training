public class ValidateAddress {
    public void ValidateHomeAddress(){

        string homeName='Sweet Home';
        system.debug('Home Name ;' + HomeName);
        string streetName='Wilcox';
        system.debug('Street Name '+ streetName);
        string cityName='Boston';
        system.debug('City Name ' + CityName);
        string stateName='Massachusetts';
        system.debug('State Name '+ StateName );
        string stateISOcode='MA';
        system.debug('State ISO Code ' + StateISOcode);
        String country='United States';
        system.debug('Country ' + Country);
        string countryISOcode='USA';
        system.debug('Country ISO Code ' + CountryISOcode);

        Integer numofltrs=streetName.length();
        system.debug('Number of letters in the street name ' + numofltrs);

        boolean containshome=streetName.contains('house');
        system.debug('Contains House Name :' + containshome);

        Boolean containscode=streetName.containsIgnoreCase('StateISOcode');
        system.debug('Contains The state ISO Code ' + containscode);

        string statetoupercase=StateISOcode.toUpperCase();
        system.debug('To Upper Case ' +statetoupercase);

        String ctrytoupercase=CountryISOcode.toUpperCase();
        system.debug('Country ISO Code To Upper Case ' + ctrytoupercase);

        string cttoupercase=Country.toUpperCase();
        system.debug('Country To Upper Case ' + cttoupercase);

        string citylwr=CityName.toLowerCase();
        system.debug('City to lower case ' + citylwr);

        string statelwr=StateName.toLowerCase();
        system.debug('State To LowerCase ' +statelwr);

        string concatenate=HomeName + ' ' + streetName + ' ' + CityName + ' ' + StateName + ' ' + Country;
        system.debug('My Full Adress Is ' + concatenate);
    }
  
}
