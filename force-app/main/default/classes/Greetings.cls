public  class Greetings {
   public string language = '';

   public string greethello(){
    string greet = '';
    if (language == 'Dari') {
        Greet = 'Salam';
    }else if (language=='Turkish') {
        greet = 'Merhaba';
    }else if (language == 'Spanish ') {
        greet = ' Hola';
    }else {
        greet='Hello';
    }
    return greet;
   }
   public string greethello(Integer n){
    string greet=greethello();
    string finalreturn=greet;

    for (Integer i = 1; i < n; i++) {
        finalreturn = finalreturn + ' ' +greet;
    }
    return finalreturn;
   }
}