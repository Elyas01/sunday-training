
sample.staticMethod();

//how to access static variables
sample.samplestaticstring='Static variable';
system.debug(sample.samplestaticstring);
//how to access non static? we make instance of the class

sample s= new Sample();
s.nonStaticMethod();
s.sampleNonstaticstring='non static';
system.debug(s.sampleNonstaticstring);