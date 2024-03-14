Students st1 = new Students();
st1.firstName='Fane';
st1.lastName='Bridgen';
st1.classyear= 1981;
st1.major='Developer';
string reportReturn = st1.generateReport();
system.debug('report return' + reportReturn);